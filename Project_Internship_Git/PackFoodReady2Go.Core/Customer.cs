using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{


	public class Customer
	{
		[Key]
		public int CustomerID { get; set; }

		[Required(ErrorMessage = "First Name is required.")]
		[StringLength(50, ErrorMessage = "First Name must be between {2} and {1} characters.", MinimumLength = 1)]
		[Display(Name = "First Name")]
		public string? FirstName { get; set; }

		[Required(ErrorMessage = "Last Name is required.")]
		[StringLength(50, ErrorMessage = "Last Name must be between {2} and {1} characters.", MinimumLength = 1)]
		[Display(Name = "Last Name")]
		public string? LastName { get; set; }

		[Required(ErrorMessage = "Email is required.")]
		[EmailAddress(ErrorMessage = "Invalid email address.")]
		public string? Email { get; set; }

		[Required(ErrorMessage = "Password is required.")]
		[StringLength(50, ErrorMessage = "Password must be between {2} and {1} characters.", MinimumLength = 6)]
		public string? Password { get; set; }

		[Required(ErrorMessage = "address is required.")]

		[StringLength(255, ErrorMessage = "Address must be no more than {1} characters.")]
		public string? Address { get; set; }

		[Required(ErrorMessage = "pincode is required.")]

		[StringLength(20, ErrorMessage = "Pincode must be no more than {1} characters.")]
		public string? Pincode { get; set; }

		[Required(ErrorMessage = "country is required.")]

		[StringLength(50, ErrorMessage = "Country must be no more than {1} characters.")]
		public string? Country { get; set; }
		[Required(ErrorMessage = "state is required.")]

		[StringLength(50, ErrorMessage = "State must be no more than {1} characters.")]

		public string? State { get; set; }
		[Required(ErrorMessage = "city is required.")]


		[StringLength(50, ErrorMessage = "City must be no more than {1} characters.")]

		public string? City { get; set; }

		[Required(ErrorMessage = "contact no is required.")]

		[Phone(ErrorMessage = "Invalid phone number.")]
		[StringLength(20, ErrorMessage = "Contact No must be no more than {1} characters.")]
		[Display(Name = "Contact No")]
		public string? ContactNo { get; set; }

		[Required(ErrorMessage = "Password is required.")]

		[DataType(DataType.DateTime, ErrorMessage = "Invalid date format.")]
		[Display(Name = "Creation Time")]
		public DateTime? CreatedBy { get; set; }

		[DataType(DataType.DateTime, ErrorMessage = "Invalid date format.")]
		[Display(Name = "Modification Time")]
		public DateTime? ModifiedBy { get; set; }

		[DataType(DataType.DateTime, ErrorMessage = "Invalid date format.")]
		[Display(Name = "Last Login")]
		public DateTime? LastLogin { get; set; }

		[Required(ErrorMessage = "captcha is required.")]

		[NotMapped]
		public string Captcha { get; set; }
	}
}
