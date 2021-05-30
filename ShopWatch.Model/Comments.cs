using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel;

namespace ShopWatch.Model
{
    public class Comment
    {
        [Key]        
        public int CommentId { set; get; }

        [Display(Name = "Text")]
        [StringLength(4000)]
        public string Text { set; get; }

        public int WatchId { set; get; }
        
        public int AccountId { set; get; }

        [Display(Name = "lile")]
        public string Likes { set; get; }

        [Display(Name = "is buy")]
        [DefaultValue(false)]
        public bool IsBuy { set; get; }

        public virtual ICollection<ReponseComment> ReponseComments { set; get; }
    }
}
