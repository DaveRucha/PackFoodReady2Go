using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class Payment
    {
        public int PaymentId { get; set; }

        [Required]
        public decimal Amount { get; set; }

        [Required]
        [StringLength(3)]
        public string? Currency { get; set; }

        [Required]
        [StringLength(50)]
        public string? Status { get; set; }

        [Required]
        [StringLength(255)]
        public string? PaymentMethod { get; set; }

        public int? CustomerId { get; set; }

        public DateTime? CreatedAt { get; set; }

        // Navigation property
        public Customer? Customer { get; set; }
    }
}
