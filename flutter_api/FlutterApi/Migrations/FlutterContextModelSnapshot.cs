// <auto-generated />
using System;
using FlutterApi.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace FlutterApi.Migrations
{
    [DbContext(typeof(FlutterContext))]
    partial class FlutterContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.4")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("FlutterApi.Models.BowlingAlley", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ImageUrl")
                        .HasMaxLength(512)
                        .HasColumnType("nvarchar(512)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PhoneNo")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("BowlingAlleys");
                });

            modelBuilder.Entity("FlutterApi.Models.Tournament", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("BowlingAlleyId")
                        .HasColumnType("int");

                    b.Property<bool>("IsEnded")
                        .HasColumnType("bit");

                    b.Property<bool>("IsStarted")
                        .HasColumnType("bit");

                    b.Property<int>("MaxPlayers")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("nvarchar(20)");

                    b.Property<int>("OrganiserId")
                        .HasColumnType("int");

                    b.Property<int>("PlayersCount")
                        .HasColumnType("int");

                    b.Property<string>("Prize")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("Start")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.HasIndex("BowlingAlleyId");

                    b.HasIndex("OrganiserId");

                    b.ToTable("Tournaments");
                });

            modelBuilder.Entity("FlutterApi.Models.User", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("BowlingAlleyId")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("nvarchar(20)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Surname")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("nvarchar(20)");

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasMaxLength(15)
                        .HasColumnType("nvarchar(15)");

                    b.HasKey("Id");

                    b.HasIndex("BowlingAlleyId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("TournamentUser", b =>
                {
                    b.Property<int>("JoinedTournamentsId")
                        .HasColumnType("int");

                    b.Property<int>("UsersId")
                        .HasColumnType("int");

                    b.HasKey("JoinedTournamentsId", "UsersId");

                    b.HasIndex("UsersId");

                    b.ToTable("TournamentUser");
                });

            modelBuilder.Entity("FlutterApi.Models.Tournament", b =>
                {
                    b.HasOne("FlutterApi.Models.BowlingAlley", "BowlingAlley")
                        .WithMany("Tournaments")
                        .HasForeignKey("BowlingAlleyId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("FlutterApi.Models.User", "Organiser")
                        .WithMany("OrganisedTournaments")
                        .HasForeignKey("OrganiserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("BowlingAlley");

                    b.Navigation("Organiser");
                });

            modelBuilder.Entity("FlutterApi.Models.User", b =>
                {
                    b.HasOne("FlutterApi.Models.BowlingAlley", "BowlingAlley")
                        .WithMany()
                        .HasForeignKey("BowlingAlleyId");

                    b.Navigation("BowlingAlley");
                });

            modelBuilder.Entity("TournamentUser", b =>
                {
                    b.HasOne("FlutterApi.Models.Tournament", null)
                        .WithMany()
                        .HasForeignKey("JoinedTournamentsId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("FlutterApi.Models.User", null)
                        .WithMany()
                        .HasForeignKey("UsersId")
                        .OnDelete(DeleteBehavior.ClientCascade)
                        .IsRequired();
                });

            modelBuilder.Entity("FlutterApi.Models.BowlingAlley", b =>
                {
                    b.Navigation("Tournaments");
                });

            modelBuilder.Entity("FlutterApi.Models.User", b =>
                {
                    b.Navigation("OrganisedTournaments");
                });
#pragma warning restore 612, 618
        }
    }
}
