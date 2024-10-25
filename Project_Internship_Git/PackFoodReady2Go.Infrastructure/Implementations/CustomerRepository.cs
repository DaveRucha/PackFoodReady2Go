
using Microsoft.EntityFrameworkCore;
using PackFoodReady2Go.Core;
using PackFoodReady2Go.Infrastructure.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Infrastructure.Implementations
{
    public class CustomerRepository : ICustomerRepository
    {
        private readonly MyAppDbContext _context;

        public CustomerRepository(MyAppDbContext appDbContext)
        {
            _context = appDbContext;
        }

        public async Task<Customer> Register(Customer customer)
        {
            
            customer.CreatedBy = DateTime.UtcNow;
            customer.ModifiedBy= DateTime.UtcNow;
            _context.Customer.Add(customer);
            await _context.SaveChangesAsync();
            return customer;
        }

        public async Task<Customer> Login(string email, string password)
        {
            var customer = await _context.Customer.FirstOrDefaultAsync(c => c.Email == email && c.Password == password);
            if (customer != null)
            {
                customer.LastLogin = DateTime.UtcNow;
                await _context.SaveChangesAsync();
            }
            return customer;
        }
        public async Task<Customer> Get(string email)
        {
            
            var customer = await _context.Customer.FirstOrDefaultAsync(c => c.Email == email);
            
            await _context.SaveChangesAsync();
            
            return customer;
        }

        //forgot 

       
        public Customer GetByEmail(string Email)
        {
            return _context.Customer.SingleOrDefault(c => c.Email == Email);
        }

        public void UpdatePassword(Customer user)
        {
            _context.Customer.Update(user);
            _context.SaveChanges();
        }

        public IEnumerable<MasterHomePage> GetAllHome()
        {
                return _context.MasterHomePage.ToList();
        }
        public MasterHomePage GetHome()
        {
            return _context.MasterHomePage.FirstOrDefault();
        }

        public ContactUs GetAllContact()
        {
            return _context.ContactUs.FirstOrDefault();
        }

        public AboutUs GetAllAbout()
        {
            return _context.AboutUs.FirstOrDefault();
        }

        public IEnumerable<Slider> GetAllSlider()
        {
            return _context.Slider.ToList();
        }

        public IEnumerable<Banner> GetAllBanner()
        {
            return _context.Banner.ToList();
        }

        public IEnumerable<CategoryList> GetAllCategoryList()
        {
            return _context.CategoryList.ToList();
        }
        public IEnumerable<Products> GetFeaturedProducts()
        {
            return _context.Products.Where(p => p.IsDeleted == 0)
                .Take(8)
                .ToList();

        }


        public async Task<int> GetCartRecordCount(String userEmail)
        {
            // Execute the query and count the records returned
            int recordCount = await _context.Cart
                .Where(w => w.Customer.Email == userEmail)
                .CountAsync();
            
            return recordCount;
        }


        public IEnumerable<FooterInfo> GetFooter()
        {
            return _context.FooterInfo.ToList();
        }


        //public IEnumerable<MasterHomePage> GetAllHome()
        //{
        //}

        //total customer

        public int? GetTotalProducts()
        {
            return _context.OrderDetails.Sum(s => s.Quantity);
        }
        public int GetTotalCustomersAsync()
        {
            return _context.Customer.Count();
        }
    }
}
