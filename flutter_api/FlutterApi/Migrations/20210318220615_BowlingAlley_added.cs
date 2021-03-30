using Microsoft.EntityFrameworkCore.Migrations;

namespace FlutterApi.Migrations
{
    public partial class BowlingAlley_added : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BowlingAlleyId",
                table: "Tournaments",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Prize",
                table: "Tournaments",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "BowlingAlley",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ImageUrl = table.Column<string>(type: "nvarchar(512)", maxLength: 512, nullable: true),
                    PhoneNo = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BowlingAlley", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Tournaments_BowlingAlleyId",
                table: "Tournaments",
                column: "BowlingAlleyId");

            migrationBuilder.AddForeignKey(
                name: "FK_Tournaments_BowlingAlley_BowlingAlleyId",
                table: "Tournaments",
                column: "BowlingAlleyId",
                principalTable: "BowlingAlley",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tournaments_BowlingAlley_BowlingAlleyId",
                table: "Tournaments");

            migrationBuilder.DropTable(
                name: "BowlingAlley");

            migrationBuilder.DropIndex(
                name: "IX_Tournaments_BowlingAlleyId",
                table: "Tournaments");

            migrationBuilder.DropColumn(
                name: "BowlingAlleyId",
                table: "Tournaments");

            migrationBuilder.DropColumn(
                name: "Prize",
                table: "Tournaments");
        }
    }
}
