using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
	public class CartCheckoutModel
	{
		public decimal Subtotal { get; set; }
		public decimal Discount { get; set; }
		public decimal Total { get; set; }
	}
}
