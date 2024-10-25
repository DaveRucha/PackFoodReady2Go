using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
	public class ShippingAddress
	{
		[Key]
		public int ShippingID { get; set; }

		[Display(Name = "Customer ID")]
		public int? CustomerID { get; set; }

		[Required(ErrorMessage = "First Name is required")]
		[Display(Name = "First Name")]
		public string? FirstName { get; set; }

		[Required(ErrorMessage = "Last Name is required")]
		[Display(Name = "Last Name")]
		public string? LastName { get; set; }

		[Required(ErrorMessage = "Email is required")]
		[EmailAddress(ErrorMessage = "Invalid Email Address")]
		public string? Email { get; set; }

		[Required(ErrorMessage = "Mobile is required")]
		[Display(Name = "Mobile")]
		[RegularExpression(@"^\d{10}$", ErrorMessage = "Invalid Mobile Number")]
		public string? Mobile { get; set; }

		[Required(ErrorMessage = "Address is required")]
		public string? Address { get; set; }

		[Required(ErrorMessage = "Country is required")]
		public string? Country { get; set; }

		[Required(ErrorMessage = "State is required")]
		public string? State { get; set; }

		[Required(ErrorMessage = "City is required")]
		public string? City { get; set; }

		[Required(ErrorMessage = "Post Code is required")]
		[Display(Name = "Post Code")]
		public string? PostCode { get; set; }

}
}
