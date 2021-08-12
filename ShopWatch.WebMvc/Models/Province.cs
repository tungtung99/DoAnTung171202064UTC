using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopWatch.WebMvc.Models
{
    public class Province
    {
        public string provinceid { get; set; }
        public string name { get; set; }

        public Province()
        {

        }

        public Province(string provinceid, string name)
        {
            this.provinceid = provinceid;
            this.name = name;
        }
    }
}