using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class ProductCompare
    {
        public int SelectedProduct1Id { get; set; }
        public int SelectedProduct2Id { get; set; }

        public List<Products> AvailableProducts { get; set; }

        public ProductCompare()
        {
            AvailableProducts = new List<Products>();
        }
    }
}
