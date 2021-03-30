DROP TABLE [dbo].[Users]

CREATE TABLE [dbo].[Users](
	[Id]		[int]			IDENTITY(1,1),
	[Username]	[nchar](255)	NULL,
	[Password]	[nchar](255)	NULL,
) ON [PRIMARY]
GO