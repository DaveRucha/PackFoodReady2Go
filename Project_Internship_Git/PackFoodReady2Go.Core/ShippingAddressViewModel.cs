using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
	public class ShippingAddressViewModel
	{
		public int? CustomerID { get; set; }

		[Required(ErrorMessage = "First Name is required")]
		public string? FirstName { get; set; }

		[Required(ErrorMessage = "Last Name is required")]
		public string? LastName { get; set; }
		[Required(ErrorMessage = "Email Address is required")]
		[EmailAddress(ErrorMessage = "Invalid Email Address")]
		public string? EmailAddress { get; set; }


		[Required(ErrorMessage = "Phone is required")]
		public string? Phone { get; set; }

		[Required(ErrorMessage = "Street Address is required")]
		public string? Address { get; set; }

		[Required(ErrorMessage = "Country is required")]
		public string? Country { get; set; }



		[Required(ErrorMessage = "State is required")]
		public string? State { get; set; }

		[Required(ErrorMessage = "Town / City is required")]
		public string? City { get; set; }

		[Required(ErrorMessage = "Postcode / ZIP is required")]
		public string? PostCode { get; set; }
		
		
		public IEnumerable<Cart>? Cart { get; set; }
	}

}

