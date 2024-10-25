using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class Review
    {
        [Key]
        public int ReviewID { get; set; }
        public int ProductID { get; set; }
        public string? CustomerName { get; set; }
        public string? CustomerEmail { get; set; }
        public string? ReviewTitle { get; set; }
        public string? ReviewDescription { get; set; }

        [Range(1, 5, ErrorMessage = "Rating must be between 1 and 5")]
        public int Rating { get; set; }
        public DateTime ReviewDate { get; set; }

        [ForeignKey("ProductID")]
        public Products? Product { get; set; }
    }
}
