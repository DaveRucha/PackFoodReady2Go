using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using PackFoodReady2Go.Core;
using PackFoodReady2Go.Infrastructure.Interfaces;
using Newtonsoft.Json;
using Humanizer;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Drawing.Imaging;
using System.Drawing;
using CaptchaMvc.HtmlHelpers;
using System.Net;
using Microsoft.AspNetCore.Authentication.Google;
using static System.Runtime.InteropServices.JavaScript.JSType;
using Microsoft.AspNetCore.Identity;

namespace PackFoodReady2Go.UI.Controllers
{
    public class CustomerController : Controller
    {
        private readonly ICustomerRepository customerRepository;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public CustomerController(ICustomerRepository icustomerRepository, IHttpContextAccessor httpContextAccessor)
        {
            this.customerRepository = icustomerRepository;
            _httpContextAccessor = httpContextAccessor;
        }

        //total customer

        //public async Task<IActionResult> Index()
        //{
        //    var totalCustomers = await customerRepository.GetTotalCustomersAsync();
        //    //var totalSoldProducts = await _saleRepository.GetTotalSoldProductsAsync();
        //    //var totalAwards = await _awardRepository.GetTotalAwardsAsync();

        //    ViewData["TotalCustomers"] = totalCustomers;
        //    //ViewData["TotalSoldProducts"] = totalSoldProducts;
        //    //ViewData["TotalAwards"] = totalAwards;

        //    return View();
        //}

        public async Task<IActionResult> Index()
        {



            string? customeremail = HttpContext.Session.GetString("UserEmail");
            var masterHomePage = customerRepository.GetAllHome();

            var slider = customerRepository.GetAllSlider();
            var catlist = customerRepository.GetAllCategoryList();

            var banner = customerRepository.GetAllBanner();

            var FeaturedProduct = customerRepository.GetFeaturedProducts();


            _httpContextAccessor.HttpContext.Session.SetString("ReviewFail", "false");
            var gethome = customerRepository.GetHome();
            _httpContextAccessor.HttpContext.Session.SetString("DescriptionOffer", gethome.DescriptionOffer);
            _httpContextAccessor.HttpContext.Session.SetString("WebsiteTitle", gethome.WebsiteTitle);
            _httpContextAccessor.HttpContext.Session.SetString("CompanyAddress", gethome.CompanyAddress);
            _httpContextAccessor.HttpContext.Session.SetString("CompanyContactNo", gethome.CompanyContactNo);
            _httpContextAccessor.HttpContext.Session.SetString("CompanyEmail", gethome.CompanyEmail);
            _httpContextAccessor.HttpContext.Session.SetString("CompanyDescription", gethome.CompanyDescription);
            _httpContextAccessor.HttpContext.Session.SetString("FeaturedProductTitle", gethome.FeaturedProductTitle);
            _httpContextAccessor.HttpContext.Session.SetString("FeaturedProductDescription", gethome.FeaturedProductDescription);
            _httpContextAccessor.HttpContext.Session.SetString("PromoTitle", gethome.PromoTitle);
            _httpContextAccessor.HttpContext.Session.SetString("PromoTagline", gethome.PromoTagline);
            _httpContextAccessor.HttpContext.Session.SetString("PromoDescription", gethome.PromoDescription);
            _httpContextAccessor.HttpContext.Session.SetString("PromoProductname", gethome.PromoProductname);
            _httpContextAccessor.HttpContext.Session.SetString("PromoOffertag", gethome.PromoOffertag);


            if (!customeremail.IsNullOrEmpty())
            {
                var customer = await customerRepository.Get(customeremail);
                ViewData["customeremail"] = customeremail;

                var cartTotal = await customerRepository.GetCartRecordCount(customeremail);

                _httpContextAccessor.HttpContext.Session.SetInt32("cartTotal", cartTotal);
                var viewModel = new CompositeViewModel
                {
                    Customer = customer,
                    MasterHomePage = masterHomePage,
                    Slider = slider,
                    Banner = banner,
                    CategoryList = catlist,
                    Products = FeaturedProduct
                };



                return View(viewModel);


            }

            var home = customerRepository.GetAllHome();
            var viewModel1 = new CompositeViewModel
            {
                MasterHomePage = home,
                Slider = slider,
                Banner = banner,
                CategoryList = catlist,

                Products = FeaturedProduct
            };
            return View(viewModel1);
        }



        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }



        [HttpPost]
        public async Task<IActionResult> Register(Customer customer, string captcha)
        {
            // Validate captcha input
            if (string.IsNullOrWhiteSpace(captcha) || !IsValidCaptcha(captcha))
            {
                ModelState.AddModelError("Captcha", "Invalid captcha.");
                return View(customer);
            }

            if (ModelState.IsValid)
            {
                await customerRepository.Register(customer);
                return RedirectToAction("Login");
            }
            return View(customer);
        }
        public IActionResult CaptchaImage()
        {
            string captcha = GenerateCaptcha();
            HttpContext.Session.SetString("Captcha", captcha);

            // Create an image with the captcha text
            byte[] imageBytes = GenerateCaptchaImage(captcha);

            // Return the captcha image
            return File(imageBytes, "image/jpeg");
        }

        private string GenerateCaptcha()
        {
            // Generate a random captcha string (replace this with your captcha generation logic)
            string captcha = ""; // Implement your captcha generation logic here
            Random random = new Random();
            for (int i = 0; i < 6; i++)
            {
                captcha += random.Next(10).ToString();
            }
            return captcha;
        }

        private byte[] GenerateCaptchaImage(string captcha)
        {
            
            using (Bitmap bitmap = new Bitmap(200, 50))
            {
                using (Graphics graphics = Graphics.FromImage(bitmap))
                {
                    graphics.Clear(Color.White);
                    Font font = new Font("Arial", 20);
                    graphics.DrawString(captcha, font, Brushes.Black, new PointF(10, 10));
                }

                // Convert the image to byte array
                using (MemoryStream stream = new MemoryStream())
                {
                    bitmap.Save(stream, ImageFormat.Jpeg);
                    return stream.ToArray();
                }
            }
        }

        // Simple captcha validation method (replace with your captcha logic)
        private bool IsValidCaptcha(string userInput)
        {
            var session = _httpContextAccessor.HttpContext.Session;
            if (session.TryGetValue("Captcha", out byte[] captchaBytes))
            {
                string captcha = System.Text.Encoding.UTF8.GetString(captchaBytes);
                return userInput == captcha;
            }
            return false;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(string email, string password)
        {
            var customer = await customerRepository.Login(email, password);
            if (customer != null)
            {

                _httpContextAccessor.HttpContext.Session.SetString("UserEmail", customer.Email);
                _httpContextAccessor.HttpContext.Session.SetString("UserName", customer.FirstName);
                _httpContextAccessor.HttpContext.Session.SetInt32("UserId", customer.CustomerID);

                return RedirectToAction("Index", "Customer");
            }
            // Failed login, return to login page with error message.
            ModelState.AddModelError(string.Empty, "Invalid login attempt.");
            return View(customer);
        }
        [HttpGet]
        public IActionResult Logout()
        {
            // Clear session data
            HttpContext.Session.Clear();

            // Sign out the user
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            // Redirect to the home page or any other desired page after logout
            return RedirectToAction("Index", "Customer");
        }
        [HttpGet]
        public IActionResult AboutUs()
        {

            var about = customerRepository.GetAllAbout();
            var totalCustomers = customerRepository.GetTotalCustomersAsync();
            var totalproducts = customerRepository.GetTotalProducts();
            ViewData["TotalCustomers"] = totalCustomers;
            @ViewData["TotalProducts"] = totalproducts;
            return View(about);
        }
        [HttpGet]
        public IActionResult ContactUs()
        {

            var contact = customerRepository.GetAllContact();

            return View(contact);

        }
        //forgot

        [HttpGet]
        public IActionResult ForgotPassword()
        {
            return View();
        }


        [HttpPost]
        public IActionResult ForgotPassword(string email, string password)
        {
            var user = customerRepository.GetByEmail(email)
;

            if (user != null)
            {
                // Update the password
                user.Password = password;
                customerRepository.UpdatePassword(user);

                return RedirectToAction("Login", "Customer"); // Redirect to login page
            }

            ModelState.AddModelError("Login", "Invalid email address.");
            return View();
        }

        //home
        [HttpGet]
        public IActionResult Home()
        {
            var home = customerRepository.GetAllHome();
            return View(home);
        }

        [HttpGet]
        public IActionResult Footer()
        {

            var Footers = customerRepository.GetFooter();
            var home = customerRepository.GetAllHome();
            ViewData["BgImage"] = home.FirstOrDefault().BgImage;
            return View(Footers);
        }

        [HttpGet]
        public IActionResult TermsConditions()
        {

            var Footers = customerRepository.GetFooter();
            var home = customerRepository.GetAllHome();
            ViewData["BgImage"] = home.FirstOrDefault().BgImage;
            return View(Footers);
        }
        [HttpGet]
        public IActionResult DeliveryReturn()
        {

            var Footers = customerRepository.GetFooter();
            var home = customerRepository.GetAllHome();
            ViewData["BgImage"] = home.FirstOrDefault().BgImage;
            return View(Footers);
        }

    }
}
