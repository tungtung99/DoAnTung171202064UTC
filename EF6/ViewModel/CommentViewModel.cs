using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EF6.ViewModel
{
    public class CommentViewModel
    {
        public int CommentId { get; set; }

        public double? Rate { get; set; }

        public string Text { get; set; }

        public int? WatchId { get; set; }

        public int? AccountId { get; set; }

        public string Likes { get; set; }

        public bool IsBuy { get; set; }

        public DateTime? ModifyDate { get; set; }

        public string AccountName { get; set; }
    }
}
