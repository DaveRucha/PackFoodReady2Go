using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class ProductReviewViewModel
    {
        public Products? Products { get; set; }
        public IEnumerable<Review>? Reviews { get; set; }
        public IEnumerable<Products>? RelatedProducts { get; set; }
        public int? AverageRating { get; set; }
    }


}
