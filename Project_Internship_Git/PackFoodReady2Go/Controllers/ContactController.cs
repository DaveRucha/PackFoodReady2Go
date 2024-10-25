using Microsoft.AspNetCore.Mvc;
using PackFoodReady2Go.Core;
using PackFoodReady2Go.Infrastructure.Interfaces;

namespace PackFoodReady2Go.UI.Controllers
{
    public class ContactController : Controller
    {
        private readonly IContactRepository db;

        public ContactController(IContactRepository _db)
        {
            db = _db;
        }

        public IActionResult Index()
        {
            var b = db.GetAll();
            return View(b);

        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(ContactUs c)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Add(c);
                    return RedirectToAction("Index","Customer");

                }
                else
                {
                    TempData["errormessage"] = "model is invalid";
                    return View();
                }
            }
            catch (Exception ex)
            {
                TempData["errormessage"] = ex.Message;
                return View();
            }
        }


    }
}
