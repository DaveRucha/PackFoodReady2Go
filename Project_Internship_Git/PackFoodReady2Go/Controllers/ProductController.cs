using Microsoft.AspNetCore.Mvc;
using PackFoodReady2Go.Core;
using PackFoodReady2Go.Infrastructure.Implementations;
using PackFoodReady2Go.Infrastructure.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using Stripe.Checkout;
using Stripe;
using Microsoft.AspNetCore.Mvc.Rendering;
using Stripe.Climate;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using NReco.PdfGenerator;
using Microsoft.CodeAnalysis;
using Humanizer;
using System.Drawing.Printing;
using Microsoft.Build.Evaluation;


namespace PackFoodReady2Go.UI.Controllers
{
	public class ProductController : Controller
	{
		private readonly IProductRepository _productRepository;
		private readonly ICustomerRepository customerRepository;
		private readonly IHttpContextAccessor httpContextAccessor;
		private readonly StripeSettings stripeSettings;
		public string SessionId { get; set; }
		public ProductController(IProductRepository _productRepository, IHttpContextAccessor httpContextAccessor, ICustomerRepository customerRepository, IOptions<StripeSettings> _stripeSettings)
		{
			this._productRepository = _productRepository;
			this.httpContextAccessor = httpContextAccessor;
			this.customerRepository = customerRepository;
			stripeSettings = _stripeSettings.Value;

		}
		public IActionResult Index(string searchText)
		{
			var products = string.IsNullOrEmpty(searchText)
				? _productRepository.GetAll() // or however you get all products if no search
				: _productRepository.SearchProducts(searchText);
			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;

			return View(products);
		}

		public IActionResult Search(string searchTerm)
		{
			if (string.IsNullOrWhiteSpace(searchTerm))
			{
				// Handle empty search term if needed
				return RedirectToAction("Index"); // Redirect to product listing page
			}
			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			var searchResults = _productRepository.SearchProducts(searchTerm);
			return View("Index", searchResults); // Assuming "Index" is your product listing view
		}
		[HttpPost]
		public IActionResult WriteReview(Core.Review review)
		{
			if (ModelState.IsValid)
			{
				review.CustomerName = review.CustomerName; // Get the customer name from the session or authentication
				review.CustomerEmail = review.CustomerEmail; // Get the customer email from the session or authentication
				review.ReviewDate = DateTime.Now;

				_productRepository.AddReview(review);

				return RedirectToAction("SingleProduct");
			}

			return View(review);
		}
		[HttpPost]
		public IActionResult WriteReviews(Core.Review review)
		{
			var ProductIdReview = httpContextAccessor.HttpContext.Session.GetInt32("ProductIdReview");

			var CategoryIdReview = httpContextAccessor.HttpContext.Session.GetInt32("CategoryIdReview");

			var count = _productRepository.GetReviewsByEmail(review.CustomerEmail, ProductIdReview);

			if (ModelState.IsValid)
			{
				if (count == 0)
				{

					review.CustomerName = review.CustomerName; // Get the customer name from the session or authentication
					review.CustomerEmail = review.CustomerEmail; // Get the customer email from the session or authentication
					review.ReviewDate = DateTime.Now;

					_productRepository.AddReview(review);
					httpContextAccessor.HttpContext.Session.SetString("ReviewFail", "false");
					return RedirectToAction("ProductView", new { Product_id = ProductIdReview, CategoryID = CategoryIdReview });

				}

			}
			httpContextAccessor.HttpContext.Session.SetString("ReviewFail", "true");
			return RedirectToAction("ProductView", new { Product_id = ProductIdReview, CategoryID = CategoryIdReview });

		}

		[HttpGet]
		public IActionResult SingleProduct()
		{

			var product = _productRepository.GetProduct();

			var reviews = _productRepository.GetReviewsByProductId(product.ProductID);
			if (product == null)
			{
				return NotFound(); // Return 404 Not Found if product with given ID is not found
			}

			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			var averageRating = _productRepository.GetAverageRatingByProductId(product.ProductID);

			var relatedProducts = _productRepository.GetRelatedProducts(3);
			return View(new ProductReviewViewModel { Products = product, Reviews = reviews, RelatedProducts = relatedProducts, AverageRating = averageRating });


		}

		[HttpGet]
		public IActionResult ProductView(int Product_id, int CategoryID)
		{
			var product = _productRepository.GetProductById(Product_id);

			var reviews = _productRepository.GetReviewsByProductId(product.ProductID);
			if (product == null)
			{
				return NotFound();
			}
			ViewData["Product"] = product;
			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			var relatedProducts = _productRepository.GetRelatedProducts(CategoryID);
			var averageRating = 0;
			if (reviews.Count() > 0)
			{
				averageRating = _productRepository.GetAverageRatingByProductId(Product_id);
			}
			httpContextAccessor.HttpContext.Session.SetInt32("ProductIdReview", Product_id);
			httpContextAccessor.HttpContext.Session.SetInt32("CategoryIdReview", CategoryID);

			return View(new ProductReviewViewModel { Products = product, Reviews = reviews, RelatedProducts = relatedProducts, AverageRating = averageRating });

		}


		[HttpGet]
		public IActionResult Shop(int Filter = 0)
		{
			IEnumerable<Products> products;

			if (!Filter.Equals(0))
			{
				switch (Filter)
				{
					case 1:
						products = _productRepository.GetAllProducts().OrderBy(p => p.UnitPrice - (p.UnitPrice * (p.Discount / 100)));
						break;
					case 2:
						products = _productRepository.GetAllProducts().OrderByDescending(p => p.UnitPrice - (p.UnitPrice * (p.Discount / 100)));
						break;
					case 3:
						products = _productRepository.GetAllProducts()
		  .OrderBy(p => p.Reviews
			  .Where(r => r.Rating != 0)
			  .Select(r => r.Rating)
			  .DefaultIfEmpty(0)
			  .Average());
						break;
					case 4:
						products = _productRepository.GetAllProducts()
	   .OrderByDescending(p => p.Reviews
		   .Where(r => r.Rating != 0)
		   .Select(r => r.Rating)
		   .DefaultIfEmpty(0)
		   .Average());
						break;
					default:
						products = _productRepository.GetAllProducts();
						break;
				}
			}
			else
			{
				products = _productRepository.GetAllProducts();
			}

			var categoryname = _productRepository.GetCategoryNames();

			ViewData["CategoryNames"] = categoryname;
			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			return View(products);
		}

		[HttpGet]
		public IActionResult AddInWishlist(int Customer_id, int Product_id)
		{
			_productRepository.AddToWishlist(Customer_id, Product_id);

			return RedirectToAction("ShowWishlist", new { userId = Customer_id });
		}
		[HttpGet]
		public IActionResult DisplayProductByCategory(string? CategoryName, int Filter = 0)
		{

			IEnumerable<Products> products;

			if (!Filter.Equals(0))
			{
				switch (Filter)
				{
					case 1:
						products = _productRepository.GetProductByCategory(CategoryName).OrderBy(p => p.UnitPrice - (p.UnitPrice * (p.Discount / 100)));
						break;
					case 2:
						products = _productRepository.GetProductByCategory(CategoryName).OrderByDescending(p => p.UnitPrice - (p.UnitPrice * (p.Discount / 100)));
						break;

					default:
						products = _productRepository.GetProductByCategory(CategoryName);
						break;
				}
			}
			else
			{
				products = _productRepository.GetProductByCategory(CategoryName);
			}



			var categoryname = _productRepository.GetCategoryNames();

			ViewData["CategoryNames"] = categoryname;
			ViewData["CategoryTitle"] = CategoryName;
			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			return View(products);
		}
		[HttpGet]
		public IActionResult OrderHistory(int userId)
		{
			var orders = _productRepository.GetOrder(userId);

			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			return View(orders);

		}
		[HttpGet]
		public async Task<IActionResult> DeleteFromWishlist(int WishlistID, int CustomerID)
		{
			await _productRepository.DeleteFromWishlist(WishlistID, CustomerID);
			return RedirectToAction("ShowWishlist", new { userId = CustomerID });// Redirect back to the wishlist page

		}

		[HttpGet]
		public async Task<IActionResult> AddInCart(int Customer_id, int Product_id, int Quantity)
		{

			_productRepository.AddToCart(Customer_id, Product_id, Quantity);

			string? customeremail = HttpContext.Session.GetString("UserEmail");
			var cartTotal = await customerRepository.GetCartRecordCount(customeremail);

			httpContextAccessor.HttpContext.Session.SetInt32("cartTotal", cartTotal);

			return RedirectToAction("ShowCart", new { userId = Customer_id });
		}

		[HttpGet]
		public async Task<IActionResult> ShowWishlist(int userId)
		{
			var wishlist = await _productRepository.GetWishlist(userId);
			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;

			string s = "Empty";
			if (wishlist != null && wishlist.Any())
			{
				ViewData["Empty Cart"] = null;
			}
			else
			{
				ViewData["Empty Cart"] = s;
			}
			return View(wishlist);

		}

		[HttpGet]
		public async Task<IActionResult> ShowCart(int userId)
		{
			var cartItems = await _productRepository.GetCart(userId);

			string s = "Empty";
			if (cartItems != null && cartItems.Any())
			{
				ViewData["Empty Cart"] = null;
			}
			else
			{
				ViewData["Empty Cart"] = s;
			}
			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			return View(cartItems);

		}
		[HttpGet]
		public async Task<IActionResult> Checkout()
		{
			var cid = httpContextAccessor.HttpContext.Session.GetInt32("UserId");
			var cartItems = await _productRepository.GetCart(cid);

			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;


			if (cartItems != null && cartItems.Any())
			{

				string subtotal = Request.Query["subtotal"];
				string discount = Request.Query["discount"];
				string total = Request.Query["total"];
				string discountCoupon = null;
				decimal parseDiscount = 0;

				httpContextAccessor.HttpContext.Session.SetString("subtotal", subtotal);
				httpContextAccessor.HttpContext.Session.SetString("discount", discount);
				httpContextAccessor.HttpContext.Session.SetString("total", total);

				if (!string.IsNullOrEmpty(subtotal))
				{
					discountCoupon = HttpContext.Session.GetString("AppliedCouponDiscount");
					if (discountCoupon != null)
					{
						if (!decimal.TryParse(discountCoupon, out parseDiscount))
						{
							return BadRequest("Invalid amount format.");
						}
					}
				}

				// Calculate subtotal, discount, and total
				decimal _subtotal = 0;
				decimal _sub = 0;
				decimal _totalDiscount = 0;
				foreach (var item in cartItems)
				{
					_subtotal += item.Quantity * item.Products.UnitPrice;
					_totalDiscount += item.Products.Discount;
					decimal divi = item.Products.Discount / 100;
					decimal multi = item.Products.UnitPrice * divi;
					decimal temp= item.Products.UnitPrice - multi;
					decimal temp1= temp* item.Quantity;
					_sub += temp1;
					if (discountCoupon != null)
					{
						_totalDiscount += parseDiscount;
					}
				}
				decimal _total = _sub;



				ViewData["subtotal"] = _subtotal;
				ViewData["discount"] = _totalDiscount;
				ViewData["total"] = _total;
				ViewData["Empty Cart"] = null;

			}
			else
			{
				ViewData["Empty Cart"] = "empty";
			}

			string? customeremail = HttpContext.Session.GetString("UserEmail");
			var cartTotal = await customerRepository.GetCartRecordCount(customeremail);

			httpContextAccessor.HttpContext.Session.SetInt32("cartTotal", cartTotal);

			var viewModel = new ShippingAddressViewModel
			{
				Cart = cartItems
			};

			return View(viewModel);

		}



		[HttpPost]
		public async Task<IActionResult> Checkout(ShippingAddressViewModel viewModel)
		{
			//order table insert null thay che etle total sub ni values nai avto checkout mathi billing valu page
			//	
			if (ModelState.IsValid)
			{
				var cid = httpContextAccessor.HttpContext.Session.GetInt32("UserId");
				var cartItems = await _productRepository.GetCart(cid);
				var shippingAddress = new ShippingAddress
				{
					CustomerID = cid,
					FirstName = viewModel.FirstName,
					LastName = viewModel.LastName,
					Email = viewModel.EmailAddress,
					Mobile = viewModel.Phone,
					Address = viewModel.Address,
					Country = viewModel.Country,
					State = viewModel.State,
					City = viewModel.City,
					PostCode = viewModel.PostCode,
				};

				// Add the shipping address to the database using the repository
				_productRepository.AddShippingAddress(shippingAddress);

				string subtotal = Request.Form["_subtotal"];
				string discount = Request.Form["_discount"];
				string total = Request.Form["_total"];

				var Order = new Orders
				{
					CustomerID = cid,
					TotalAmount = total,
					SubTotal = subtotal,
					Discount = discount,
					OrderDate = DateTime.Now
				};
				_productRepository.AddOrder(Order);
				int order_id = _productRepository.GetOrderId();
				foreach (var item in cartItems)
				{
					var OrderDetails = new OrderDetails
					{
						OrderID = order_id,
						ProductID = item.ProductID,
						Quantity = item.Quantity,
						UnitPrice = item.Products.UnitPrice,
					};
					_productRepository.AddOrderDetails(OrderDetails);
				}

				viewModel = new ShippingAddressViewModel
				{
					Cart = cartItems
				};
				_productRepository.EmptyCart(cid);

				httpContextAccessor.HttpContext.Session.SetInt32("OrderId", order_id);

				// Redirect to a success page or perform other actions
				return RedirectToAction("MakePayment", "Product", new { amount = total });
			}
			string? customeremail = HttpContext.Session.GetString("UserEmail");
			var cartTotal = await customerRepository.GetCartRecordCount(customeremail);
			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			httpContextAccessor.HttpContext.Session.SetInt32("cartTotal", cartTotal);

			return View(viewModel);

		}
		public IActionResult MakePayment(string amount)
		{
			string? customeremail = HttpContext.Session.GetString("UserEmail");
			string? customername = HttpContext.Session.GetString("UserName");
			var currency = "inr"; // Currency code
			var successUrl = "https://localhost:44371/Product/Sucess";

			var cancelUrl = "https://localhost:44371/Product/Cancel";
			StripeConfiguration.ApiKey = stripeSettings.SecretKey;
			decimal parsedAmount;
			if (!decimal.TryParse(amount, out parsedAmount))
			{
				return BadRequest("Invalid amount format.");
			}

			var options = new SessionCreateOptions
			{
				PaymentMethodTypes = new List<string>
				{
					"card"
				},
				LineItems = new List<SessionLineItemOptions>
				{
					new SessionLineItemOptions
					{
						PriceData = new SessionLineItemPriceDataOptions
						{
							Currency = currency,
							UnitAmount = (long)(parsedAmount * 100),
							ProductData = new SessionLineItemPriceDataProductDataOptions
							{
								Name = "Payment",
								Description = "Total Amount to be paid"
							}
						},
						Quantity = 1
					}
				},
				Mode = "payment",
				SuccessUrl = successUrl,
				CancelUrl = cancelUrl,

				Customer = _productRepository.CreateCustomer(customeremail, customername), // Provide customer ID here
				BillingAddressCollection = "required",
			};

			var service = new SessionService();
			var session = service.Create(options);
			SessionId = session.Id;
			return Redirect(session.Url);

		}
		public async Task<IActionResult> Sucess()
		{
			StripeConfiguration.ApiKey = stripeSettings.SecretKey;

			try
			{
				// Retrieve payments using Stripe API
				var paymentService = new PaymentIntentService();
				var paymentIntents = paymentService.List(new PaymentIntentListOptions
				{
					Limit = 1, // Limit the result to 1 to get only the latest payment
							   // You can also specify other options like sorting if necessary
				});

				if (paymentIntents == null || paymentIntents.Data == null || !paymentIntents.Data.Any())
				{
					Console.WriteLine("No payment intents data received from Stripe.");
					return View("Error");
				}
				var latestPaymentIntent = paymentIntents.Data.First();
				var cid = httpContextAccessor.HttpContext.Session.GetInt32("UserId");
				// Process payment data and populate view model
				var payment = new Payment
				{
					Amount = int.Parse(latestPaymentIntent.Amount.ToString().Substring(0, latestPaymentIntent.Amount.ToString().Length - 2)),
					Currency = latestPaymentIntent.Currency,
					Status = latestPaymentIntent.Status,
					PaymentMethod = latestPaymentIntent.PaymentMethodTypes.FirstOrDefault(), // You may need to adjust this based on your data model
					CreatedAt = DateTime.UtcNow,
					CustomerId = cid
					// Set other properties as needed
				};
				_productRepository.Payment_trial(new List<Payment> { payment });
				return View();
			}
			catch (StripeException ex)
			{
				// Handle Stripe API errors
				Console.WriteLine($"Stripe Error: {ex.Message}");
				return View("Error"); // Display an error page
			}


		}
		public IActionResult Cancel()
		{
			return View();
		}
		[HttpGet]
		public async Task<IActionResult> DeleteFromCart(int CartID, int CustomerID)
		{
			await _productRepository.DeleteFromCart(CartID, CustomerID);
			string? customeremail = HttpContext.Session.GetString("UserEmail");
			var cartTotal = await customerRepository.GetCartRecordCount(customeremail);

			httpContextAccessor.HttpContext.Session.SetInt32("cartTotal", cartTotal);

			return RedirectToAction("ShowCart", new { userId = CustomerID });// Redirect back to the wishlist page

		}


		[HttpPost]
		public IActionResult UpdateQuantity(int cartId, int quantity)
		{
			// Update the quantity of the product in the cart
			_productRepository.UpdateQuantity(cartId, quantity);

			return Ok(); // Return a success response
		}

		//Comapare


		[HttpGet]
		public IActionResult CompareProducts()
		{
			var products = _productRepository.Get_Products();
			ViewBag.ProductList = new SelectList(products, "ProductID", "ProductName");

			var viewModel = new ProductCompare
			{
				AvailableProducts = products
			};

			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			return View(viewModel);
		}

		[HttpPost]
		public IActionResult CompareProducts(ProductCompare viewModel)
		{
			if (viewModel.SelectedProduct1Id == 0 || viewModel.SelectedProduct2Id == 0)
			{
				ModelState.AddModelError("", "Please select exactly 2 products for comparison.");
				return View(viewModel);
			}

			var product1 = _productRepository.GetProductById(viewModel.SelectedProduct1Id);
			var product2 = _productRepository.GetProductById(viewModel.SelectedProduct2Id);

			var reviews1 = _productRepository.GetReviewsByProductId(product1.ProductID);
			var reviews2 = _productRepository.GetReviewsByProductId(product2.ProductID);
			var review1 = 0;
			var review2 = 0;

			if (reviews1.Count() > 0)
			{
				review1 = _productRepository.GetAverageRatingByProductId(product1.ProductID);
			}
			if (reviews2.Count() > 0)
			{
				review2 = _productRepository.GetAverageRatingByProductId(product2.ProductID);
			}
			var comparisonResultViewModel = new ComparisonResultViewModel
			{
				Product1 = product1,
				Product2 = product2,
				Review1 = review1,
				Review2 = review2
			};
			var home = customerRepository.GetAllHome();
			ViewData["BgImage"] = home.FirstOrDefault().BgImage;
			return View("CompareProductsSelection", comparisonResultViewModel);
		}

		[HttpPost]
		public ActionResult ApplyCoupon(string couponCode)
		{
			// Assuming you have a method to retrieve the coupon details from the database
			var coupon = _productRepository.GetCouponByCode(couponCode);

			if (coupon != null && _productRepository.IsCouponValid(coupon)) // Implement IsCouponValid method as per your business logic
			{
				// Apply the discount
				// Update the session or any other storage mechanism to store the applied coupon
				HttpContext.Session.SetString("AppliedCouponCode", coupon.Code);
				HttpContext.Session.SetString("AppliedCouponDiscount", coupon.DiscountAmount.ToString());

				return Json(new { success = true });
			}

			return Json(new { success = false, message = "Invalid coupon code" });
		}

		[HttpPost]
		public IActionResult GeneratePdf()
		{
			var order_id = httpContextAccessor.HttpContext.Session.GetInt32("OrderId");
			var order = _productRepository.GetOrderById(order_id);
			var payment = _productRepository.GetPaymentLast();
			var customer = _productRepository.GetCustomerById(order.CustomerID);
			var order_detail = _productRepository.GetOrders(order.CustomerID,order.OrderID);

			var htmlContent = $@"
        <html>
        <head>
            <title>Product Details</title>
            <style>
                body {{
                    margin-top: 80px;
                    background: #eee;
                    font-family: Arial, sans-serif;
                }}
                .container {{
                    width: 80%;
                    margin: 0 auto;
                    padding: 20px;
                    background-color: #fff;
                }}
                .invoice-details ul {{
                    list-style-type: none;
                    padding: 0;
                }}
                .invoice-details li {{
                    margin-bottom: 10px;
                }}
                .invoice-items table {{
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                }}
                .invoice-items th, .invoice-items td {{
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                }}
                .invoice-items th {{
                    background-color: #f2f2f2;
                }}
                .invoice-footer p {{
                    margin-top: 20px;
                    text-align: center;
                }}
            </style>
        </head>
        <body>

        <div class='container bootdey'>
            <div class='row invoice row-printable'>
                <div class='col-md-10'>
                    <div class='panel panel-default plain' id='dash_0'>
                        <div class='panel-body p30'>
                            <div class='row'>
                                <div class='col-lg-12'>
                                    <div class='invoice-details mt25'>
                                        <div class='well'>
                                            <ul class='list-unstyled mb0'>
                                                <li><strong>Payment ID :</strong> #{payment.PaymentId}</li>
                                                <li><strong>Payment Date :</strong> {DateTime.UtcNow.Date.ToShortDateString()}</li>
                                                <li><strong>Status:</strong> <span class='label label-success'>Successful</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class='invoice-to mt25'>
                                        <ul class='list-unstyled'>
                                            <li><strong>Payment To</strong></li>
                                            <p>{customer.FirstName} {customer.LastName}</p>
                                            <p>{customer.Address}</p>
                                            <p>{customer.Country}</p>
                                        </ul>
                                    </div>
                                    <div class='invoice-items'>
                                        <div class='table-responsive'>
                                            <table class='table table-bordered'>
                                                <thead>
                                                    <tr>
                                                        <th class='per70 text-center'>Description</th>
                                                        <th class='per5 text-center'>Qty</th>
                                                        <th class='per25 text-center'>SubTotal</th>
                                                    </tr>
                                                </thead>
                                                <tbody>";

			foreach (var orders in order_detail)
			{
				foreach (var singleOrder in orders.OrderDetails)
				{
					htmlContent += $@"
                <tr>
                    <td>{singleOrder.Products.ProductName}</td>
                    <td class='text-center'>{singleOrder.Quantity}</td>
                    <td class='text-center'>{singleOrder.Quantity * singleOrder.UnitPrice} {payment.Currency}</td>
                </tr>";
				}
			}

			htmlContent += $@"
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th colspan='2' class='text-right'>Sub Total</th>
                                                        <th class='text-center'>{order.SubTotal} {payment.Currency}</th>
                                                    </tr>
                                                    <tr>
                                                        <th colspan='2' class='text-right'>Discount</th>
                                                        <th class='text-center'>{order.Discount} %</th>
                                                    </tr>
                                                    <tr>
                                                        <th colspan='2' class='text-right'>Total</th>
                                                        <th class='text-center'>{order.TotalAmount} {payment.Currency}</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <div class='invoice-footer mt25'>
                                        <p>Generated on {DateTime.UtcNow.Date.ToShortDateString()}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </body>
        </html>";

			var converter = new HtmlToPdfConverter();
			var pdfBytes = converter.GeneratePdf(htmlContent);

			return File(pdfBytes, "application/pdf", "user_details.pdf");
		}

	}
}
