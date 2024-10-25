using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class Orders
    { 
        [Key]
        public int OrderID { get; set; }
		[ForeignKey("Customer")]

		public int? CustomerID { get; set; }
        public string? TotalAmount { get; set; }
        public string? Discount { get; set; }
        public string? SubTotal { get; set; }
        public string? OrderStatus { get; set; }
        public DateTime OrderDate { get; set; }

        // Navigation property for the Customer entity
        public Customer? Customer { get; set; }

        // Navigation property for the OrderDetails entities
        public ICollection<OrderDetails>? OrderDetails { get; set; }
    

}
}
