using Microsoft.EntityFrameworkCore.Migrations;

namespace FlutterApi.Migrations
{
    public partial class BowlingAlley_tournaments : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tournaments_BowlingAlley_BowlingAlleyId",
                table: "Tournaments");

            migrationBuilder.AlterColumn<int>(
                name: "BowlingAlleyId",
                table: "Tournaments",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Tournaments_BowlingAlley_BowlingAlleyId",
                table: "Tournaments",
                column: "BowlingAlleyId",
                principalTable: "BowlingAlley",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tournaments_BowlingAlley_BowlingAlleyId",
                table: "Tournaments");

            migrationBuilder.AlterColumn<int>(
                name: "BowlingAlleyId",
                table: "Tournaments",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Tournaments_BowlingAlley_BowlingAlleyId",
                table: "Tournaments",
                column: "BowlingAlleyId",
                principalTable: "BowlingAlley",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
