using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopWatch.WebMvc.Models
{
    public class District
    {
        public string districtid { get; set; }
        public string name { get; set; }
        public string provinceid { get; set; }
        public District()
        {

        }

        public District(string districtid, string name, string provinceid)
        {
            this.districtid = districtid;
            this.name = name;
            this.provinceid = provinceid;
        }
    }
}