using ShopWatch.BussinessLogicLayer.IGennericRepository;
using ShopWatch.BussinessLogicLayer.IService;
using ShopWatch.Model;
using System;
using System.Collections.Generic;



namespace ShopWatch.BussinessLogicLayer.Services
{
	public class CheckoutService : ICheckoutService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IGenericRepository<Order> _orderRepository;
		private readonly IGenericRepository<OrderDetail> _orderDetailRepository;
		private readonly IGenericRepository<Watch> _watchRepository; 
        private readonly EF6.EF.DbDoAnContect db1 = new EF6.EF.DbDoAnContect();



        public CheckoutService(
			IUnitOfWork unitOfWork,
			IGenericRepository<Order> orderRepository,
			IGenericRepository<OrderDetail> orderDetailRepository,
			IGenericRepository<Watch> bookRepository)
		{
			_unitOfWork = unitOfWork;
			_orderRepository = orderRepository;
			_orderDetailRepository = orderDetailRepository;
			_watchRepository = bookRepository;
		}
		public void Checkout(Order order, List<OrderDetail> orderDetails)
		{
			//Custom trang thái order
			order.CreatedDate = DateTime.Now;
			order.ShippedDate = DateTime.Now.AddDays(4);
			order.ModifiedDate = DateTime.Now;
			order.Status = Model.Enum.Status.WaitingDelivery;

			_orderRepository.Add(order);

            _unitOfWork.Commit();
            foreach (var orderDetail in orderDetails)
			{
				//Tìm sản phẩm muốn trừ số lượng
				var watch = _watchRepository.GetById(orderDetail.WatchId);
				//trừ số lượng
				watch.Quantity -= orderDetail.Quantity;
				_watchRepository.Update(watch); //Update tại bảng watch ứng với watchId
                orderDetail.OrderId = order.OrderId;
                orderDetail.Order = order;
                EF6.EF.OrderDetail record = new EF6.EF.OrderDetail();
                record.OrderId = order.OrderId;
                record.Quantity = orderDetail.Quantity;
                record.WatchId = orderDetail.WatchId;
                record.UnitPrice = orderDetail.UnitPrice;

                db1.OrderDetails.Add(record);
                db1.SaveChanges();

            }
			
		}
	}
}
