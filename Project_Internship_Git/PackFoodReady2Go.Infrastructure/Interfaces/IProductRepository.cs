using PackFoodReady2Go.Core;
using Stripe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace PackFoodReady2Go.Infrastructure.Interfaces
{
    public interface IProductRepository
    {
		List<Products> Get_Products();
		Products GetProduct_Id(int productId);
		IEnumerable<Products> GetAll();
        string CreateCustomer(string email, string name);

		IEnumerable<Products> SearchProducts(string searchTerm);
        IEnumerable<Products> GetAllProducts();
        Products GetProductById(int productId);
        Products GetProduct();
        IEnumerable<Products> GetRelatedProducts(int categoryId);
        
        void AddToWishlist(int customerId, int productId);
        Task<IEnumerable<Wishlist>> GetWishlist(int id);
        List<Orders> GetOrder(int id);
		Task DeleteFromWishlist(int wishlistId,int CustomerID);
        IEnumerable<string> GetCategoryNames();
        IEnumerable<Products> GetProductByCategory(string CategoryName);
        List<Orders> GetOrders(int? userId, int? orderId);


		void AddToCart(int customerId, int productId,int Quantity);
        Task<IEnumerable<Cart>> GetCart(int? id);
         
        Task DeleteFromCart(int wishlistId, int CustomerID);
        void AddShippingAddress(ShippingAddress shippingAddress);
        void AddOrder(Orders order);
        void EmptyCart(int? CustomerID);
        void UpdateQuantity(int cartId, int quantity);
        void AddOrderDetails(OrderDetails order);
        int GetOrderId();
        Core.Coupon GetCouponByCode(string couponCode);
        bool IsCouponValid(Core.Coupon coupon);
        IEnumerable<Core.Review> GetReviewsByProductId(int productId);
        void AddReview(Core.Review review);
        int GetAverageRatingByProductId(int productId);
        int GetReviewsByEmail(string email, int? productId);

        
        void Payment_trial(List<Payment>? paymentsToAdd);
		Payment GetPaymentLast();
        Orders GetOrderById(int? order_id);
        Core.Customer GetCustomerById(int? Customer_id);
	}
}
