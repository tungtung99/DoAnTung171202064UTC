using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EF6.EF;
using Newtonsoft.Json;
using ShopWatch.BussinessLogicLayer.IService;
using ShopWatch.WebMvc.Models;

namespace ShopWatch.WebMvc.Controllers
{
    public class CommentsController : Controller
    {
        private DbDoAnContect db = new DbDoAnContect();

        private readonly ICommentService _commentService;

        public CommentsController(ICommentService commentService)
        {
            this._commentService = commentService;
        }

        // GET: Comments
        public ActionResult Index()
        {
            return View(db.Comments.ToList());
        }

        // GET: Comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // GET: Comments/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Comments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]       
        public ActionResult Create([Bind(Include = "Rate,Text,WatchId,AccountId,Likes,IsBuy")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                var session = (UserLogin)Session["UserSession"];
                comment.AccountId = session.AccountId;
                comment.ModifyDate = DateTime.Now;
                var count = this._commentService.Create(comment);
                return Json(new
                {
                    status = count > 0 ? true : false
                });
            }
            return Json(new
            {
                status = false
            });
        }
        // POST: Comments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]        
        public ActionResult Edit([Bind(Include = "CommentId,Rate, Text, WatchId, AccountId")] Comment comment)
        {
            var count = this._commentService.Post(comment);
            if (count > 0)
            {
                return Json(new
                {
                    status = true,
                    text = comment.Text,
                    modifyDate = JsonConvert.SerializeObject(comment.ModifyDate)
                });
            }
            else
            {
                return Json(new
                {
                    status = false
                });
            }
        }

        // POST: Comments/Delete/5
        [HttpPost]        
        public ActionResult DeleteConfirmed(int id)
        {
            Comment comment = db.Comments.Find(id);
            db.Comments.Remove(comment);
            var status = db.SaveChanges() >0? true: false;
            return Json(new
            {
                status = status
            });
        }

        public ActionResult Commentlist(int watchId, int page )
        {         
            var commentList = this._commentService.GetAsync(watchId, page: page);
            ViewBag.watchId = watchId;

            return PartialView(commentList);
        }

        //Lưu trạng thái của like
        public ActionResult setLikeItem(bool isLike, int commentId)
        {
            var session = (UserLogin)Session["UserSession"];
            int accountId = session.AccountId;
            int countLike = 0;
            var like = this._commentService.SetLikeItem(isLike, commentId, accountId, ref countLike);
            return Json(new
            {
                like = like,
                countLike = countLike
            });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
