using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopWatch.WebMvc.Models
{
    public class Ward
    {
        public string wardid { get; set; }
        public string name { get; set; }
        public string districtid { get; set; }

        public Ward()
        {

        }

        public Ward(string wardid, string name, string districtid)
        {
            this.wardid = wardid;
            this.name = name;
            this.districtid = districtid;
        }
    }
}