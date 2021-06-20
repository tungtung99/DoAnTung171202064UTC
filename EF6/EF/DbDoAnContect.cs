using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace EF6.EF
{
    public partial class DbDoAnContect : DbContext
    {
        public DbDoAnContect()
            : base("name=DbDoAnContect")
        {
        }

        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AccountRole> AccountRoles { get; set; }
        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Promotion> Promotions { get; set; }
        public virtual DbSet<Publisher> Publishers { get; set; }
        public virtual DbSet<ReponseComment> ReponseComments { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Watch> Watches { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Comment>()
                .Property(e => e.Likes)
                .IsUnicode(false);

            modelBuilder.Entity<Comment>()
                .HasMany(e => e.ReponseComments)
                .WithOptional(e => e.Comment)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Promotion>()
                .HasMany(e => e.Watches)
                .WithMany(e => e.Promotions)
                .Map(m => m.ToTable("WatchPromotion").MapLeftKey("PromotionId").MapRightKey("WatchId"));

            modelBuilder.Entity<ReponseComment>()
                .Property(e => e.Likes)
                .IsUnicode(false);
        }
    }
}
