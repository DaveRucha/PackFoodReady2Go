using PackFoodReady2Go.Core;
using PackFoodReady2Go.Infrastructure.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Infrastructure.Implementations
{
    public class ContactRepository : IContactRepository
    {
        private readonly MyAppDbContext app;

        public ContactRepository(MyAppDbContext _app)
        {
            this.app = _app;
        }

        public void Add(ContactUs contactUs)
        {
            app.ContactUs.Add(contactUs);
            app.SaveChanges();
        }

        public IEnumerable<ContactUs> GetAll()
        {
            return app.ContactUs.ToList();
        }
    }
}
