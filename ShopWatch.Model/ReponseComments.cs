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
    public class ReponseComment
    {
        [Key]
        public int ReponseCommentId { get; set; }

        [Display(Name = "Text")]
        [StringLength(4000)]
        public string Text { get; set; }
        public int AccountId { get; set; }
        public int CommentId { get; set; }
        public string Likes { get; set; }
        public bool IsBuy { get; set; }

        [ForeignKey("CommentId")]
        public virtual Comment Comment { get; set; }
    }
}
