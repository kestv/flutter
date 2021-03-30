using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace FlutterApi.Models
{
    public class FlutterContext : DbContext
    {
        public DbSet<User> Users { get; set; }

        public DbSet<Tournament> Tournaments { get; set; }

        public DbSet<BowlingAlley> BowlingAlleys { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=DESKTOP-AAG7R7V;Database=flutter;Trusted_Connection=True;MultipleActiveResultSets=true;");
            optionsBuilder.EnableSensitiveDataLogging();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Tournament>()
                .HasOne<BowlingAlley>(s => s.BowlingAlley)
                .WithMany(g => g.Tournaments)
                .HasForeignKey(s => s.BowlingAlleyId)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder.Entity<Tournament>()
                .HasOne<User>(u => u.Organiser)
                .WithMany(t => t.OrganisedTournaments)
                .HasForeignKey(s => s.OrganiserId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(u => u.JoinedTournaments)
                .WithMany(t => t.Users)
                .UsingEntity<Dictionary<string, object>>(
                    "TournamentUser",
                    j => j.HasOne<Tournament>().WithMany().OnDelete(DeleteBehavior.NoAction),
                    j => j.HasOne<User>().WithMany().OnDelete(DeleteBehavior.ClientCascade));
        }
    }
}
