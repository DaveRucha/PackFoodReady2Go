using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class Category
    {
        [Key]
        public int CategoryID { get; set; }

        [Required]
        [StringLength(50)]
        public string CategoryName { get; set; }

        // Navigation property for SubCategory
        public ICollection<SubCategory> SubCategories { get; set; }
    }
}
