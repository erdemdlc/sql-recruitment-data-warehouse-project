USE [TechnoHR]
GO

/****** Object:  Table [stg].[offers]    Script Date: 5.10.2025 13:24:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[offers](
	[offer_id] [int] NULL,
	[submission_date] [date] NULL,
	[offer_date] [date] NULL,
	[candidate_full_name] [nvarchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[customer] [nvarchar](50) NULL,
	experience [int] NULL,
	net_salary [int] NULL,
	[starting_date] [date] NULL,
	[recruiter] [nvarchar](50) NULL,
	[project_leader] [nvarchar](50) NULL,
	[source] [nvarchar](50) NULL,
	[interview_method] [nvarchar](50) NULL,
	[is_accepted] [bit] NULL,
	[dwh_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [stg].[offers] ADD  DEFAULT (getdate()) FOR [dwh_create_date]
GO
