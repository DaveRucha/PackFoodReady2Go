using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class OrderDetails
    {
        [Key]
        public int OrderDetailID { get; set; }
		[ForeignKey("Orders")]

		public int OrderID { get; set; }
		[ForeignKey("Products")]
		public int ProductID { get; set; }
		public int? Quantity { get; set; }
        public decimal? UnitPrice { get; set; }

        // Navigation property for the Order entity
        public Orders? Order { get; set; }

        // Navigation property for the Product entity
        public Products? Products { get; set; }
    }
}
