using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Core
{
    public class Products
    {
            [Key]
            public int ProductID { get; set; }

            [Required]
            [StringLength(50)]
            public string ProductName { get; set; }

            public int CategoryID { get; set; }

            public int SubCategoryID { get; set; }

            public int? QuantityPerUnit { get; set; }

            [Required]
            public decimal UnitPrice { get; set; }

            public string? Capacity { get; set; }

            public string? Size { get; set; }

            public string? Material { get; set; }

            public decimal Discount { get; set; }

            public int? UnitInStock { get; set; }

            public string? ImageURL { get; set; }

            public string? AltText { get; set; }

            public string? Description { get; set; }

            public DateTime? CreatedBy { get; set; }

            public DateTime? ModifiedBy { get; set; }
            public int? IsDeleted { get; set; }

            // Navigation properties
            [ForeignKey("CategoryID")]
            public Category Category { get; set; }

            [ForeignKey("SubCategoryID")]
            public SubCategory SubCategory { get; set; }

        //Compare
        [NotMapped]
        public bool IsSelectedForComparison { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
