using ShopWatch.BussinessLogicLayer.IService;
using ShopWatch.Model;
using ShopWatch.Model.DataContext;
using ShopWatch.WebMvc.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace ShopWatch.WebMvc.Controllers
{
    public class PurchaseOrderController : Controller
    {
        private readonly ShopWatchDataContext _context;
        private readonly IOrderService _orderService;
        public PurchaseOrderController(/*ShopWatchDataContext context,*/ IOrderService orderService)
        {
            //_context = context;
            _context = new ShopWatchDataContext();
            _orderService = orderService;
        }
        public ActionResult Index()
        {
            try
            {
                var session = (UserLogin)Session["UserSession"];
                var user = _context.Users.FirstOrDefault(m => m.AccountId == session.AccountId);
                var listOrder = _context.Orders.Where(m => m.UserId == user.UserId).ToList();
                foreach(var item in listOrder)
                {
                    var lstOrderDetail = _context.OrderDetails.Where(o => o.OrderId == item.OrderId).ToList();
                    item.OrderDetails = lstOrderDetail;
                }
                return View(listOrder);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ActionResult Detail(int id)
        {
            var order = _orderService.GetById(id);
            if (order == null) return HttpNotFound();
            return View(order);
        }
        public ActionResult Cancelled(int id)
        {
            var order = _orderService.GetById(id);
            if (order == null) return HttpNotFound();
            order.Status = Model.Enum.Status.Cancelled;
            _orderService.Update(order);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _context.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}