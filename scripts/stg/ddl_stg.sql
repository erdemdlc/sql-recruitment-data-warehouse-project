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
CREATE TABLE [stg].[at_aday_rapor](
	[submission_date] [date] NULL,
	[candidate_full_name] [nvarchar](250) NULL,
	[title] [nvarchar](250) NULL,
	[customer] [nvarchar](250) NULL,
	[experience] [float] NULL,
	[net_salary] [float] NULL,
	[location] [nvarchar](250) NULL,
	[english_level] [nvarchar](250) NULL,
	[recruiter] [nvarchar](250) NULL,
	[source] [nvarchar](250) NULL,
	[interview_method] [nvarchar](250) NULL,
	[elimination_reason] [nvarchar](250) NULL,
	[offer_reject_reason] [nvarchar](250) NULL,
	[linkedin_url] [nvarchar](500) NULL,
	[dwh_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [stg].[at_aday_rapor] ADD  DEFAULT (getdate()) FOR [dwh_create_date]
GO
CREATE TABLE [stg].[et_aday_raporu](
	[submission_date] [date] NULL,
	[candidate_full_name] [nvarchar](250) NULL,
	[title] [nvarchar](250) NULL,
	[customer] [nvarchar](250) NULL,
	[experience] [float] NULL,
	[net_salary] [float] NULL,
	[location] [nvarchar](250) NULL,
	[english_level] [nvarchar](250) NULL,
	[recruiter] [nvarchar](250) NULL,
	[source] [nvarchar](250) NULL,
	[interview_method] [nvarchar](250) NULL,
	[elimination_reason] [nvarchar](250) NULL,
	[offer_reject_reason] [nvarchar](250) NULL,
	[linkedin_url] [nvarchar](500) NULL,
	[dwh_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
ALTER TABLE [stg].[et_aday_raporu] ADD  DEFAULT (getdate()) FOR [dwh_create_date]
GO

CREATE TABLE stg.application_history 
(
 application_date	DATE
,candidate_full_name NVARCHAR(250)
,recruiter NVARCHAR(250)
,customer NVARCHAR(250)
,title NVARCHAR(250)
,dwh_create_date DATETIME2(7)
)
GO
ALTER TABLE stg.application_history ADD  DEFAULT (getdate()) FOR [dwh_create_date]
GO
