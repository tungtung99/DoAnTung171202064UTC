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

        public int? Rate { get; set; }

        public string Text { get; set; }

        public int? WatchId { get; set; }

        public int? AccountId { get; set; }

        [Column(TypeName = "text")]
        public string Likes { get; set; }

        public bool IsBuy { get; set; }

        public DateTime? ModifyDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReponseComment> ReponseComments { get; set; }
    }
}
