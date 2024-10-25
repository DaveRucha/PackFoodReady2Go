using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class Wishlist
    {
        [Key]
        public int WishlistID { get; set; }
        [Required]
        public int CustomerID { get; set; }
        [Required]
        public int ProductID { get; set; }
        public DateTime? CreatedBy { get; set; }
        public DateTime? ModifiedBy { get; set; }
        [ForeignKey("CustomerID")]
        public Customer Customer { get; set; }

        [ForeignKey("ProductID")]
        public Products Products { get; set; }

    }
}
