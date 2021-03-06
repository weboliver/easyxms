USE [easyxms]
GO

/****** Object:  Table [dbo].[LANGS]    Script Date: 28.06.2016 16:09:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LANGS](
	[LANG_ID] [int] NOT NULL,
	[LANG_NAME] [nvarchar](100) NULL,
	[LANG_DESC] [nvarchar](max) NULL,
	[LANG_CREATED_BY] [int] NULL,
	[LANG_CHANGED_BY] [int] NULL,
	[LANG_DELETED_BY] [int] NULL,
	[LANG_CREATED] [datetime] NOT NULL,
	[LANG_CHANGED] [datetime] NULL,
	[LANG_DELETED] [datetime] NULL,
 CONSTRAINT [PK_LANGS] PRIMARY KEY CLUSTERED 
(
	[LANG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[LANGS] ADD  CONSTRAINT [DF_LANGS_LNGU_CREATED]  DEFAULT (getdate()) FOR [LANG_CREATED]
GO


