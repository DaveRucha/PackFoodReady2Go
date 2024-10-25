using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
	public class Cart
	{
		[Key]
		public int CartID { get; set; }

		[Required]
		[ForeignKey("Customer")]
		public int CustomerID { get; set; }

		[Required]
		[ForeignKey("Products")]
		public int ProductID { get; set; }

		[Column(TypeName = "datetime")]
		public DateTime? CreatedBy { get; set; }

		[Column(TypeName = "datetime")]
		public DateTime? ModifiedBy { get; set; }

		
		public int Quantity { get; set; }

		//[Required]
		//public int? TotalQuantity { get; set; }

		//[Column(TypeName = "decimal(18, 2)")]
		//public decimal? TotalAmount { get; set; }
		//[Column(TypeName = "decimal(18, 2)")]
		//public decimal? TotalDiscount { get; set; }

		// Navigation properties
		public Customer? Customer { get; set; }
		public Products? Products { get; set; }
	}

}
