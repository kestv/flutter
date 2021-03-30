using Microsoft.EntityFrameworkCore.Migrations;

namespace FlutterApi.Migrations
{
    public partial class organiser : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tournaments_BowlingAlley_BowlingAlleyId",
                table: "Tournaments");

            migrationBuilder.DropForeignKey(
                name: "FK_TournamentUser_Tournaments_TournamentsId",
                table: "TournamentUser");

            migrationBuilder.DropForeignKey(
                name: "FK_TournamentUser_Users_UsersId",
                table: "TournamentUser");

            migrationBuilder.DropPrimaryKey(
                name: "PK_BowlingAlley",
                table: "BowlingAlley");

            migrationBuilder.RenameTable(
                name: "BowlingAlley",
                newName: "BowlingAlleys");

            migrationBuilder.RenameColumn(
                name: "TournamentsId",
                table: "TournamentUser",
                newName: "JoinedTournamentsId");

            migrationBuilder.AddColumn<int>(
                name: "BowlingAlleyId",
                table: "Users",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "OrganiserId",
                table: "Tournaments",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_BowlingAlleys",
                table: "BowlingAlleys",
                column: "Id");

            migrationBuilder.CreateIndex(
                name: "IX_Users_BowlingAlleyId",
                table: "Users",
                column: "BowlingAlleyId");

            migrationBuilder.CreateIndex(
                name: "IX_Tournaments_OrganiserId",
                table: "Tournaments",
                column: "OrganiserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Tournaments_BowlingAlleys_BowlingAlleyId",
                table: "Tournaments",
                column: "BowlingAlleyId",
                principalTable: "BowlingAlleys",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Tournaments_Users_OrganiserId",
                table: "Tournaments",
                column: "OrganiserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TournamentUser_Tournaments_JoinedTournamentsId",
                table: "TournamentUser",
                column: "JoinedTournamentsId",
                principalTable: "Tournaments",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TournamentUser_Users_UsersId",
                table: "TournamentUser",
                column: "UsersId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Users_BowlingAlleys_BowlingAlleyId",
                table: "Users",
                column: "BowlingAlleyId",
                principalTable: "BowlingAlleys",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Tournaments_BowlingAlleys_BowlingAlleyId",
                table: "Tournaments");

            migrationBuilder.DropForeignKey(
                name: "FK_Tournaments_Users_OrganiserId",
                table: "Tournaments");

            migrationBuilder.DropForeignKey(
                name: "FK_TournamentUser_Tournaments_JoinedTournamentsId",
                table: "TournamentUser");

            migrationBuilder.DropForeignKey(
                name: "FK_TournamentUser_Users_UsersId",
                table: "TournamentUser");

            migrationBuilder.DropForeignKey(
                name: "FK_Users_BowlingAlleys_BowlingAlleyId",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_Users_BowlingAlleyId",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_Tournaments_OrganiserId",
                table: "Tournaments");

            migrationBuilder.DropPrimaryKey(
                name: "PK_BowlingAlleys",
                table: "BowlingAlleys");

            migrationBuilder.DropColumn(
                name: "BowlingAlleyId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "OrganiserId",
                table: "Tournaments");

            migrationBuilder.RenameTable(
                name: "BowlingAlleys",
                newName: "BowlingAlley");

            migrationBuilder.RenameColumn(
                name: "JoinedTournamentsId",
                table: "TournamentUser",
                newName: "TournamentsId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_BowlingAlley",
                table: "BowlingAlley",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Tournaments_BowlingAlley_BowlingAlleyId",
                table: "Tournaments",
                column: "BowlingAlleyId",
                principalTable: "BowlingAlley",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TournamentUser_Tournaments_TournamentsId",
                table: "TournamentUser",
                column: "TournamentsId",
                principalTable: "Tournaments",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TournamentUser_Users_UsersId",
                table: "TournamentUser",
                column: "UsersId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
