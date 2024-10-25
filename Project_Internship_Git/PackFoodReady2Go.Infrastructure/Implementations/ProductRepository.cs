using Microsoft.EntityFrameworkCore;
using PackFoodReady2Go.Core;
using PackFoodReady2Go.Infrastructure.Interfaces;
using Stripe;
using Stripe.Climate;
using Stripe.FinancialConnections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace PackFoodReady2Go.Infrastructure.Implementations
{
    public class ProductRepository : IProductRepository
    {

        private readonly MyAppDbContext _context;
        

        public ProductRepository(MyAppDbContext context)
        {
            _context = context;
        }
        public IEnumerable<Products> GetAll()
        {
            return _context.Products.Where(p => p.IsDeleted == 0).ToList();
        }
        public IEnumerable<Products> SearchProducts(string searchText)
        {
            return _context.Products
                .Where(p => p.ProductName.Contains(searchText) && p.IsDeleted == 0)
                .ToList();
        }
        public IEnumerable<Products> GetAllProducts()
        {
            return _context.Products.Include(p => p.Reviews).Where(p => p.IsDeleted == 0).ToList();
        }


        public IEnumerable<Products> GetProductByCategory(string categoryName)
        {
            return _context.Products
                .Include(p => p.Category) 
                .Where(p => p.Category.CategoryName == categoryName && p.IsDeleted == 0)
                .ToList();
        }
        public IEnumerable<string> GetCategoryNames()
        {
            return _context.Category.Select(c => c.CategoryName).ToList();
        }


        public Products GetProductById(int productId)
        {
            return _context.Products
                .Where(p => p.IsDeleted == 0)
                .Include(p => p.Category)
                .Include(p => p.SubCategory)
                .FirstOrDefault(p => p.ProductID == productId);

        }
        public Products GetProduct()
        {
            return _context.Products.FirstOrDefault();

        }
        public IEnumerable<Products> GetRelatedProducts(int categoryId)
        {
            return _context.Products
                .Where(p => p.CategoryID == categoryId &&  p.IsDeleted == 0)
                .ToList();
        }

        public void AddToWishlist(int customerId, int productId)
        {
			var existingItem = _context.Wishlist
								.FirstOrDefault(w => w.CustomerID == customerId && w.ProductID == productId);

			// If the product does not exist in the wishlist, add it
			if (existingItem == null)
			{
				var wishlistItem = new Wishlist
				{
					CustomerID = customerId,
					ProductID = productId,
					CreatedBy = DateTime.UtcNow,
					ModifiedBy = DateTime.UtcNow
				};

				_context.Wishlist.Add(wishlistItem);
				_context.SaveChanges();
			}
        }
        public async Task<IEnumerable<Wishlist>> GetWishlist(int userId)
        {
            return await _context.Wishlist
                .Include(w => w.Products)
                .Include(w => w.Customer)
                .Where(w => w.CustomerID == userId) // Filter by CustomerId
                .ToListAsync();
        }
        public List<Orders> GetOrder(int userId)
        {
			return _context.Orders
			   .Where(o => o.CustomerID == userId)
			   .Include(o => o.OrderDetails)
				   .ThenInclude(od => od.Products)
			   .ToList();
		}
		public List<Orders> GetOrders(int? userId,int? orderId)
		{
			return _context.Orders
			   .Where(o => o.CustomerID == userId && o.OrderID==orderId)
			   .Include(o => o.OrderDetails)
				   .ThenInclude(od => od.Products)
			   .ToList();
		}
		public async Task<IEnumerable<OrderDetails>> GetOrderDetail(int OrderID)
        {
            return await _context.OrderDetails
                .Include(w => w.Order)
                .Where(w => w.OrderID == OrderID) // Filter by CustomerId
                .ToListAsync();
        }
        public void AddShippingAddress(ShippingAddress shippingAddress)
		{
			try
			{

				_context.ShippingAddress.Add(shippingAddress);
				 _context.SaveChanges();
			}
			catch (Exception ex)
			{
				// Log the exception
				Console.WriteLine(ex.Message);
			}

		}
		public List<Products> Get_Products()
		{
			return _context.Products.Where(p => p.IsDeleted == 0).ToList();
		}
        public IEnumerable<Core.Review> GetReviewsByProductId(int productId)
        {
            return _context.Review.Where(r => r.ProductID == productId).ToList();
        }
        public int GetReviewsByEmail(string email, int? productId)
        {
            return _context.Review.Where(r => r.ProductID == productId && r.CustomerEmail == email).Count();
        }
        public Products GetProduct_Id(int productId)
		{
			return _context.Products.FirstOrDefault(p => p.ProductID == productId);
		}
		public void AddOrderDetails(OrderDetails order)
		{
			try
			{
				_context.OrderDetails.Add(order);
				_context.SaveChanges();
			}
			catch (Exception ex)
			{
				// Log the exception
				Console.WriteLine(ex.Message);
			}

		}
		public int GetOrderId()
		{
			
			var OrderId = _context.Orders.OrderByDescending(o => o.OrderID).Select(o => o.OrderID).FirstOrDefault();

			return OrderId;
		}
		public void AddOrder(Orders order)
		{
			try
			{
				_context.Orders.Add(order);
				_context.SaveChanges();
			}
			catch (Exception ex)
			{
				// Log the exception
				Console.WriteLine(ex.Message);
			}

		}
		public async Task DeleteFromWishlist(int wishlistId, int customerId)
		{
			var wishlistItem = await _context.Wishlist.FirstOrDefaultAsync(w => w.WishlistID == wishlistId && w.CustomerID == customerId);
			if (wishlistItem != null)
			{
				_context.Wishlist.Remove(wishlistItem);
				await _context.SaveChangesAsync();
			}
		}
        public void AddToCart(int customerId, int productId, int Quantity)
        {
            var existingCartItem = _context.Cart
             .FirstOrDefault(c => c.CustomerID == customerId && c.ProductID == productId);

            if (existingCartItem != null)
            {
                // If the product exists in the cart, update the quantity
                existingCartItem.Quantity += Quantity;
                existingCartItem.ModifiedBy = DateTime.UtcNow;
            }
            else
            {
                // If the product doesn't exist in the cart, add a new cart item
                var cartItem = new Cart
                {
                    CustomerID = customerId,
                    ProductID = productId,
                    CreatedBy = DateTime.UtcNow,
                    ModifiedBy = DateTime.UtcNow,
                    Quantity = Quantity
                };

                _context.Cart.Add(cartItem);
            }

            _context.SaveChanges();
        }
        public async Task<IEnumerable<Cart>> GetCart(int? userId)
        {
            return await  _context.Cart
                .Include(w => w.Products)
                .Include(w => w.Customer)
                .Where(w => w.CustomerID == userId) 
                .ToListAsync();
        }
        
        public async Task DeleteFromCart(int cartId, int customerId)
        {
            var cartItem = await _context.Cart.FirstOrDefaultAsync(w => w.CartID == cartId && w.CustomerID == customerId);
            if (cartItem != null)
            {
                _context.Cart.Remove(cartItem);
                await _context.SaveChangesAsync();
            }
        }

		public void EmptyCart(int? CustomerID)
		{
			var cartItems =  _context.Cart.Where(c => c.CustomerID == CustomerID).ToList();
			_context.Cart.RemoveRange(cartItems);
			_context.SaveChanges();
		}


		public void UpdateQuantity(int cartId, int quantity)
		{
			// Retrieve the cart item from the database
			var cartItem = _context.Cart.Find(cartId);
			if (cartItem != null)
			{
				// Update the quantity
				cartItem.Quantity = quantity;
				_context.SaveChanges(); // Save changes to the database
			}
		}
		public Core.Coupon GetCouponByCode(string couponCode)
		{
			return _context.Coupon.FirstOrDefault(c => c.Code == couponCode);
		}
		public bool IsCouponValid(Core.Coupon coupon)
		{
			// Check if the coupon is not null
			if (coupon == null)
			{
				return false;
			}

			// Check if the coupon has not expired
			if (coupon.ExpiryDate < DateTime.Now)
			{
				return false;
			}

			// You can add more validation logic here, such as checking usage limits, etc.

			// If all checks pass, the coupon is considered valid
			return true;
		}

	public string CreateCustomer(string email, string name)
		{
			var options = new CustomerCreateOptions
			{
				Email = email,
				Name = name,
			};

			var service = new CustomerService();
			var customer = service.Create(options);

			return customer.Id;
		}
        public void AddReview(Core.Review review)
        {
            _context.Review.Add(review);
            _context.SaveChanges();
        }
        public int GetAverageRatingByProductId(int productId)
        {
            var averageRating = _context.Review
                .Where(r => r.ProductID == productId)
                .Average(r => r.Rating);

            // If there are no reviews for the product, return 0
            return averageRating!=0 ? (int)averageRating : 0;
        }
        
        public void Payment_trial(List<Payment>? paymentsToAdd)
        {
            _context.Payment.AddRange(paymentsToAdd);
            
            _context.SaveChanges();
        }
		public Payment GetPaymentLast()
		{
			return _context.Payment
				.OrderByDescending(p => p.PaymentId) // Assuming CreatedAt is the timestamp indicating when the payment was created
				.FirstOrDefault();
		}
		public Orders GetOrderById(int? order_id)
		{
            return _context.Orders
               .Where(o => o.OrderID == order_id).FirstOrDefault();
			   
		}
		public Core.Customer GetCustomerById(int? Customer_id)
		{
			return _context.Customer
			   .Where(o => o.CustomerID == Customer_id).FirstOrDefault();

		}
	}
}
