using EF6.EF;
using EF6.ViewModel;
using ShopWatch.BussinessLogicLayer.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ShopWatch.BussinessLogicLayer.Services
{
    public class CommentService : ICommentService
    {
        private readonly DbDoAnContect _context = new DbDoAnContect();

        public int Count()
        {

            throw new NotImplementedException();
        }

        public int CountAsync()
        {
            throw new NotImplementedException();
        }

        public bool Delete(object id)
        {
            throw new NotImplementedException();
        }

        public bool DeleteAsync(object id)
        {
            throw new NotImplementedException();
        }

        public Comment Find(Expression<Func<Comment, bool>> filter)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Comment> FindAll(Expression<Func<Comment, bool>> filter)
        {
            throw new NotImplementedException();
        }

        public Comment FindInclude(Expression<Func<Comment, bool>> filter, string includeProperties = "")
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Comment> GetAll()
        {
            throw new NotImplementedException();
        }

        public PaginatedList<CommentViewModel> GetAsync(int watchId, int page = 1, int pageSize = 10)
        {
            var comments = (from c in this._context.Comments
                            join a in this._context.Accounts on c.AccountId equals a.AccountId
                            where c.WatchId == watchId
                            orderby c.ModifyDate descending
                            select new CommentViewModel()
                            {
                                CommentId = c.CommentId,
                                Rate = c.Rate,
                                Text = c.Text,
                                WatchId = c.WatchId,
                                AccountId = c.AccountId,
                                Likes = c.Likes,
                                IsBuy = c.IsBuy,
                                ModifyDate = c.ModifyDate,
                                AccountName = a.AccountName
                            }).ToList<CommentViewModel>();
            int count = comments.Count();
            var list = comments.Skip(pageSize * (page - 1)).Take(pageSize).ToList<CommentViewModel>();


            return new PaginatedList<CommentViewModel>(list, count,  page, pageSize);       

        }

        /// Hàm thêm, xoa like cho comment
        /// </summary>
        /// <param name="isLike"></param>
        /// <param name="commentId"></param>
        /// <param name="accountId"></param>
        /// <returns></returns>
        public bool SetLikeItem(bool isLike, int commentId, int accountId, ref int countLike)
        {
            Comment comment = this._context.Comments.Find(commentId);
            List<string> list = string.IsNullOrEmpty(comment.Likes) ? new List<string>() : comment.Likes.Split(',').ToList();         
            bool like = isLike;
            if (list.Contains(accountId.ToString()) && isLike) //// xóa like
            {               
                int numIndex = list.IndexOf(accountId.ToString());
                list.RemoveAt(numIndex);
                comment.Likes = string.Join(",", list);
                like = false;
            }
            else if(!list.Contains(accountId.ToString()) && !isLike) //thêm like
            {
                list.Add(accountId.ToString());
                comment.Likes = string.Join(",", list);
                like = true;
            }
            _context.Comments.Attach(comment);
            _context.Entry(comment).Property("Likes").IsModified = true;     
            if (_context.SaveChanges() > 0)
            {
                countLike = string.IsNullOrEmpty(comment.Likes)? 0: comment.Likes.Split(',').Length;
                return like;
            }            
            return isLike;
        }

        public Comment GetById(object id)
        {
            throw new NotImplementedException();
        }

        public bool Update(Comment entity)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Sửa comment
        /// </summary>
        /// <param name="comment"></param>
        /// <returns></returns>
        public int Post(Comment comment)
        {
            _context.Comments.Attach(comment);
            _context.Entry(comment).Property("Text").IsModified = true;
            comment.ModifyDate = DateTime.Now;
            return _context.SaveChanges();
        }

        public int Create(Comment comment)
        {
            var count = (from od in _context.OrderDetails
                         join o in _context.Orders on od.OrderId equals o.OrderId
                         join u in _context.Users on o.UserId equals u.UserId
                         join a in _context.Accounts on u.AccountId equals a.AccountId
                         where od.WatchId == comment.WatchId
                         select od).Count();
            if (count > 0)
            {
                comment.IsBuy = true;
            }
            _context.Comments.Add(comment);            
            return _context.SaveChanges();
        }
    }
}