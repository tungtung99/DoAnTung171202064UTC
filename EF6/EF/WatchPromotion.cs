
namespace EF6.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    public class WatchPromotion
    {
        
        [Required]
        public int WatchId { get; set; }

        [Required]
        public int PromotionId { get; set; }

        public WatchPromotion(int watchId, int promotionId)
        {
            WatchId = watchId;
            PromotionId = promotionId;
        }
    }
}
