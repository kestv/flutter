DROP TABLE UserTournaments

CREATE TABLE [dbo].[UserTournaments](
	[Id]			[int] IDENTITY(1,1),
	[UserId]		[int],
	[TournamentId]	[int]

	PRIMARY KEY(Id),
	CONSTRAINT FK_UserTournaments_User FOREIGN KEY (UserId) 
	REFERENCES Users(UserId),
	CONSTRAINT FK_UserTournaments_Tournament FOREIGN KEY (TournamentId) 
	REFERENCES Tournaments(TournamentId)
) ON [PRIMARY]