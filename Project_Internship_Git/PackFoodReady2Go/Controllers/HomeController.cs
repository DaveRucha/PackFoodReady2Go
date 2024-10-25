using Microsoft.AspNetCore.Mvc;
using PackFoodReady2Go.Core;
using PackFoodReady2Go.Infrastructure.Implementations;
using PackFoodReady2Go.Infrastructure.Interfaces;
using PackFoodReady2Go.Models;
using System.Diagnostics;

namespace PackFoodReady2Go.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly ICustomerRepository _customerRepository;

        private readonly IHttpContextAccessor _httpContextAccessor;

        public HomeController(ICustomerRepository customerRepository,IHttpContextAccessor httpContextAccessor, ILogger<HomeController> logger)
        {

            _logger = logger;
            _customerRepository = customerRepository;
            _httpContextAccessor = httpContextAccessor;
        }

        public IActionResult Index()
        {
            
            return RedirectToAction("Index","Customer");
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
