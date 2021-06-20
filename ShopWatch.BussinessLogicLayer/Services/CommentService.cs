using EF6.EF;
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

        public int Create(Comment entity)
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

        public PaginatedList<Comment> GetAsync(Expression<Func<Comment, bool>> filter = null, int page = 1, int pageSize = 10)
        {
          
            var comments = this._context.Comments.Where(filter).OrderBy(c =>c.ModifyDate);
            return PaginatedList<Comment>.CreateAsync(comments, page, pageSize);
            
        }

        public Comment GetById(object id)
        {
            throw new NotImplementedException();
        }

        public bool Update(Comment entity)
        {
            throw new NotImplementedException();
        }
    }
}
