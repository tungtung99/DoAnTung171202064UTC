namespace EF6.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ReponseComment
    {
        public int ReponseCommentId { get; set; }

        public string Text { get; set; }

        public int? AcountId { get; set; }

        public bool IsBuy { get; set; }

        [Column(TypeName = "text")]
        public string Likes { get; set; }

        public int? CommentId { get; set; }

        public virtual Comment Comment { get; set; }
    }
}
