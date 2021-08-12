using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopWatch.WebMvc.Models
{
    public class Village
    {
        public string villageid { get; set; }
        public string name { get; set; }
        public string wardid { get; set; }

        public Village()
        {

        }

        public Village(string villageid, string name, string wardid)
        {
            this.villageid = villageid;
            this.name = name;
            this.wardid = wardid;
        }
    }
}