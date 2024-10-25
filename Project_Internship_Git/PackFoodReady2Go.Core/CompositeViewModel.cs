using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class CompositeViewModel
    {
        public IEnumerable<PackFoodReady2Go.Core.MasterHomePage>? MasterHomePage { get; set; }
        public Customer? Customer { get; set; }
        public IEnumerable< Slider>? Slider { get; set; }

        public IEnumerable<Banner>? Banner { get; set; }
        public IEnumerable<CategoryList>? CategoryList { get; set; }
        public IEnumerable<Products>? Products { get; set; }

    }
}
