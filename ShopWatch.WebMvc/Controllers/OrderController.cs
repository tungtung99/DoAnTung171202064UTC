using EF6.EF;
using ShopWatch.BussinessLogicLayer;
using ShopWatch.BussinessLogicLayer.IService;
using ShopWatch.Model;
using ShopWatch.Model.DataContext;
using ShopWatch.WebMvc.Models;
using ShopWatch.WebMvc.ViewModels;
using ShopWatch.WebMvc.ViewModels.Customer;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Order = ShopWatch.Model.Order;
using OrderDetail = ShopWatch.Model.OrderDetail;

namespace ShopWatch.WebMvc.Controllers
{
	public class OrderController : Controller
	{
		private const string CartSession = "CartSession";
		private readonly IOrderService _orderService;
        private readonly DbDoAnContect _db1; /*= new DbDoAnContect();*/
        private readonly ICheckoutService _checkoutService;
        private readonly ShopWatchDataContext _context;/* = new ShopWatchDataContext();*/


        public OrderController(IOrderService orderService, ICheckoutService checkoutService, ShopWatchDataContext context, DbDoAnContect db1)
		{
			_orderService = orderService;
			_checkoutService = checkoutService;
            _context = context;
            _db1 = db1;
		}

        //public ActionResult GetProvince(int id)
        //{
        //    ReadFile.ReadFileTxt();
        //    var abc = Golobal.wards;
        //    var abc1 = Golobal.districts.Where(x=>x.provinceid.Equals(id));
        //    var abc2 = Golobal.villages;
        //    var abc3 = Golobal.provinces;
        //    return abc1;
        //}

        public ActionResult Checkout()
		{
            ReadFile.ReadFileTxt();
            var abc = Golobal.wards;
            var abc1 = Golobal.districts;
            var abc2 = Golobal.villages;
            var abc3 = Golobal.provinces;
			var session = (UserLogin)Session["UserSession"];
            ViewBag.District = abc1;
            ViewBag.Provinces = abc3;
            ViewBag.District1 = abc1;
            if (session != null)
			{
				var user = _context.Users.SingleOrDefault(m => m.AccountId == session.AccountId);
				if(user==null)
				{
					HttpNotFound();
				}
				else
				{
                    var orderViewModel = new OrderViewModel()
                    {
                        Name = user.Name,
                        Email = user.Email,
                        PhoneNumber = user.Phone,
					};
					return View(orderViewModel);
				}

			}
			return View();
		}

		[HttpPost]
		public ActionResult Checkout(OrderViewModel orderViewModel)
		{

			var cart = Session[ConstantCommon.Cart];
			var cartItems = (List<ShoppingCartItem>)cart;
			var session = (UserLogin)Session["UserSession"];
			var customer = _context.Users.SingleOrDefault(m => m.AccountId == session.AccountId);
			ViewBag.MessageUi = "";
			if (cartItems.Count == 0)
			{
				ModelState.AddModelError("", "Giỏ hàng của bạn hiện trống không, chọn mua đồng hồ đi nhé!");
			}

			if (ModelState.IsValid)
			{
				List<OrderDetail> orderDetails = new List<OrderDetail>();
				var order = new Order()
				{
					ShipAddress = orderViewModel.ShipAddress +"-"+ orderViewModel.District +"-"+ orderViewModel.Provin,
					PhoneNumber = orderViewModel.PhoneNumber,
					UserId = customer.UserId

				};
				foreach (var item in cartItems)
				{
					var orderDetail = new OrderDetail()
					{
						Watch = item.Watch,
						WatchId = item.WatchId,
						Quantity = item.Quantity,
						UnitPrice = item.Watch.PricePromotion,
						OrderId = order.OrderId
					};
					if (!CheckQuantity.Check(orderDetail.WatchId, orderDetail.Quantity))
					{
						ViewBag.MessageUi += "Không đủ số lượng yêu cầu";
						return View();
					}
					else
						orderDetails.Add(orderDetail);
				}
                _checkoutService.Checkout(order, orderDetails);
				cartItems.Clear();
                var delete = _db1.Carts.Where(c => c.UserId == customer.UserId).ToList();
                _db1.Carts.RemoveRange(delete);
                _db1.SaveChanges();
                _context.SaveChanges();
				return RedirectToAction("CheckoutComplete");
			}
			return View(orderViewModel);
		}

		public ActionResult CheckoutComplete()
		{
			ViewBag.CheckoutCompleteMessage = " Cảm ơn bạn đã đặt hàng, đơn hàng của bạn sẽ sớm được chuyển tới bạn, Xin cảm ơn!";

			return View();
		}
	}
}