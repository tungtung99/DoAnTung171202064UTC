using EF6.EF;
using ShopWatch.BussinessLogicLayer;
using ShopWatch.BussinessLogicLayer.IService;
using ShopWatch.Model;
using ShopWatch.Model.DataContext;
using ShopWatch.WebMvc.Models;
using ShopWatch.WebMvc.ViewModels.Customer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ShopWatch.WebMvc.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly IWatchService _watchServices;
        private readonly DbDoAnContect db1 = new DbDoAnContect();
        private ShopWatchDataContext db = new ShopWatchDataContext();
        public ShoppingCartController(IWatchService watchServices)
        {
            _watchServices = watchServices;
        }
        public ActionResult Index()
        {
            var lstShopCartItem = new List<ShoppingCartItem>();
            var session = (UserLogin)Session["UserSession"];
            if (session != null)
            {

                int id = session.AccountId;
                var lstCart = db1.Carts.Where(c => c.UserId == id).ToList();
                //var lstWatch = new List<ShopWatch.Model.Watch>();
                foreach (var item in lstCart)
                {
                    int watchId = item.WatchId;
                    var recordWatch = db.Watches.Where(w => w.WatchId == watchId).FirstOrDefault();
                    ShoppingCartItem cartItem = new ShoppingCartItem();
                    cartItem.WatchId = recordWatch.WatchId;
                    cartItem.Quantity = item.Quantity;
                    cartItem.Price = recordWatch.PricePromotion != 0 ? recordWatch.PricePromotion : recordWatch.Price;
                    cartItem.WatchId = recordWatch.WatchId;
                    cartItem.Watch = recordWatch;
                    lstShopCartItem.Add(cartItem);
                }
                Session[ConstantCommon.Cart] = null;
                Session[ConstantCommon.Cart] = lstShopCartItem;
            }
            var cart = Session[ConstantCommon.Cart] as List<ShoppingCartItem> ?? new List<ShoppingCartItem>();

            if (cart.Count == 0 || Session[ConstantCommon.Cart] == null)
            {
                ViewBag.Message = "Don't have any item in your cart.";
                return View();
            }

            decimal total = 0m;
            foreach (var item in cart)
            {
                total += item.Total;
            }
            ViewBag.GrandTotal = total;

            return View(cart);
        }

        public ActionResult CartPartial()
        {
            ShoppingCartItem model = new ShoppingCartItem();

            int qty = 0;
            decimal price = 0m;
            if (Session[ConstantCommon.Cart] != null)
            {
                var list = (List<ShoppingCartItem>)Session[ConstantCommon.Cart];
                foreach (var item in list)
                {
                    qty += item.Quantity;
                    price += item.Quantity * item.Price;
                }
                model.Quantity = qty;
                model.Price = price;
            }
            else
            {
                model.Quantity = 0;
                model.Price = 0m;
            }

            return PartialView(model);
        }

        public ActionResult AddToCartPartial(int id)
        {
            List<ShoppingCartItem> cart = Session[ConstantCommon.Cart] as List<ShoppingCartItem> ?? new List<ShoppingCartItem>();

            ShoppingCartItem model = new ShoppingCartItem();

            ShopWatch.Model.Watch watch = _watchServices.GetById(id);

            var itemInCart = cart.FirstOrDefault(x => x.WatchId == id);

            if (itemInCart == null)
            {
                cart.Add(new ShoppingCartItem()
                {
                    Watch = watch,
                    WatchId = watch.WatchId,
                    Quantity = 1,
                    Price = watch.PricePromotion,
                });
            }
            else
            {
                itemInCart.Quantity++;
            }

            int qty = 0;
            decimal price = 0m;
            foreach (var item in cart)
            {
                qty += item.Quantity;
                price += item.Quantity * item.Price;
            }
            model.Quantity = qty;
            model.Price = price;
            Session[ConstantCommon.Cart] = cart;
            var session = (UserLogin)Session["UserSession"];
            int idUser = session.AccountId;
            var delete = db1.Carts.Where(c => c.UserId == idUser).ToList();
            db1.Carts.RemoveRange(delete);
            db1.SaveChanges();
            foreach (var item in cart)
            {
                var checkAdd = db1.Carts.Where(c => c.UserId == idUser && c.WatchId == item.WatchId).FirstOrDefault();
                if (checkAdd == null)
                {
                    Cart cart1 = new Cart();
                    cart1.Quantity = item.Quantity;
                    cart1.UserId = idUser;
                    cart1.WatchId = item.WatchId;
                    cart1.CreatedDate = DateTime.Now;
                    db1.Carts.Add(cart1);
                    db1.SaveChanges();
                }
                else
                {
                    int soluong = checkAdd.Quantity;
                    checkAdd.Quantity = soluong + item.Quantity;
                    db1.SaveChanges();
                }
            }

            return PartialView(model);
        }

        public JsonResult IncrementProduct(int watchId)
        {
            List<ShoppingCartItem> cart = Session[ConstantCommon.Cart] as List<ShoppingCartItem>;

            ShoppingCartItem item = cart.FirstOrDefault(x => x.WatchId == watchId);

            item.Quantity++;
            var session = (UserLogin)Session["UserSession"];
            int idUser = session.AccountId;
            var addCart = db1.Carts.Where(c => c.WatchId == watchId && c.UserId == idUser).FirstOrDefault();
            int soluong = addCart.Quantity;
            addCart.Quantity = soluong + 1;
            db1.SaveChanges();

            var result = new { qty = item.Quantity, price = item.Price };

            return Json(result, JsonRequestBehavior.AllowGet);

        }

        public ActionResult DecrementProduct(int watchId)
        {
            List<ShoppingCartItem> cart = Session[ConstantCommon.Cart] as List<ShoppingCartItem>;

            ShoppingCartItem item = cart.FirstOrDefault(x => x.WatchId == watchId);

            if (item.Quantity > 1)
            {
                item.Quantity--;
                var session = (UserLogin)Session["UserSession"];
                int idUser = session.AccountId;
                var SubCart = db1.Carts.Where(c => c.WatchId == watchId && c.UserId == idUser).FirstOrDefault();
                int soluong = SubCart.Quantity;
                SubCart.Quantity = soluong - 1;
                db1.SaveChanges();
            }
            else
            {
                item.Quantity = 0;
                cart.Remove(item);
                var session = (UserLogin)Session["UserSession"];
                int idUser = session.AccountId;
                var SubCart = db1.Carts.Where(c => c.WatchId == watchId && c.UserId == idUser).FirstOrDefault();
                db1.Carts.Remove(SubCart);
                db1.SaveChanges();
            }

            var result = new { qty = item.Quantity, price = item.Price };

            return Json(result, JsonRequestBehavior.AllowGet);

        }

        public void RemoveProduct(int watchId)
        {
            List<ShoppingCartItem> cart = Session[ConstantCommon.Cart] as List<ShoppingCartItem>;

            ShoppingCartItem item = cart.FirstOrDefault(x => x.WatchId == watchId);

            cart.Remove(item);
            /*var delete = db.Carts.Where(c => c.WatchId == watchId)*/
        }
    }
}