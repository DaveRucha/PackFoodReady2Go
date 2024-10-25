using PackFoodReady2Go.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Infrastructure.Interfaces
{
    public interface IContactRepository
    {
        IEnumerable<ContactUs> GetAll();
        void Add(ContactUs contactUs);
    }
}
