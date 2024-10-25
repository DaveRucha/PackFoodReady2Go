using Microsoft.EntityFrameworkCore;
using PackFoodReady2Go.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace PackFoodReady2Go.Infrastructure.Interfaces
{
    public interface ICustomerRepository
    {
        Task<Customer> Register(Customer customer);
        Task<Customer> Login(string Email, string Password);
        Task<Customer> Get(string email);
        
        Task<int> GetCartRecordCount(String userEmail);
        //forgot
        Customer GetByEmail(string email);
        void UpdatePassword(Customer user);

        //home

        IEnumerable<MasterHomePage> GetAllHome();
        IEnumerable<Slider> GetAllSlider();
        IEnumerable<Banner> GetAllBanner();
        IEnumerable<CategoryList> GetAllCategoryList();
        IEnumerable<Products> GetFeaturedProducts();
        ContactUs GetAllContact();
        AboutUs GetAllAbout();
        MasterHomePage GetHome();
        IEnumerable<FooterInfo> GetFooter();

        // total customer

        int GetTotalCustomersAsync();
        int? GetTotalProducts();
    }

}
