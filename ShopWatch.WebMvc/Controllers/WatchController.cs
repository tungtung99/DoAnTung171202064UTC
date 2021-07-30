using ShopWatch.BussinessLogicLayer;
using ShopWatch.BussinessLogicLayer.IService;
using ShopWatch.Model;
using ShopWatch.WebMvc.ViewModels.Customer;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ShopWatch.WebMvc.Controllers
{
	public class WatchController : Controller
	{
		private readonly IWatchService _watchServices;
		public WatchController(IWatchService watchServices)
		{
			_watchServices = watchServices;
		}
		public ActionResult ListByCategory(string category)
		{
			IEnumerable<Watch> watches;
			string currentCategory = string.Empty;

			if (category.IsBlank())
			{
				watches = _watchServices.GetAsync(orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 10);
				currentCategory = "All of Watches";
			}
			else
			{
				watches = _watchServices.GetAsync(filter: b => b.Category.CategoryName == category, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 10);
				currentCategory = category;
			}

			return View(new WatchListByCategoryViewModel
			{
				Watches = watches,
				CurrentCategory = currentCategory
			});
		}

		public ActionResult ListByPublisher(string publisher)
		{
			IEnumerable<Watch> watches;
			string currentPublisher = string.Empty;

			if (publisher.IsBlank())
			{
				watches = _watchServices.GetAsync(orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);
				currentPublisher = "All of Watches";
			}
			else
			{
				watches = _watchServices.GetAsync(filter: b => b.Publisher.PublisherName == publisher, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);
				currentPublisher = publisher;
			}

			return View(new WatchListByPublisherViewModel
			{
				Watches = watches,
				CurrentPublisher = currentPublisher
			});
		}
		public  ActionResult ListByPrice(decimal priceLevel)
		{
			IEnumerable<Watch> watches;
            IEnumerable<Watch> watches1;
            string currentPrice;
            string currentPrice1;

            if (priceLevel < 0)
			{
				watches = _watchServices.GetAsync(orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);
				currentPrice = "";
			}
			else
			{
                if(priceLevel == 1)
                {
                    watches = _watchServices.GetAsync(filter: b => b.Price >= 1000000 && b.Price < 5000000, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);

                    currentPrice = 1000000.ToString("0,0,0") + "-" + 5000000.ToString("0,0,0");
                    return View(new WatchListByPriceViewModel
                    {
                        Watches = watches,
                        CurrentPrice = currentPrice
                    });
                } 
                else if(priceLevel == 2)
                {
                    watches = _watchServices.GetAsync(filter: b => b.Price >= 5000000 && b.Price < 10000000, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);

                    currentPrice = 5000000.ToString("0,0,0") + "-" + 10000000.ToString("0,0,0");
                    return View(new WatchListByPriceViewModel
                    {
                        Watches = watches,
                        CurrentPrice = currentPrice
                    });
                }
                else if(priceLevel == 3)
                {
                    watches = _watchServices.GetAsync(filter: b => b.Price >= 10000000 && b.Price < 20000000, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);

                    currentPrice = 10000000.ToString("0,0,0") +"-"+ 20000000.ToString("0,0,0");
                    return View(new WatchListByPriceViewModel
                    {
                        Watches = watches,
                        CurrentPrice = currentPrice
                    });
                }
                else
                {
                    watches = _watchServices.GetAsync(filter: b => b.Price >= 20000000, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);

                    currentPrice = " > "+ 20000000.ToString("0,0,0");
                    return View(new WatchListByPriceViewModel
                    {
                        Watches = watches,
                        CurrentPrice = currentPrice
                    });
                }
                /*switch (priceLevel)
                {
                    case 1:
                        watches = _watchServices.GetAsync(filter: b => b.Price >= 1000000 && b.Price < 5000000, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);

                        currentPrice = "1000000 - 5000000";
                        break;
                    case 2:
                        watches = _watchServices.GetAsync(filter: b => b.Price >= 5000000 && b.Price < 10000000, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);

                        currentPrice = priceLevel.ToString("0,0,0");
                        break;
                    case 3:
                        watches = _watchServices.GetAsync(filter: b => b.Price >= 10000000 && b.Price < 20000000, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);

                        currentPrice = priceLevel.ToString("0,0,0");
                        break;
                    case 4:
                        watches = _watchServices.GetAsync(filter: b => b.Price >= 20000000, orderBy: b => b.OrderBy(x => x.WatchName), page: 1, pageSize: 100);

                        currentPrice = priceLevel.ToString("0,0,0");
                        break;
                }
                watches1 = watches;*/

				//currentPrice = priceLevel.ToString("0,0,0");
			}

            return View(new WatchListByPriceViewModel
            {
                Watches = watches,
                CurrentPrice = currentPrice
            });

        }
		public ActionResult Details(int id)
		{
			var watch =  _watchServices.GetById(id);
			if (watch == null)
				return HttpNotFound();
			return View(watch);
		}
	}
}