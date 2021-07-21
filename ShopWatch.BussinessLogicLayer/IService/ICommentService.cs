using EF6.EF;
using EF6.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ShopWatch.BussinessLogicLayer.IService
{
	public interface ICommentService
	{
		
		bool Update(Comment entity);
		//Task<bool> UpdateAsync(TEntity entity);

		bool Delete(object id);
		bool DeleteAsync(object id);

		int Count();
		int CountAsync();

		Comment GetById(object id);
		//Task<TEntity> GetByIdAsync(object id);

		PaginatedList<CommentViewModel> GetAsync(int watchId,
			 int page = 1, int pageSize = 10);

		IEnumerable<Comment> GetAll();
		//Task<IEnumerable<TEntity>> GetAllAsync();

		Comment Find(Expression<Func<Comment, bool>> filter);
		Comment FindInclude(Expression<Func<Comment, bool>> filter, string includeProperties = "");
		//Task<TEntity> FindAsync(Expression<Func<TEntity, bool>> filter);
		IEnumerable<Comment> FindAll(Expression<Func<Comment, bool>> filter);
		//Task<IEnumerable<TEntity>> FindAllAsync(Expression<Func<TEntity, bool>> filter);

		// set trạng thái like cho comment
		bool SetLikeItem(bool like, int commentId, int accoutID, ref int countLike);

		// Sửa comment
		int Post(Comment comment);

		// Sửa comment
		int Create(Comment comment);
	}
}
