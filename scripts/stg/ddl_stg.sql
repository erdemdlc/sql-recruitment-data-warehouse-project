USE [TechnoHR]
GO

/****** Object:  Table [stg].[offers]    Script Date: 5.10.2025 13:24:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[at_teklif](
	[submission_date] [date] NULL,
	[offer_date] [date] NULL,
	[candidate_full_name] [nvarchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[customer] [nvarchar](50) NULL,
	[experience] [int] NULL,
	[net_salary] [int] NULL,
	[starting_date] [date] NULL,
	[recruiter] [nvarchar](50) NULL,
	[project_leader] [nvarchar](50) NULL,
	[source] [nvarchar](50) NULL,
	[interview_method] [nvarchar](50) NULL,
	[dwh_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [stg].[at_teklif] ADD  DEFAULT (getdate()) FOR [dwh_create_date]
GO
CREATE TABLE stg.at_aday_rapor (
submission_date DATE
,candidate_full_name NVARCHAR(50)
,title NVARCHAR(50)
,customer NVARCHAR(50)
,experience FLOAT
,net_salary FLOAT
,[location] NVARCHAR(50)
,english_level NVARCHAR(50)
,recruiter NVARCHAR(50)
,[source] NVARCHAR(50)
,interview_method NVARCHAR(50)
,elimination_reason NVARCHAR(50)
,offer_reject_reason NVARCHAR(50)
,linkedin_url NVARCHAR(50)
,[dwh_create_date] [datetime2](7) 
) 
GO

ALTER TABLE stg.at_aday_rapor ADD  DEFAULT (getdate()) FOR [dwh_create_date]
GO
