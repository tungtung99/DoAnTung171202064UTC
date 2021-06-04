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
            ReponseComments = new HashSet<ReponseComment>();
        }

        public int CommentId { get; set; }

        public int? rate { get; set; }

        public string Text { get; set; }

        public int? WatchId { get; set; }

        [StringLength(10)]
        public string AccountId { get; set; }

        [Column(TypeName = "text")]
        public string Likes { get; set; }

        public bool IsBuy { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReponseComment> ReponseComments { get; set; }
    }
}
