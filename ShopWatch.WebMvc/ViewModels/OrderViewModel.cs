using ShopWatch.Model.Enum;
using System;

namespace ShopWatch.WebMvc.ViewModels
{
	public class OrderViewModel
	{

        public Status Status { get; set; }

        public string ShipAddress { get; set; }
        public string Provin { get; set; }
        public string District { get; set; }
        public string ShipAddresss { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        
        public string PhoneNumber { get; set; }

	}
}