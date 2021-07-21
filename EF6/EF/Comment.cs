namespace EF6.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Comment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Comment()
        {
          ;
        }

        public int CommentId { get; set; }

        public double? Rate { get; set; }

        public string Text { get; set; }

        public int? WatchId { get; set; }

        public int? AccountId { get; set; }

        [Column(TypeName = "text")]
        public string Likes { get; set; } 

        public bool IsBuy { get; set; } = false;

        public DateTime? ModifyDate { get; set; }
               
    }
}
