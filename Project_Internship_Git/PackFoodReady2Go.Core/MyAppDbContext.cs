using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class MyAppDbContext : DbContext
    {
        public MyAppDbContext(DbContextOptions<MyAppDbContext> options) : base(options)
        {
        }
		
		public DbSet<Customer> Customer { get; set; }
        public DbSet<Category> Category { get; set; }
        public DbSet<SubCategory> SubCategory { get; set; }
        public DbSet<Products> Products { get; set; }
        public DbSet<MasterHomePage> MasterHomePage { get; set; }
        public DbSet<Slider> Slider { get; set; }
        public DbSet<Banner> Banner { get; set; }

        public DbSet<CategoryList> CategoryList { get; set; }
        public DbSet<ContactUs>ContactUs { get; set; }
        public DbSet<AboutUs> AboutUs { get; set; }

		public DbSet<Wishlist> Wishlist { get; set; }
        public DbSet<FooterInfo> FooterInfo { get; set; }

        public DbSet<Cart> Cart { get; set; }
        public DbSet<ShippingAddress> ShippingAddress { get; set; }
        public DbSet<Orders> Orders { get; set; }
        public DbSet<OrderDetails> OrderDetails { get; set; }
        public DbSet<Coupon> Coupon { get; set; }
        public DbSet<Review> Review { get; set; }
        public DbSet<Payment> Payment { get; set; }
    }
}
