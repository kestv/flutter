DROP TABLE Tournaments

CREATE TABLE [dbo].[Tournaments](
	[Id]			[int] IDENTITY(1,1),
	[Name]			[nvarchar](255),
	[MaxPlayers]	[int],
	[PlayersCount]	[int],
	[Start]			[date],
	[IsStarted]		[bit],
	[IsEnded]		[bit],
	PRIMARY KEY(Id)
) ON [PRIMARY]

INSERT INTO [dbo].[Tournaments] ([Name], [MaxPlayers], [PlayersCount], [Start], [IsStarted], [IsEnded])
VALUES ('Winter cup', 20, 0, GETDATE(), 0, 0)
INSERT INTO [dbo].[Tournaments] ([Name], [MaxPlayers], [PlayersCount], [Start], [IsStarted], [IsEnded])
VALUES ('Spring cup', 20, 0, GETDATE(), 0, 0)
INSERT INTO [dbo].[Tournaments] ([Name], [MaxPlayers], [PlayersCount], [Start], [IsStarted], [IsEnded])
VALUES ('Summer cup', 20, 0, GETDATE(), 0, 0)
INSERT INTO [dbo].[Tournaments] ([Name], [MaxPlayers], [PlayersCount], [Start], [IsStarted], [IsEnded])
VALUES ('Autumn cup', 20, 0, GETDATE(), 0, 0)
