using Microsoft.EntityFrameworkCore.Migrations;

namespace FlutterApi.Migrations
{
    public partial class nullableAlley : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_BowlingAlleys_BowlingAlleyId",
                table: "Users");

            migrationBuilder.AlterColumn<int>(
                name: "BowlingAlleyId",
                table: "Users",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_BowlingAlleys_BowlingAlleyId",
                table: "Users",
                column: "BowlingAlleyId",
                principalTable: "BowlingAlleys",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_BowlingAlleys_BowlingAlleyId",
                table: "Users");

            migrationBuilder.AlterColumn<int>(
                name: "BowlingAlleyId",
                table: "Users",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Users_BowlingAlleys_BowlingAlleyId",
                table: "Users",
                column: "BowlingAlleyId",
                principalTable: "BowlingAlleys",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
