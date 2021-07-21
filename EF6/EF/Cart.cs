namespace EF6.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Cart")]
    public partial class Cart
    {
        public int CartId { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int UserId { get; set; }

        public int WatchId { get; set; }
        public int Quantity { get; set; }

        public virtual User User { get; set; }
    }
}