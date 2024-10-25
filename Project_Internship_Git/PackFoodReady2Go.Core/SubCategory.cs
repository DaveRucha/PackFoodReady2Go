using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class SubCategory
    {
        [Key]
        public int SubCategoryID { get; set; }

        [Required]
        [StringLength(50)]
        public string SubCategoryName { get; set; }

        public int CategoryID { get; set; }

        // Navigation properties
        [ForeignKey("CategoryID")]
        public Category Category { get; set; }

        public ICollection<Products> Products { get; set; }
    }
}
