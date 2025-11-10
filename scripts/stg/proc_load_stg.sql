TRUNCATE TABLE stg.at_teklif
INSERT INTO stg.at_teklif (
[submission_date],
	[offer_date],
	[candidate_full_name],
	[title],
	[customer],
	[experience],
	[net_salary],
	[starting_date],
	[recruiter],
	[project_leader],
	[source],
	[interview_method]
)
SELECT 
 TRY_CONVERT(DATE,[rapor_tarihi],103) AS submission_date
,TRY_CONVERT(DATE,[teklif_tarihi],103)  AS offer_date
,UPPER([aday]) AS candidate_full_name
,CASE 
	WHEN TRIM(pozisyon) LIKE '%.net%' 
		OR TRIM(pozisyon) LIKE '%. net%' 
		OR TRIM(pozisyon) LIKE '%c#%' THEN '.NET Developer'
	WHEN TRIM(pozisyon) LIKE '%java%' AND TRIM(pozisyon) LIKE '%dev%'  OR TRIM(pozisyon) LIKE '%java yaz%' THEN 'Java Developer'
	WHEN TRIM(pozisyon) LIKE '%yazılım geliştirme%' 
		OR  TRIM(pozisyon) LIKE '%yazılım uz%'
		OR  TRIM(pozisyon) LIKE '%software develope%'
		OR  TRIM(pozisyon) LIKE '%backend dev%' 
		OR  TRIM(pozisyon) LIKE '%full%stack developer%' THEN 'Software Developer'
	WHEN TRIM(pozisyon) LIKE '%software%architect%' 
		OR TRIM(pozisyon) LIKE '%yazılım%mimar%' THEN 'Software Architect'
	WHEN TRIM(pozisyon) LIKE '%solution%arch%' 
		OR TRIM(pozisyon) LIKE '%çözüm%mimar%' THEN 'Solution Architect'
	WHEN TRIM(pozisyon) LIKE '%network%arch%' 
		OR TRIM(pozisyon) LIKE '%network%mimar%' 
		OR TRIM(pozisyon) LIKE '%system&network%' 
		OR TRIM(pozisyon) LIKE '%network%adm%' 
		OR TRIM(pozisyon) LIKE '%network%adm%'
		OR TRIM(pozisyon) LIKE '%AWS%' THEN 'System & Network Team Lead'
	WHEN TRIM(pozisyon) LIKE '%Açık Kaynak Yönetimi%' 
		OR  TRIM(pozisyon) LIKE '%open%source%' THEN 'Opensource DBA'
	WHEN TRIM(pozisyon) LIKE '%Oracle%' THEN 'Oracle DBA'
	WHEN TRIM(pozisyon) LIKE '%MsSQL%DBA%' OR TRIM(pozisyon) LIKE '%SQL Server%' THEN 'MsSQL DBA'      
	WHEN TRIM(pozisyon) LIKE '%Post%greSQL%DBA%' THEN 'PostgreSQL DBA'
	WHEN TRIM(pozisyon) LIKE '%veri%tabanı%' THEN 'DBA'
	WHEN TRIM(pozisyon)  LIKE '%BI%' 
		OR TRIM(pozisyon)  LIKE '%DWH%' 
		OR TRIM(pozisyon)  LIKE '%Power BI%'
		OR TRIM(pozisyon) LIKE '%SQL%'
		OR TRIM(pozisyon) LIKE '%Cognos%'
		OR TRIM(pozisyon) LIKE '%ODI%'
		OR TRIM(pozisyon) LIKE '%SAP%'
		OR TRIM(pozisyon) LIKE '%informatica%'
		OR TRIM(pozisyon) LIKE '%iş zekası%'
		OR TRIM(pozisyon) LIKE '%veri%ambarı%'
		OR TRIM(pozisyon) LIKE '%Analitik Uzman%'
		OR TRIM(pozisyon) LIKE '%Business Intelligence%'
	THEN 'BI/DWH Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%FI%' THEN 'SAP FI Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%BW%' THEN 'SAP BW Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%SAP CO%' THEN 'SAP CO Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%EPM%' THEN 'SAP EPM Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%PM%' THEN 'SAP PM Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%PP%' THEN 'SAP PP Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%SD%MM%' THEN 'SAP SD/MM Consultant'
	WHEN TRIM(pozisyon) = 'PM Danışmanı' THEN 'SAP PM Consultant'
	WHEN TRIM(pozisyon) LIKE '%ABAP%' THEN 'SAP ABAP Consultant'
	WHEN TRIM(pozisyon) LIKE '%BW/4HANA%' THEN 'SAP BW/4HANA Consultant'
	WHEN TRIM(pozisyon) LIKE '%front%end%' 
		OR TRIM(pozisyon) LIKE '%ön%yüz%' 
		OR TRIM(pozisyon) LIKE '%angular%' THEN 'Frontend Developer'
	WHEN TRIM(pozisyon) LIKE '%dev%ops%' THEN 'DevOps Engineer'
	WHEN TRIM(pozisyon) LIKE '%account%mana%' 
		OR TRIM(pozisyon) LIKE '%müşteri%yönet%' THEN 'Account Manager'
	WHEN TRIM(pozisyon) LIKE '%syst%adm%'
		OR TRIM(pozisyon) LIKE '%sistem%adm%' 
		OR TRIM(pozisyon) LIKE '%sistem%müh%' 
		OR TRIM(pozisyon) LIKE '%sistem%yön%' THEN 'System Admin/Engineer'
	WHEN TRIM(pozisyon) LIKE '%network spe%'
		OR TRIM(pozisyon) LIKE '%network%uzm%'THEN 'Network Specialist'
	WHEN TRIM(pozisyon) LIKE '%yedekleme%' 
		OR TRIM(pozisyon) LIKE '%backup%' THEN 'Backup Specialist'
	WHEN TRIM(pozisyon) LIKE '%sanalla%' 
		OR TRIM(pozisyon) LIKE '%virtual%'THEN 'Virtualization Specialist'
	WHEN TRIM(pozisyon) LIKE '%linux%' 
		OR TRIM(pozisyon) LIKE '%unix%' THEN 'Linux Admin'
	WHEN TRIM(pozisyon) LIKE '%windws%' 
		OR TRIM(pozisyon) = 'WINDWS SİSTEM'  THEN 'Windows Admin'
	WHEN TRIM(pozisyon) LIKE '%product%manager%'
		OR TRIM(pozisyon) LIKE '%ürün%yönet%' THEN 'Product Manager'
	WHEN TRIM(pozisyon) LIKE '%project%engineer%'
		OR TRIM(pozisyon) LIKE '%proje%mühendis%' THEN 'Project Engineer'
	WHEN TRIM(pozisyon) LIKE '%project%manager%'
		OR TRIM(pozisyon) LIKE '%proje%yönet%' THEN 'Project Manager'
	WHEN TRIM(pozisyon) LIKE '%iş%anali%'
		OR TRIM(pozisyon) LIKE '%business%anal%'
		OR TRIM(pozisyon) = 'İş Analsiti Yönetmen'
		OR TRIM(pozisyon) = 'Analist'  THEN 'Business Analyst'
	WHEN TRIM(pozisyon) LIKE '%sistem%anali%'
		OR TRIM(pozisyon) LIKE '%system%anal%' THEN 'System Analyst'
	WHEN TRIM(pozisyon) LIKE '%ürün%anali%'
		OR TRIM(pozisyon) LIKE '%product%anal%' THEN 'Product Analyst'
	WHEN TRIM(pozisyon) LIKE '%ANDROID%'
		OR TRIM(pozisyon) LIKE '%ios%android%' 
		OR TRIM(pozisyon) LIKE '%Android%' THEN 'Android Developer'
	WHEN TRIM(pozisyon) LIKE '%iOS%' THEN 'iOS Developer'
	WHEN TRIM(pozisyon) LIKE '%flutter%' THEN 'Flutter Developer'
	WHEN TRIM(pozisyon) LIKE '%big%data%' 
		OR TRIM(pozisyon) LIKE '%büyük%veri%' THEN 'Big Data Engineer'
	WHEN TRIM(pozisyon) LIKE '%uygulama destek%'
		OR TRIM(pozisyon) LIKE '%application%support%' THEN 'Application Support Engineer'
	WHEN TRIM(pozisyon) LIKE '%ar ge engin%' 
		OR  TRIM(pozisyon) LIKE '%ar-ge engin%' 
		OR  TRIM(pozisyon) LIKE '%ar ge müh' 
		OR  TRIM(pozisyon) LIKE '%ar ge yönet%' 
		OR  TRIM(pozisyon) LIKE '%r&d%' 
		OR  TRIM(pozisyon) LIKE '%arge%' THEN 'R&D Engineer'
	WHEN TRIM(pozisyon) LIKE '%asset%' AND TRIM(pozisyon) LIKE '%configuration%' 
		OR TRIM(pozisyon) LIKE '%konfigürasyon%' THEN 'Asset & Configuration Manager'
	WHEN TRIM(pozisyon) = 'Bilgi Teknolojileri Müdür Yardımcısı' THEN 'IT Assistant Manager'
	WHEN TRIM(pozisyon) LIKE '%CRM%' THEN 'CRM Specialist'
	WHEN TRIM(pozisyon)  LIKE '%cyber security%' 
		OR TRIM(pozisyon) LIKE '%siber güvenlik%' THEN 'Cyber Security Specialist'
	WHEN TRIM(pozisyon) = 'DB OPERASYON' THEN 'Database Operation Specialist'
	WHEN TRIM(pozisyon) LIKE '%Django%' THEN 'Django Developer'
	WHEN TRIM(pozisyon) LIKE '%PHP%' THEN 'PHP Developer'
	WHEN TRIM(pozisyon)  LIKE '%embedded soft%' 
		OR TRIM(pozisyon) LIKE '%gömülü%yazılım%' THEN 'Embedded Software Engineer'
	WHEN TRIM(pozisyon)  LIKE '%hardware design%' 
		OR TRIM(pozisyon) LIKE '%donanım tasarım%' THEN 'Hardware Design Engineer'
	WHEN TRIM(pozisyon) LIKE '%finan%' AND TRIM(pozisyon) LIKE '%manage%' 
		OR TRIM(pozisyon) LIKE '%müdür%' THEN 'Finance Manager'
	WHEN TRIM(pozisyon) = 'Finans Uzmanı' THEN 'Finance Specialist'
	WHEN TRIM(pozisyon) LIKE '%ik uzman%' AND TRIM(pozisyon) LIKE '%manage%' 
		OR TRIM(pozisyon) LIKE '%müdür%' THEN 'Finance Manager'
	WHEN TRIM(pozisyon) = 'Finans Uzmanı' THEN 'Finance Specialist'
	WHEN TRIM(pozisyon) IN (
	'İK Uzmanı', 'İK Elemanı', 'HR Specialist', 'HR Generalist',
	'Human Resources Specialist', 'Human Resources Generalist',
	'İnsan Kaynakları Uzmanı', 'İnsan Kaynakları Elemanı', 'People and Culture Specialist'
	) THEN 'HR Specialist'

	WHEN TRIM(pozisyon) IN (
		'Human Resources Business Partner', 'İnsan Kaynakları İş Ortağı'
	) THEN 'HRBP'

	WHEN TRIM(pozisyon) IN (
		'İşe Alım uzmanı', 'IT İşe alım uzmanı', 'IT recruiter'
	) THEN 'Recruiter'
	WHEN TRIM(pozisyon) IN (
		'İK Yöneticisi', 'İnsan Kaynakları Yöneticisi','Human Resources Manager'
	) THEN 'HR Manager'
	WHEN TRIM(pozisyon) LIKE '%yönetici%' AND  TRIM(pozisyon) LIKE '%asist%' THEN 'Executive Assistant'
	WHEN TRIM(pozisyon) LIKE '%middleware%' OR  TRIM(pozisyon) LIKE '%orta%katman%' THEN 'Middleware Specialist'
	WHEN TRIM(pozisyon) LIKE '%test%' 
		OR  TRIM(pozisyon) LIKE '%qa%'
		OR  TRIM(pozisyon) LIKE '%quality assurance%' THEN 'Test/QA Specialist'
	WHEN TRIM(pozisyon) LIKE '%weblogic%' THEN 'Weblogic Specialist'
	WHEN TRIM(pozisyon) = 'İş Çöz. Direktörü' THEN 'Business Solutions Manager'
	WHEN TRIM(pozisyon) LIKE '%Solution%Designer%' THEN 'Solution Designer'
	WHEN TRIM(pozisyon) LIKE '%Software Solution Eng%' THEN 'Solution Engineer'
	WHEN TRIM(pozisyon) LIKE '%L2 Support%' 
		OR  TRIM(pozisyon) LIKE '%L2 Destek%' THEN 'L2 Support Engineer'
	WHEN TRIM(pozisyon) LIKE '%Openshift%' THEN 'Openshift Specialist'
	WHEN TRIM(pozisyon) LIKE '%otomasyon%' 
		OR TRIM(pozisyon) LIKE '%automation%' THEN 'Automation Management Specialist'
	WHEN TRIM(pozisyon) = 'Otomatik Kapı Ustası' THEN 'Automatic Door Expert'
	WHEN TRIM(pozisyon) LIKE '%muhasebe%' THEN 'Bookkeeper'
	WHEN TRIM(pozisyon) LIKE '%performans%pazarlama%' THEN 'Performance Marketing Specialist'
	WHEN TRIM(pozisyon) LIKE '%red%hat%' THEN 'Red Hat Linux Specialist'
	WHEN TRIM(aday)     = 'Sabri Volkan Balaban' THEN 'ERP Consultant'
	WHEN TRIM(pozisyon) LIKE '%storage%' 
		OR TRIM(pozisyon) LIKE '%depolama%' THEN 'Storage Specialist'
	WHEN TRIM(pozisyon)     = 'Teknoloji Direktörü' THEN 'Director of Technology'
	WHEN TRIM(pozisyon) LIKE '%UI%' OR TRIM(pozisyon) LIKE '%UX%' THEN 'UI/UX Designer'
	WHEN TRIM(pozisyon) LIKE '%Software%Engineer%' THEN 'Software Engineer'
	WHEN TRIM(pozisyon) LIKE '%Python%' THEN 'Data Engineer'
	WHEN TRIM(pozisyon) LIKE '%Data Engineer%' THEN 'Data Engineer'
	WHEN TRIM(pozisyon) LIKE '%exchange%' THEN 'System Specialist'
	WHEN TRIM(pozisyon) LIKE 'Sistem Uzman%' THEN 'System Specialist'
	WHEN TRIM(pozisyon) LIKE 'Security Compliance & Governance%' THEN 'Security GRC Specialist'
	WHEN TRIM(pozisyon) = 'Team Lead'  THEN 'BI/DWH Consultant'
	WHEN TRIM(pozisyon) LIKE '%L1 Destek%' THEN 'L1 Support Engineer'
	WHEN TRIM(pozisyon) LIKE '%Agile%' 
		OR TRIM(pozisyon) LIKE '%Scrum%' THEN 'Agile/Scrum Master'
	WHEN TRIM(pozisyon) LIKE '%Data%Anal%' THEN 'Data Analyst'
	ELSE NULL
END AS title
,CASE 
	WHEN TRIM(musteri) LIKE '%Epiaş%' THEN 'EPİAŞ'
	WHEN TRIM(musteri) LIKE 'Asis%' THEN 'Asis Otomasyon'
	WHEN TRIM(musteri) LIKE 'Codexist%' THEN 'Codexist Bilişim'
	WHEN TRIM(musteri) LIKE '%Digilera%' THEN 'Digilera'
	WHEN TRIM(musteri) = 'Enerjisa' THEN 'EnerjiSA'
	WHEN TRIM(musteri) LIKE 'EYE%' THEN 'EYE Teknoloji'
	WHEN TRIM(musteri) LIKE 'Gantek%' THEN 'Gantek'
	WHEN TRIM(musteri) LIKE '%ID3%' THEN 'ID3'
	WHEN TRIM(musteri) LIKE '%Infolojik%' 
		OR TRIM(musteri) LIKE '%İnfolojik%'  THEN 'İnfolojik'
	WHEN TRIM(musteri) LIKE '%Inomera%' 
		OR TRIM(musteri) LIKE '%İnomera%'  THEN 'Inomera'
	WHEN TRIM(musteri) LIKE '%InspireIT%' 
		OR TRIM(musteri) LIKE '%İnspireIT%'  THEN 'InspireIT'
	WHEN TRIM(musteri) LIKE '%Intellica%' 
		OR TRIM(musteri) LIKE '%İntellica%'  THEN 'Intellica'
		WHEN TRIM(musteri) LIKE '%IWF%' 
		OR TRIM(musteri) LIKE '%SRP%' THEN 'SRP Legal'
	WHEN TRIM(musteri) LIKE 'MDS ap%' THEN 'MDS ap Tech'
	WHEN TRIM(musteri) LIKE 'Metric%' THEN 'Metric Yazılım'
	WHEN TRIM(musteri) LIKE 'Misyon%' THEN 'Misyon Bank'
	WHEN TRIM(musteri) LIKE 'Netaş%' THEN 'NETAŞ'
	WHEN TRIM(musteri) LIKE 'Omreon%' THEN 'Omreon'
	WHEN TRIM(musteri) LIKE 'Optim%' 
		OR TRIM(musteri) LIKE 'Optiim%' THEN 'Optiim'
	WHEN TRIM(musteri) LIKE 'pia%'
		OR TRIM(musteri) LIKE 'pıa%' THEN 'PiA'
	WHEN TRIM(musteri) LIKE 'Polat%' THEN 'Polat Grup'
	WHEN TRIM(musteri) LIKE 'PROTO%' THEN 'Proto Yazılım'
	WHEN TRIM(musteri) LIKE 'SİSTEK%' THEN 'Sistek'
	WHEN TRIM(musteri) LIKE 'Tatilbudur%' THEN 'TatilBudur'
	WHEN TRIM(musteri) LIKE 'TAV%' THEN 'TAV Technologies'
	WHEN TRIM(musteri) LIKE 'Vektor%' THEN 'Vektor Mobility'
	ELSE TRIM(musteri)
END AS customer
,CAST([dbo].[extract_numbers](TRIM(tecr_yili)) AS FLOAT) AS experience
,CASE
	WHEN TRIM(net_ucret) LIKE '%[0-9]K%' OR TRIM(net_ucret) LIKE '%[0-9] K%'  
	THEN TRY_CAST([dbo].[fn_ParseNetUcret](TRIM(net_ucret)) AS FLOAT)
	WHEN TRIM(net_ucret) LIKE '%[.,]%' 
	THEN TRY_CAST([dbo].[extract_numbers](TRIM(net_ucret)) AS FLOAT) *1000
	ELSE TRY_CAST((TRIM(net_ucret)) AS INT)
END AS net_salary
,CASE
	WHEN ise_baslama_tarihi 
		LIKE '%Ocak%' 
		OR ise_baslama_tarihi LIKE '%Şubat%' 
		OR ise_baslama_tarihi LIKE '%Mart%' 
		OR ise_baslama_tarihi LIKE '%Nisan%' 
		OR ise_baslama_tarihi LIKE '%Mayıs%' 
		OR ise_baslama_tarihi LIKE '%Haziran%' 
		OR ise_baslama_tarihi LIKE '%Temmuz%' 
		OR ise_baslama_tarihi LIKE '%Ağustos%' 
		OR ise_baslama_tarihi LIKE '%Eylül%' 
		OR ise_baslama_tarihi LIKE '%Ekim%' 
		OR ise_baslama_tarihi LIKE '%Kasım%' 
		OR ise_baslama_tarihi LIKE '%Aralık%'
	THEN dbo.fn_TurkceTarihToDateWithYear(ise_baslama_tarihi,YEAR(TRY_CONVERT(DATE,[rapor_tarihi],103)))
	ELSE TRY_CONVERT(DATE,TRIM([ise_baslama_tarihi]),103)
END AS start_work_date
,CASE
	WHEN TRIM(recruiter) = 'BERİL C.' THEN 'Beril'
	WHEN TRIM(recruiter) = 'Beril-Deniz' THEN 'Beril'
	WHEN TRIM(recruiter) = 'Deniz - Yasemin' THEN 'Yasemin'
	WHEN TRIM(recruiter) = 'Deniz K.' THEN 'Deniz Karsel'
	WHEN TRIM(recruiter) = 'Nisan-Deniz' THEN 'Deniz'
	WHEN TRIM(recruiter) = 'EGE' THEN 'Ege'
	WHEN TRIM(recruiter) = 'ELA' THEN 'Ela'
	WHEN TRIM(recruiter) = 'ELİF D.' THEN 'Elif'
	WHEN TRIM(recruiter) = 'Emre-Gizem' THEN 'Emre'
	WHEN TRIM(recruiter) = 'Erdem-Şevval' THEN 'Erdem'
	WHEN TRIM(recruiter) = 'Furkan (Hanife)' THEN 'Furkan'
	WHEN TRIM(recruiter) = 'Hayra-Hanife' THEN 'Hayra'
	WHEN TRIM(recruiter) = 'İnf. Ref.' OR TRIM(recruiter) = '-' THEN NULL
	WHEN TRIM(recruiter) = 'MK' THEN 'Meral'
	WHEN TRIM(recruiter) = 'Meral-F. (Buse)' THEN 'Buse'
	WHEN TRIM(recruiter) = 'NESLİŞAH B.' THEN 'Neslişah'
	WHEN TRIM(recruiter) = 'NİSAN- GÖKÇE' OR TRIM(recruiter) = 'NİSAN' OR TRIM(recruiter) = 'NİSAN ÖZ.' THEN 'Nisan'
	WHEN TRIM(recruiter) = 'Sedef (Hayra)' THEN 'Hayra'
	WHEN TRIM(recruiter) = 'Sedef-Asena (Özge)' THEN 'Asena'
	WHEN TRIM(recruiter) = 'Sedef-Yasemin' THEN 'Sedef'
	WHEN TRIM(recruiter) = 'Sibel (Buse)' OR TRIM(recruiter) = 'Sibel (Hayra)' OR TRIM(recruiter) = 'Sibel (Hilal)' THEN 'Sibel'
	WHEN TRIM(recruiter) = 'Yasemin H.' THEN 'Yasemin Hepyaşar'
	ELSE TRIM(recruiter)
END AS recruiter
,CASE
	WHEN TRIM(py) = '70k+10k teklif yapıldı aday farklı bir firmanın teklifini kabul ettiğinden reddetti.' 
	  OR TRIM(py) = 'Teklif çıkılacak.' THEN NULL
	WHEN TRIM(py) = 'AKIN' THEN 'Akın'
	WHEN TRIM(py) = 'Damla - Gizem' THEN 'Damla'
	WHEN TRIM(py) = 'Damla-Cengiz' THEN 'Cengiz'
	WHEN TRIM(py) = 'Deniz-Mk' THEN 'Deniz'
	WHEN TRIM(py) = 'Gizem D.' THEN 'Gizem Dilara'
	WHEN TRIM(py) = 'MK' THEN 'Meral'
	WHEN TRIM(py) = 'Övül-Cengiz' THEN 'Övül'
	ELSE TRIM(py)
END AS project_leader
,CASE
	WHEN TRIM (kaynak_linkedin_kariyer_vb) = '-' THEN NULL
	WHEN TRIM (kaynak_linkedin_kariyer_vb) = 'Eski Aday' THEN 'Veritabanı'
	WHEN TRIM (kaynak_linkedin_kariyer_vb) = 'İnfolojik Ref.' THEN 'Referans'
	WHEN TRIM (kaynak_linkedin_kariyer_vb) = 'Kariyer' OR TRIM (kaynak_linkedin_kariyer_vb) = 'Kariyer. net' THEN 'Kariyer.net'
	WHEN TRIM (kaynak_linkedin_kariyer_vb) = 'LinkedIn' THEN 'Linkedin'
	ELSE TRIM (kaynak_linkedin_kariyer_vb)
END AS [source]
,CASE
	WHEN TRIM(mulakat_yontemi) = '-' OR TRIM(mulakat_yontemi) = 'Yasemin' OR TRIM(mulakat_yontemi) = 'Teklif' THEN NULL
	WHEN TRIM(mulakat_yontemi) = 'Eski aday/Online' THEN 'Online'
	WHEN TRIM(mulakat_yontemi) = 'Eski Aday/Telefon' OR TRIM(mulakat_yontemi) = 'Telefon/Eski aday' THEN 'Telefon'
	ELSE TRIM(mulakat_yontemi)
END AS interview_method
FROM
ods.at_teklif
GO 
TRUNCATE TABLE stg.at_aday_rapor
INSERT INTO stg.at_aday_rapor (
	   [submission_date]
      ,[candidate_full_name]
      ,[title]
      ,[customer]
      ,[experience]
      ,[net_salary]
      ,[location]
      ,[english_level]
      ,[recruiter]
      ,[source]
      ,[interview_method]
      ,[elimination_reason]
      ,[offer_reject_reason]
      ,[linkedin_url]
)
SELECT 
TRY_CONVERT(DATE,[tarih],103) AS submission_date
,UPPER([aday]) AS candidate_full_name
,CASE 
	WHEN TRIM(pozisyon) LIKE '%.net%' 
		OR TRIM(pozisyon) LIKE '%. net%' 
		OR TRIM(pozisyon) LIKE '%dot net%' 
		OR TRIM(pozisyon) LIKE '%c#%' THEN '.NET Developer'
	WHEN TRIM(pozisyon) LIKE '%java%'  THEN 'Java Developer'
	WHEN TRIM(pozisyon) LIKE '%yazılım geliştirme%' 
		OR  TRIM(pozisyon) LIKE '%yazılım uz%'
		OR  TRIM(pozisyon) LIKE '%software develope%'
		OR  TRIM(pozisyon) LIKE '%backend dev%' 
		OR  TRIM(pozisyon) LIKE '%full%stack%' THEN 'Software Developer'
	WHEN TRIM(pozisyon) LIKE '%software%architect%' 
		OR TRIM(pozisyon) LIKE '%yazılım%mimar%' THEN 'Software Architect'
	WHEN TRIM(pozisyon) LIKE '%solution%arch%' 
		OR TRIM(pozisyon) LIKE '%çözüm%mimar%' THEN 'Solution Architect'
	WHEN TRIM(pozisyon) LIKE '%network%arch%' 
		OR TRIM(pozisyon) LIKE '%network%mimar%' 
		OR TRIM(pozisyon) LIKE '%system&network%' 
		OR TRIM(pozisyon) LIKE '%network%adm%' 
		OR TRIM(pozisyon) LIKE '%network%adm%'
		OR TRIM(pozisyon) LIKE '%AWS%' 
		OR TRIM(pozisyon) LIKE '%Network Takım%' THEN 'System & Network Team Lead'
	WHEN TRIM(pozisyon) LIKE '%Açık Kaynak Yönetimi%' 
		OR  TRIM(pozisyon) LIKE '%open%source%' THEN 'Opensource DBA'
	WHEN TRIM(pozisyon) LIKE '%Oracle%' THEN 'Oracle DBA'
	WHEN TRIM(pozisyon) LIKE '%MsSQL%DBA%' OR TRIM(pozisyon) LIKE '%SQL Server%' THEN 'MsSQL DBA'      
	WHEN TRIM(pozisyon) LIKE '%Post%greSQL%DBA%' THEN 'PostgreSQL DBA'
	WHEN TRIM(pozisyon) LIKE '%veri%tabanı%' THEN 'DBA'
	WHEN TRIM(pozisyon)  LIKE '%BI%' 
		OR TRIM(pozisyon)  LIKE '%DWH%' 
		OR TRIM(pozisyon)  LIKE '%Power BI%'
		OR TRIM(pozisyon) LIKE '%SQL%'
		OR TRIM(pozisyon) LIKE '%Cognos%'
		OR TRIM(pozisyon) LIKE '%ODI%'
		OR TRIM(pozisyon) LIKE '%SAP BI%'
		OR TRIM(pozisyon) LIKE '%informatica%'
		OR TRIM(pozisyon) LIKE '%iş zekası%'
		OR TRIM(pozisyon) LIKE '%veri%ambarı%'
		OR TRIM(pozisyon) LIKE '%data%warehouse%'
		OR TRIM(pozisyon) LIKE '%Analitik Uzman%'
		OR TRIM(pozisyon) LIKE '%Business Intelligence%'
		OR TRIM(pozisyon) LIKE '%ETL%'
	THEN 'BI/DWH Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%FI%' THEN 'SAP FI Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%BW%' THEN 'SAP BW Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%SAP CO%' THEN 'SAP CO Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%EPM%' THEN 'SAP EPM Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%PM%' THEN 'SAP PM Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%PP%' THEN 'SAP PP Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%SD%MM%' THEN 'SAP SD/MM Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%SD%' THEN 'SAP SD Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%Basis%' THEN 'SAP Basis Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%BO%' THEN 'SAP BO Consultant'
	WHEN TRIM(pozisyon) = 'PM Danışmanı' THEN 'SAP PM Consultant'
	WHEN TRIM(pozisyon) LIKE '%ABAP%' THEN 'SAP ABAP Consultant'
	WHEN TRIM(pozisyon) LIKE '%BW/4HANA%' THEN 'SAP BW/4HANA Consultant'
	WHEN TRIM(pozisyon) = 'Data-Software-PM-Snr.,Expert,Lead,Man.' THEN 'SAP S/4 HANA Consultant'
	WHEN TRIM(pozisyon) LIKE '%front%end%' 
		OR TRIM(pozisyon) LIKE '%ön%yüz%' 
		OR TRIM(pozisyon) LIKE '%angular%' THEN 'Frontend Developer'
	WHEN TRIM(pozisyon) LIKE '%dev%ops%' THEN 'DevOps Engineer'
	WHEN TRIM(pozisyon) LIKE '%account%mana%' 
		OR TRIM(pozisyon) LIKE '%müşteri%yönet%' THEN 'Account Manager'
	WHEN TRIM(pozisyon) LIKE '%syst%adm%'
		OR TRIM(pozisyon) LIKE '%sistem%adm%' 
		OR TRIM(pozisyon) LIKE '%sistem%müh%' 
		OR TRIM(pozisyon) LIKE '%sistem%yön%' THEN 'System Admin/Engineer'
	WHEN TRIM(pozisyon) LIKE '%network spe%'
		OR TRIM(pozisyon) LIKE '%network%uzm%'
		OR TRIM(pozisyon) LIKE '%network%security%'
		OR TRIM(pozisyon) LIKE '%Ağ Güvenlik%' THEN 'Network Specialist'
	WHEN TRIM(pozisyon) LIKE '%yedekleme%' 
		OR TRIM(pozisyon) LIKE '%backup%' THEN 'Backup Specialist'
	WHEN TRIM(pozisyon) LIKE '%sanalla%' 
		OR TRIM(pozisyon) LIKE '%virtual%'THEN 'Virtualization Specialist'
	WHEN TRIM(pozisyon) LIKE '%linux%' 
		OR TRIM(pozisyon) LIKE '%unix%' THEN 'Linux Admin'
	WHEN TRIM(pozisyon) LIKE '%windws%'
		OR TRIM(pozisyon) LIKE '%windows%'
		OR TRIM(pozisyon) = 'WINDWS SİSTEM' THEN 'Windows Admin'
	WHEN TRIM(pozisyon) LIKE '%product%manager%'
		OR TRIM(pozisyon) LIKE '%ürün%yönet%' THEN 'Product Manager'
	WHEN TRIM(pozisyon) LIKE '%project%engineer%'
		OR TRIM(pozisyon) LIKE '%proje%mühendis%' 
		OR TRIM(pozisyon) LIKE '%project%ex%' THEN 'Project Engineer'
	WHEN TRIM(pozisyon) LIKE '%project%manager%'
		OR TRIM(pozisyon) LIKE '%proje%yönet%' 
		OR TRIM(pozisyon) = 'Senior PM' THEN 'Project Manager'
	WHEN TRIM(pozisyon) LIKE '%proje%uzman%' THEN 'Project Specialist'
	WHEN TRIM(pozisyon) LIKE '%iş%anali%'
		OR TRIM(pozisyon) LIKE '%business%anal%'
		OR TRIM(pozisyon) = 'İş Analsiti Yönetmen'
		OR TRIM(pozisyon) = 'Analist'  THEN 'Business Analyst'
	WHEN TRIM(pozisyon) LIKE '%sistem%anali%'
		OR TRIM(pozisyon) LIKE '%system%anal%' THEN 'System Analyst'
	WHEN TRIM(pozisyon) LIKE '%ürün%anali%'
		OR TRIM(pozisyon) LIKE '%product%anal%' THEN 'Product Analyst'
	WHEN TRIM(pozisyon) LIKE '%ANDROID%'
		OR TRIM(pozisyon) LIKE '%ios%android%' 
		OR TRIM(pozisyon) LIKE '%Android%' THEN 'Android Developer'
	WHEN TRIM(pozisyon) LIKE '%iOS%' 
		OR TRIM(pozisyon) LIKE '%Ios%' THEN 'iOS Developer'
	WHEN TRIM(pozisyon) LIKE '%flutter%' THEN 'Flutter Developer'
	WHEN TRIM(pozisyon) LIKE '%big%data%' 
		OR TRIM(pozisyon) LIKE '%büyük%veri%' THEN 'Big Data Engineer'
	WHEN TRIM(pozisyon) LIKE '%uygulama destek%'
		OR TRIM(pozisyon) LIKE '%application%support%' THEN 'Application Support Engineer'
	WHEN TRIM(pozisyon) LIKE '%ar ge engin%' 
		OR  TRIM(pozisyon) LIKE '%ar-ge engin%' 
		OR  TRIM(pozisyon) LIKE '%ar ge müh' 
		OR  TRIM(pozisyon) LIKE '%ar ge yönet%' 
		OR  TRIM(pozisyon) LIKE '%r&d%' 
		OR  TRIM(pozisyon) LIKE '%arge%' THEN 'R&D Engineer'
	WHEN TRIM(pozisyon) LIKE '%asset%' AND TRIM(pozisyon) LIKE '%configuration%' 
		OR TRIM(pozisyon) LIKE '%konfigürasyon%' THEN 'Asset & Configuration Manager'
	WHEN TRIM(pozisyon) = 'Bilgi Teknolojileri Müdür Yardımcısı' THEN 'IT Assistant Manager'
	WHEN TRIM(pozisyon) LIKE '%CRM%' THEN 'CRM Specialist'
	WHEN TRIM(pozisyon)  LIKE '%cyber security%' 
		OR TRIM(pozisyon) LIKE '%siber%' THEN 'Cyber Security Specialist'
	WHEN TRIM(pozisyon) = 'DB OPERASYON' THEN 'Database Operation Specialist'
	WHEN TRIM(pozisyon) LIKE '%Django%' THEN 'Django Developer'
	WHEN TRIM(pozisyon) LIKE '%PHP%' THEN 'PHP Developer'
	WHEN TRIM(pozisyon)  LIKE '%embedded soft%' 
		OR TRIM(pozisyon) LIKE '%gömülü%yazılım%' THEN 'Embedded Software Engineer'
	WHEN TRIM(pozisyon)  LIKE '%hardware design%' 
		OR TRIM(pozisyon) LIKE '%donanım tasarım%' THEN 'Hardware Design Engineer'
	WHEN TRIM(pozisyon) LIKE '%finan%' AND TRIM(pozisyon) LIKE '%manage%' 
		OR TRIM(pozisyon) LIKE '%müdür%' THEN 'Finance Manager'
	WHEN TRIM(pozisyon) LIKE '%Finans%Uzmanı%' THEN 'Finance Specialist'
	WHEN TRIM(pozisyon) = 'Finans Analisti' THEN 'Finance Analyst'
	WHEN TRIM(pozisyon) = 'Finansal Raporlama ve Bütçe Planlama Danışmanı' THEN 'Financial Reporting and Budget Planning Consultant'
	WHEN TRIM(pozisyon) LIKE '%ik uzman%' AND TRIM(pozisyon) LIKE '%manage%' 
		OR TRIM(pozisyon) LIKE '%müdür%' THEN 'Finance Manager'
	WHEN TRIM(pozisyon) = 'Finans Uzmanı' THEN 'Finance Specialist'
	WHEN TRIM(pozisyon) IN (
	'İK Uzmanı', 'İK Elemanı', 'HR Specialist', 'HR Generalist',
	'Human Resources Specialist', 'İK Operasyon Sorumlusu' , 'Human Resources Generalist',
	'İnsan Kaynakları Uzmanı','Kıdemli İnsan Kaynakları Uzmanı' , 'İnsan ve Kültür Uzmanı' , 
	'İnsan Kaynakları Elemanı', 'People and Culture Specialist' , 'Talent Acquisition Executive',
	'Talent Acquisition Specialist' , 'Talent Acquisiton Specialist'
	) THEN 'HR Specialist'

	WHEN TRIM(pozisyon) IN (
		'Human Resources Business Partner', 'İnsan Kaynakları İş Ortağı' , 'HR Business Partner'
	) THEN 'HRBP'

	WHEN TRIM(pozisyon) IN (
		'İşe Alım uzmanı', 'IT İşe alım uzmanı', 'IT recruiter' , 'IT Recruiter/Talent Acquisition Specialist' , 
		'HRBP/IT Recruiter'
	) THEN 'Recruiter'
	WHEN TRIM(pozisyon) IN (
		'İK Yöneticisi', 'İnsan Kaynakları Yöneticisi','Human Resources Manager' , 'İnsan Kaynakları Direktörü'
	) THEN 'HR Manager'
	WHEN (TRIM(pozisyon) LIKE '%yönetici%' AND TRIM(pozisyon) LIKE '%asist%') 
		OR TRIM(pozisyon) = 'Ofis Asistanı' THEN 'Executive Assistant'
	WHEN TRIM(pozisyon) LIKE '%middleware%' OR  TRIM(pozisyon) LIKE '%orta%katman%' THEN 'Middleware Specialist'
	WHEN TRIM(pozisyon) LIKE '%test%' 
		OR  TRIM(pozisyon) LIKE '%qa%'
		OR  TRIM(pozisyon) LIKE '%quality assurance%' THEN 'Test/QA Specialist'
	WHEN TRIM(pozisyon) LIKE '%weblogic%' THEN 'Weblogic Specialist'
	WHEN TRIM(pozisyon) = 'İş Çöz. Direktörü' THEN 'Business Solutions Manager'
	WHEN TRIM(pozisyon) LIKE '%Solution%Designer%' THEN 'Solution Designer'
	WHEN TRIM(pozisyon) LIKE '%Solution Eng%' THEN 'Solution Engineer'
	WHEN TRIM(pozisyon) LIKE '%L2 Support%' 
		OR  TRIM(pozisyon) LIKE '%L2 Destek%' THEN 'L2 Support Engineer'
	WHEN TRIM(pozisyon) LIKE '%Openshift%' THEN 'Openshift Specialist'
	WHEN TRIM(pozisyon) LIKE '%otomasyon%' 
		OR TRIM(pozisyon) LIKE '%automation%' THEN 'Automation Management Specialist'
	WHEN TRIM(pozisyon) = 'Otomatik Kapı Ustası' THEN 'Automatic Door Expert'
	WHEN TRIM(pozisyon) LIKE '%muhasebe%' THEN 'Bookkeeper'
	WHEN TRIM(pozisyon) LIKE '%performans%pazarlama%' THEN 'Performance Marketing Specialist'
	WHEN TRIM(pozisyon) LIKE '%red%hat%' THEN 'Red Hat Linux Specialist'
	WHEN TRIM(aday)     = 'Sabri Volkan Balaban' THEN 'ERP Consultant'
	WHEN TRIM(pozisyon) LIKE '%storage%' 
		OR TRIM(pozisyon) LIKE '%depolama%' THEN 'Storage Specialist'
	WHEN TRIM(pozisyon)     = 'Teknoloji Direktörü' THEN 'Director of Technology'
	WHEN TRIM(pozisyon) LIKE '%UI%' OR TRIM(pozisyon) LIKE '%UX%' THEN 'UI/UX Designer'
	WHEN TRIM(pozisyon) LIKE '%Software%Engin%' 
	OR TRIM(pozisyon) LIKE '%Yazılım%Müh%' THEN 'Software Engineer'
	WHEN TRIM(pozisyon) LIKE '%Yazılım%Yöneti%' THEN 'Software Manager'
	WHEN TRIM(pozisyon) LIKE '%Python%' THEN 'Python Developer'
	WHEN TRIM(pozisyon) LIKE '%Data Engineer%' 
		OR TRIM(pozisyon) LIKE '%Veri Müh%'  THEN 'Data Engineer'
	WHEN TRIM(pozisyon) LIKE '%exchange%'
		OR TRIM(pozisyon) LIKE '%Sistem Uzman%' 
		OR TRIM(pozisyon) LIKE '%System Specialist%' THEN 'System Specialist'
	WHEN TRIM(pozisyon) LIKE 'Security Compliance & Governance%' THEN 'Security GRC Specialist'
	WHEN TRIM(pozisyon) = 'Team Lead'  THEN 'BI/DWH Consultant'
	WHEN TRIM(pozisyon) LIKE '%L1 Destek%' THEN 'L1 Support Engineer'
	WHEN TRIM(pozisyon) LIKE '%Agile%' 
		OR TRIM(pozisyon) LIKE '%Scrum%' THEN 'Agile/Scrum Master'
	WHEN TRIM(pozisyon) LIKE '%Data%Anal%' 
		OR TRIM(pozisyon) = 'Data Visualization Consultant Team Head' 
		OR TRIM(pozisyon) LIKE '%Veri Anal%'
		OR TRIM(pozisyon) LIKE '%Veri katman%' THEN 'Data Analyst'
	WHEN TRIM(pozisyon) LIKE '%Digital Marketing%'  THEN 'Digital Marketing Manager'
	WHEN TRIM(pozisyon) LIKE '%Digital Transform%'  THEN 'Digital Transformation Supervisor'
	WHEN TRIM(pozisyon) LIKE '%satış%uzman%' 
		OR  TRIM(pozisyon) LIKE '%sales%special%' 
		OR  TRIM(pozisyon) LIKE '%sales%executive%' THEN 'Sales Specialist'
	WHEN TRIM(pozisyon) = 'Satış ve Pazarlama Yöneticisi'  THEN 'Sales Manager'
	WHEN TRIM(pozisyon) LIKE '%Elixir%'  THEN 'Elixir Developer'
	WHEN TRIM(pozisyon) LIKE '%cloud%' AND TRIM(pozisyon) LIKE '%engineer%'  THEN 'Cloud Engineer'
	WHEN TRIM(pozisyon) LIKE '%enterprise%architect%'  THEN 'Enterprise Platform Architect'
	WHEN TRIM(pozisyon) = 'Dijital Workforce Analytics Specialist'  THEN 'Digital Workforce Analytics Specialist'
	WHEN TRIM(pozisyon) = 'Dijital Workforce Operations Supervisor'  THEN 'Digital Workforce Operations Supervisor'
	WHEN TRIM(pozisyon) = 'Genel Paylaşım' OR TRIM(pozisyon) = 'Genel Sunum' THEN 'n/a'
	WHEN TRIM(pozisyon) = 'https://www.linkedin.com/in/yasemin-kekezo%C4%9Flu-psm-i-a4513729/' THEN 'PHP Developer'
	WHEN TRIM(pozisyon) LIKE '%IBM AIX%' THEN 'IBM AIX Specialist'
	WHEN TRIM(pozisyon) LIKE '%IBM BPM%' THEN 'IBM BPM Specialist'
	WHEN TRIM(pozisyon) LIKE '%Information Security%' THEN 'Information Security Specialist'
	WHEN TRIM(pozisyon) LIKE '%IT Application%' THEN 'IT Application Administrator'
	WHEN TRIM(pozisyon) LIKE '%IVR%Analist%' THEN 'IVR Analyst'
	WHEN TRIM(pozisyon) LIKE '%İş%Geliştirme%' THEN 'Business Development Specialist'
	WHEN TRIM(pozisyon) LIKE '%API %' THEN 'API Management Specialist'
	WHEN TRIM(pozisyon) = 'Junior Developer'
		OR TRIM(pozisyon) = 'Senior/Mid Developer' THEN 'Software Developer'
	WHEN TRIM(pozisyon) LIKE '%React Native%' THEN 'React Native Developer'
	WHEN TRIM(pozisyon) LIKE '%Help Desk Manage%' THEN 'IT Help Desk Manager'
	WHEN TRIM(pozisyon) = 'Kıdemli Teknisyen' THEN 'IT Technician'
	WHEN TRIM(pozisyon) LIKE '%LLM/NLP%' THEN 'LLM/NLP Engineers'
	WHEN TRIM(pozisyon) = 'Mikroservis Mimarı' THEN 'Microservice Architect'
	WHEN TRIM(pozisyon) LIKE '%Mobile Developer%' THEN 'Mobile Developer'
	WHEN TRIM(pozisyon) = 'Operasyon Uzmanı' THEN 'IT Operation Specialist'
	WHEN TRIM(pozisyon) = 'OSS Snr. SA/Integration Expert' THEN 'Object Storage Service Integration Expert'
	WHEN TRIM(pozisyon) = 'Outsystems' THEN 'Outsystems Developer'
	WHEN TRIM(pozisyon) = 'PEGA Danışmanı' THEN 'PEGA Consultant'
	WHEN TRIM(pozisyon) LIKE '%Power Platform%' THEN 'Power Platform Engineer'
	WHEN TRIM(pozisyon) LIKE '%Presales%' THEN 'Presales Consultant'
	WHEN TRIM(pozisyon) LIKE '%Program and Portfolio%' THEN 'Program and Portfolio Director'
	WHEN TRIM(pozisyon) LIKE '%React Dev%' THEN 'React Developer'
	WHEN TRIM(pozisyon) LIKE '%React.js%' THEN 'React.js Developer'
	WHEN TRIM(pozisyon) LIKE '%RPA Develop%' THEN 'RPA Developer'
	WHEN TRIM(pozisyon) LIKE '%Security Operations%' THEN 'Security Operations Team Lead'
	WHEN TRIM(pozisyon) LIKE '%Customer Success Man%' THEN 'Customer Success Manager'
	WHEN TRIM(pozisyon) LIKE '%Data Scientist%' 
		OR TRIM(pozisyon) LIKE '%Veri Bilim%' THEN 'Data Scientist'
	WHEN TRIM(pozisyon) LIKE '%DBA%'  THEN 'DBA'
	WHEN TRIM(pozisyon) LIKE '%Machine Learning%'  THEN 'Machine Learning Engineer'
	WHEN TRIM(pozisyon) LIKE '%Service Owner%'  THEN 'Service Owner Specialist'
	WHEN TRIM(pozisyon) LIKE '%Siebel%'  THEN 'Siebel Developer'
	WHEN TRIM(pozisyon) LIKE '%Solution Consultant%'  THEN 'Solution Consultant'
	WHEN TRIM(pozisyon) = 'Service Management Senior Manager'  THEN 'Service Manager'
	WHEN TRIM(pozisyon) LIKE '%Sheme Dev%'  THEN 'Scheme Developer'
	WHEN TRIM(pozisyon) = 'Sistek Mühendisi'  THEN 'System Engineer'
	WHEN TRIM(pozisyon) = 'Sistem-Operasyon Destek Uzmanı'  THEN 'Operation Support Specialist'
	WHEN TRIM(pozisyon) = 'SME-Banking (Credit)'  THEN 'Credit Risk Analyst'
	WHEN TRIM(pozisyon) = 'Software Development Manager'  THEN 'Software Manager'
	WHEN TRIM(pozisyon) LIKE 'Software Suppo%' 
		OR TRIM(pozisyon) LIKE 'Support Specia%'  THEN 'Software Support Specialist'
	WHEN TRIM(pozisyon) = 'Software Team Lead'  THEN 'Software Development Team Lead'
	WHEN TRIM(pozisyon) LIKE 'Solution Develop%'  THEN 'Solution Development Team Lead'
	WHEN TRIM(pozisyon) LIKE '%Design Engin%'  THEN 'Hardware Design Engineer'
	WHEN TRIM(pozisyon) = 'Takım Lideri'  THEN 'Data Management Team Lead'
	WHEN TRIM(pozisyon) = 'Teknik Destek Mühendisi'  THEN 'Technical Support Engineer'
	WHEN TRIM(pozisyon) = 'Teknik Lider'  
		OR TRIM(pozisyon) = 'Teknik Team Lead' THEN 'Software Development Team Lead'
	WHEN TRIM(pozisyon) = 'Ticketing Support'  THEN 'Ticketing Support Specialist'
	WHEN TRIM(pozisyon) = 'Vdf-Ydışı-IOT'  THEN 'Software Architect'
	WHEN TRIM(pozisyon) LIKE '%Web Analytics%'  THEN 'Web Analytics Specialist'
	WHEN TRIM(pozisyon) = 'Yapay Zeka Direktörü'  THEN 'Artificial Intelligence Director'
	WHEN TRIM(pozisyon) = 'Yazılım Destek Uzmanı'  THEN 'Software Support Engineer'
	WHEN TRIM(pozisyon) = 'Yönetim'  THEN 'Data Solution Architect'		    
	ELSE TRIM(pozisyon)
END AS title
,CASE 
	WHEN TRIM(kurum) LIKE 'Asis%' THEN 'Asis Otomasyon'
	WHEN TRIM(kurum) LIKE 'Codexist%' THEN 'Codexist Bilişim'
	WHEN TRIM(kurum) LIKE '%Digilera%' THEN 'Digilera'
	WHEN TRIM(kurum) = 'Enerjisa' THEN 'EnerjiSA'
	WHEN TRIM(kurum) LIKE 'EYE%' 
		OR TRIM(kurum) LIKE 'EY %' 
		OR TRIM(kurum) LIKE 'EY-%'  THEN 'EYE Teknoloji'
	WHEN TRIM(kurum) LIKE 'Gantek%' 
		OR TRIM(kurum) = 'Vodafone-Openshift' 
		OR TRIM(kurum) = 'TT-DEVOPS' 
		OR TRIM(kurum) = 'LINUX ADMIN - İSTANBUL' 
		OR TRIM(kurum) = 'Gatntek (TT)' 
		OR TRIM(kurum) = 'Ganktek (TT)'  THEN 'Gantek'
	WHEN TRIM(kurum) LIKE '%ID3%' 
		OR TRIM(kurum) LIKE '%Kuveyt%' 
		OR TRIM(kurum) = 'Vakıf Katılım' THEN 'ID3'
	WHEN TRIM(kurum) LIKE '%Infolojik%' 
		OR TRIM(kurum) LIKE '%İnfolojik%'  THEN 'İnfolojik'
	WHEN TRIM(kurum) LIKE '%Inomera%' 
		OR TRIM(kurum) LIKE '%İnomera%'  THEN 'Inomera'
	WHEN TRIM(kurum) LIKE '%_nsp_re_T%'   
		THEN 'InspireIT'
	WHEN TRIM(kurum) LIKE '%Intellica%' 
		OR TRIM(kurum) LIKE '%İntellica%'  
		OR TRIM(kurum) = 'INTELLICA'  THEN 'Intellica'
		WHEN TRIM(kurum) LIKE '%IWF%' 
		OR TRIM(kurum) LIKE '%SRP%' THEN 'SRP Legal'
	WHEN TRIM(kurum) LIKE 'MDS%ap%' THEN 'MDS ap Tech'
	WHEN TRIM(kurum) LIKE 'Metric%' THEN 'Metric Yazılım'
	WHEN TRIM(kurum) LIKE 'Misyon%' THEN 'Misyon Bank'
	WHEN TRIM(kurum) LIKE 'Netaş%' THEN 'NETAŞ'
	WHEN TRIM(kurum) LIKE 'Omreon%' THEN 'Omreon'
	WHEN TRIM(kurum) LIKE 'Optim%' 
		OR TRIM(kurum) LIKE '%Optiim%' THEN 'Optiim'
	WHEN TRIM(kurum) LIKE 'pia%'
		OR TRIM(kurum) LIKE 'pıa%' THEN 'PiA'
	WHEN TRIM(kurum) LIKE 'Polat%' THEN 'Polat Grup'
	WHEN TRIM(kurum) LIKE 'PROTO%' 
		OR TRIM(kurum) LIKE '%Proto%' THEN 'Proto Yazılım'
	WHEN TRIM(kurum) LIKE 'SİSTEK%' THEN 'Sistek'
	WHEN TRIM(kurum) LIKE 'Tatilbudur%' THEN 'TatilBudur'
	WHEN TRIM(kurum) LIKE 'TAV%' THEN 'TAV Technologies'
	WHEN TRIM(kurum) LIKE 'Vektor%' THEN 'Vektor Mobility'
	WHEN TRIM(kurum) = 'YıldızTech' THEN 'Yıldız Tech'
	WHEN TRIM(kurum) LIKE '%Vava%' THEN 'VavaCars'
	WHEN TRIM(kurum) LIKE 'Unite%' THEN 'UniteBT'
	WHEN TRIM(kurum) LIKE 'SANKO%' THEN 'SANKO Holding'
	WHEN TRIM(kurum) LIKE 'Pusula%' THEN 'Pusula Yazılım'
	WHEN TRIM(kurum) = 'Perasoft' THEN 'Pera Soft'
	WHEN TRIM(kurum) LIKE 'KPO%' THEN 'KPO'
	WHEN TRIM(kurum) LIKE 'Ithinka%' 
		OR TRIM(kurum) LIKE 'İthinka%' THEN 'Ithinka'
	WHEN TRIM(kurum) = 'İdeasoft' THEN 'Ideasoft'
	WHEN TRIM(kurum) LIKE '%Etiya%' THEN 'Etiya'
	WHEN TRIM(kurum) LIKE '%Çözüm%' THEN 'Çözümevi'
	WHEN TRIM(kurum) = 'CLINICAL MIND' THEN 'Clinical Mind'
	WHEN TRIM(kurum) LIKE 'Buinsoft%' THEN 'Buinsoft'
	WHEN TRIM(kurum) = 'Be 1 Consultancy' THEN 'BE1 Consultancy'
	WHEN TRIM(kurum) = 'Avivasa' THEN 'AvivaSA'
	WHEN TRIM(kurum) LIKE 'AVD%' THEN 'AVD Teknoloji'
	WHEN TRIM(kurum) LIKE '%Alhazen%' THEN 'Alhazen'
	WHEN TRIM(kurum) = 'AKampus' THEN 'Akampüs'
	WHEN TRIM(kurum) = '6 yıl' 
		OR TRIM(kurum) = '-' THEN NULL
	ELSE TRIM(kurum)
END AS customer
,CASE 
	WHEN TRIM(tecr_yili) = '110-120K' THEN NULL
	WHEN TRIM(tecr_yili) LIKE 'Seviye%' THEN CAST([dbo].[extract_numbers](SUBSTRING(tecr_yili,10,LEN(tecr_yili))) AS FLOAT)
	ELSE CAST([dbo].[extract_numbers](TRIM(tecr_yili)) AS FLOAT)
END AS experience
      ,CASE
	WHEN PATINDEX('[0-9][0-9][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN 
		TRY_CAST (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%[Kk]%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
		AS FLOAT   ) *1000
	WHEN PATINDEX('[0-9][0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%-%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
		AS FLOAT   ) * 1000
	WHEN PATINDEX('[0-9][0-9][0-9][,.][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][0-9][,.][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][,.][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			REPLACE (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%[Kk]%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
			, ',' ,'.'
					  )
		 AS FLOAT ) *1000
	WHEN PATINDEX('[0-9][0-9][0-9][,.][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][0-9][,.][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][,.][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			REPLACE (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%-%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
			, ',' ,'.'
					  )
		 AS FLOAT ) *1000
	WHEN PATINDEX('%[0-9][0-9][0-9][,.][0-9][0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('%[0-9][0-9][,.][0-9][0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('%[0-9][,.][0-9][0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			REPLACE (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%-%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
			, ',' ,'.'
					  )
		 AS FLOAT ) *1000
	WHEN PATINDEX('%[0-9][0-9][0-9][,.][0-9][0-9][0-9]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('%[0-9][0-9][,.][0-9][0-9][0-9]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('%[0-9][,.][0-9][0-9][0-9]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			REPLACE (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%[^0-9]%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
			, ',' ,'.'
					  )
		 AS FLOAT ) * 1000
	ELSE TRY_CAST(TRIM(net_ucret) AS FLOAT)

END AS net_salary
      ,CASE 
	WHEN TRIM([adayin_lokasyonu_il_ilce]) LIKE '%İst.%'
	THEN REPLACE(TRIM([adayin_lokasyonu_il_ilce]),'İst.','İstanbul')
	ELSE TRIM([adayin_lokasyonu_il_ilce])
END AS [location]
,CASE
	WHEN TRIM(ingilizce) LIKE '%A1%'
		OR TRIM(ingilizce) LIKE '%Başlangıç%' 
		OR TRIM(ingilizce) LIKE '%Düşük%'  THEN 'A1'
	WHEN TRIM(ingilizce) LIKE '%A2%' 
		OR TRIM(ingilizce) LIKE '%Temel%' THEN 'A2'
	WHEN TRIM(ingilizce) LIKE '%B1%'
	    OR TRIM(ingilizce) LIKE '%B[ ]1%'
		OR TRIM(ingilizce) LIKE '%orta%' 
		OR TRIM(ingilizce) LIKE '%orta seviye%'
		OR TRIM(ingilizce) LIKE 'Intermediate%' 
		OR TRIM(ingilizce) LIKE 'Mid%' 
		OR TRIM(ingilizce) LIKE '%Profesyonel%' 
		OR TRIM(ingilizce) LIKE '%Tekn%' THEN 'B1'
	WHEN TRIM(ingilizce) LIKE '%B2%' 
		OR TRIM(ingilizce) LIKE '%iyi%'   
		OR TRIM(ingilizce) LIKE '%Tekn% +%' 
		OR TRIM(ingilizce) LIKE 'Upper %[İI]%ntermediate' THEN 'B2'
	WHEN TRIM(ingilizce) LIKE '%C1%' 
	OR TRIM(ingilizce) LIKE '%Aktif%' 
	OR TRIM(ingilizce) LIKE '%Akıcı%' 
	OR TRIM(ingilizce) LIKE '%Adv[ae]nced%' 
	OR TRIM(ingilizce) LIKE '%İleri%' THEN 'C1'
	WHEN TRIM(ingilizce) LIKE '%C2%' 
	OR TRIM(ingilizce) LIKE '%Anadil%' THEN 'C2'
	ELSE NULL
END AS english_level
,CASE
	WHEN TRIM(recruiter) LIKE '[^A-Za-z]'
		OR TRIM(recruiter) = 'İnfolojik Ref.' THEN 'n/a'
	WHEN TRIM(recruiter) LIKE '%Afife%' 
		OR TRIM(recruiter) LIKE '%Affie%' THEN 'Afife'
	WHEN TRIM(recruiter) LIKE '%Başak%' THEN 'Başak'
	WHEN TRIM(recruiter) LIKE '%Betül%' THEN 'Betül'
	WHEN TRIM(recruiter) LIKE '%Zeynep%' THEN 'Zeynep'
	WHEN TRIM(recruiter) LIKE '%Beril%' THEN 'Beril'
	WHEN TRIM(recruiter) LIKE '%Burak%' THEN 'Burak'
	WHEN TRIM(recruiter) LIKE '%Buse%' THEN 'Buse'
	WHEN TRIM(recruiter) LIKE '%Deniz%' THEN 'Deniz'
	WHEN TRIM(recruiter) LIKE '%Deniz K%' THEN 'Deniz Karsel'
	WHEN TRIM(recruiter) LIKE '%Deniz K%' THEN 'Deniz Karsel'
	WHEN TRIM(recruiter) LIKE '%Ebru%' THEN 'Ebru'
	WHEN TRIM(recruiter) LIKE '%Ege%' THEN 'Ege'
	WHEN TRIM(recruiter) <> 'Elif Mine' 
		AND TRIM(recruiter) LIKE '%Elif%' THEN 'Elif Day'
	WHEN TRIM(recruiter) LIKE '%Emre%' THEN 'Emre'
	WHEN TRIM(recruiter) LIKE '%Erdem%' THEN 'Erdem'
	WHEN TRIM(recruiter) LIKE '%Fatma%' THEN 'Fatma'
	WHEN TRIM(recruiter) LIKE '%Funda%' THEN 'Funda'
	WHEN TRIM(recruiter) LIKE '%Furkan%' THEN 'Furkan'
	WHEN TRIM(recruiter) LIKE '%Gamze%' THEN 'Gamze'
	WHEN TRIM(recruiter) <> 'Gizem Dilara' 
		AND TRIM(recruiter) LIKE '%Gizem%' THEN 'Gizem Afacan'
	WHEN TRIM(recruiter) LIKE '%Hanife%' THEN 'Hanife'
	WHEN TRIM(recruiter) LIKE '%Hatice%' THEN 'Hatice'
	WHEN TRIM(recruiter) LIKE '%Hayra%' THEN 'Hayra'
	WHEN TRIM(recruiter) LIKE '%Hilal%' THEN 'Hilal'
	WHEN TRIM(recruiter) LIKE '%İlke%' THEN 'İlke'
	WHEN TRIM(recruiter) LIKE '%Meral%'
		OR TRIM(recruiter) LIKE '%MK%' THEN 'Meral'
	WHEN TRIM(recruiter) LIKE '%Neslişah%' THEN 'Neslişah'
	WHEN TRIM(recruiter) LIKE '%Neval%' THEN 'Neval'
	WHEN TRIM(recruiter) LIKE '%NİSAN%' THEN 'Nisan'
	WHEN TRIM(recruiter) LIKE '%Onur%' THEN 'Onur'
	WHEN TRIM(recruiter) <> 'Özge Tanay'
		AND TRIM(recruiter) <> 'Özge Delibalta'
		AND TRIM(recruiter) LIKE '%Özge%' THEN 'Özge'
	WHEN TRIM(recruiter) LIKE '%Özlem%' THEN 'Özlem'
	WHEN TRIM(recruiter) LIKE '%Pınar%' THEN 'Pınar'
	WHEN TRIM(recruiter) LIKE '%Sedef%' THEN 'Sedef'
	WHEN TRIM(recruiter) LIKE '%Sibel%' THEN 'Sibel'
	WHEN TRIM(recruiter) LIKE '%Süheyla%' THEN 'Süheyla'
	WHEN TRIM(recruiter) LIKE '%Tuğba%' THEN 'Tuğba'
	WHEN TRIM(recruiter) LIKE '%Tuna%' THEN 'Tunahan'
	WHEN TRIM(recruiter) LIKE '%Yasemin H%' THEN 'Yasemin Hepyaşar'
	WHEN TRIM(recruiter) LIKE '%Yasemin%' THEN 'Yasemin'
	ELSE TRIM(recruiter)
END recruiter
      ,CASE 
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Li%' THEN 'Linkedin'
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Ka%' THEN 'Kariyer.net'
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Re%'
		OR TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) = 'Aday yönlendirmesi' 
		OR TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) = 'İnfolojik'  THEN 'Referans'
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Veri%'
		OR TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) = 'Eski Aday' THEN 'Veritabanı'
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Baş%' THEN 'Başvuru'
	ELSE 'n/a'
END AS [source]
,CASE
	WHEN TRIM(mulakat_yontemi_online_telefon) LIKE '%Tel%' THEN  'Telefon'
	WHEN TRIM(mulakat_yontemi_online_telefon) LIKE '%Onl%' 
		OR TRIM(mulakat_yontemi_online_telefon) = 'Onilne'	THEN 'Online'
	ELSE 'n/a'
END AS interview_method      
,TRIM([kategori]) AS elimination_reason
,TRIM([teklif_red_kategorisi]) AS offer_reject_reason
,CASE
	WHEN TRIM(linkedin) LIKE '%linkedin%' THEN  TRIM(linkedin)
	ELSE 'n/a'
END AS linkedin_url
FROM [TechnoHR].[ods].[at_aday_rapor]
GO
TRUNCATE TABLE stg.et_aday_raporu
INSERT INTO stg.et_aday_raporu (
	   [submission_date]
      ,[candidate_full_name]
      ,[title]
      ,[customer]
      ,[experience]
      ,[net_salary]
      ,[location]
      ,[english_level]
      ,[recruiter]
      ,[source]
      ,[interview_method]
      ,[elimination_reason]
      ,[offer_reject_reason]
      ,[linkedin_url]
)
SELECT 
TRY_CONVERT(DATE,[tarih],103) AS submission_date      
,UPPER([aday]) AS candidate_full_name
,CASE 
	WHEN TRIM(pozisyon) LIKE '%.net%' 
		OR TRIM(pozisyon) LIKE '%. net%' 
		OR TRIM(pozisyon) LIKE '%dot net%' 
		OR TRIM(pozisyon) LIKE '%c#%' THEN '.NET Developer'
	WHEN TRIM(pozisyon) LIKE '%java%'  THEN 'Java Developer'
	WHEN TRIM(pozisyon) LIKE '%yazılım geliştirme%' 
		OR  TRIM(pozisyon) LIKE '%yazılım uz%'
		OR  TRIM(pozisyon) LIKE '%software develope%'
		OR  TRIM(pozisyon) LIKE '%backend dev%' 
		OR  TRIM(pozisyon) LIKE '%full%stack%' THEN 'Software Developer'
	WHEN TRIM(pozisyon) LIKE '%software%architect%' 
		OR TRIM(pozisyon) LIKE '%yazılım%mimar%' THEN 'Software Architect'
	WHEN TRIM(pozisyon) LIKE '%solution%arch%' 
		OR TRIM(pozisyon) LIKE '%çözüm%mimar%' THEN 'Solution Architect'
	WHEN TRIM(pozisyon) LIKE '%network%arch%' 
		OR TRIM(pozisyon) LIKE '%network%mimar%' 
		OR TRIM(pozisyon) LIKE '%system&network%' 
		OR TRIM(pozisyon) LIKE '%network%adm%' 
		OR TRIM(pozisyon) LIKE '%network%adm%'
		OR TRIM(pozisyon) LIKE '%AWS%' 
		OR TRIM(pozisyon) LIKE '%Network Takım%' THEN 'System & Network Team Lead'
	WHEN TRIM(pozisyon) LIKE '%Açık Kaynak Yönetimi%' 
		OR  TRIM(pozisyon) LIKE '%open%source%' THEN 'Opensource DBA'
	WHEN TRIM(pozisyon) LIKE '%Oracle%' THEN 'Oracle DBA'
	WHEN TRIM(pozisyon) LIKE '%MsSQL%DBA%' OR TRIM(pozisyon) LIKE '%SQL Server%' THEN 'MsSQL DBA'      
	WHEN TRIM(pozisyon) LIKE '%Post%greSQL%DBA%' THEN 'PostgreSQL DBA'
	WHEN TRIM(pozisyon) LIKE '%veri%tabanı%' THEN 'DBA'
	WHEN TRIM(pozisyon)  LIKE '%BI%' 
		OR TRIM(pozisyon)  LIKE '%DWH%' 
		OR TRIM(pozisyon)  LIKE '%Power BI%'
		OR TRIM(pozisyon) LIKE '%SQL%'
		OR TRIM(pozisyon) LIKE '%Cognos%'
		OR TRIM(pozisyon) LIKE '%ODI%'
		OR TRIM(pozisyon) LIKE '%SAP BI%'
		OR TRIM(pozisyon) LIKE '%informatica%'
		OR TRIM(pozisyon) LIKE '%iş zekası%'
		OR TRIM(pozisyon) LIKE '%veri%ambarı%'
		OR TRIM(pozisyon) LIKE '%data%warehouse%'
		OR TRIM(pozisyon) LIKE '%Analitik Uzman%'
		OR TRIM(pozisyon) LIKE '%Business Intelligence%'
		OR TRIM(pozisyon) LIKE '%ETL%'
	THEN 'BI/DWH Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%FI%' THEN 'SAP FI Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%BW%' THEN 'SAP BW Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%SAP CO%' THEN 'SAP CO Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%EPM%' THEN 'SAP EPM Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%PM%' THEN 'SAP PM Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%PP%' THEN 'SAP PP Consultant'
	WHEN TRIM(pozisyon) LIKE '%SAP%' AND TRIM(pozisyon) LIKE '%SD%MM%' THEN 'SAP SD/MM Consultant'
	WHEN TRIM(pozisyon) = 'PM Danışmanı' THEN 'SAP PM Consultant'
	WHEN TRIM(pozisyon) LIKE '%ABAP%' THEN 'SAP ABAP Consultant'
	WHEN TRIM(pozisyon) LIKE '%BW/4HANA%' THEN 'SAP BW/4HANA Consultant'
	WHEN TRIM(pozisyon) = 'Data-Software-PM-Snr.,Expert,Lead,Man.' THEN 'SAP S/4 HANA Consultant'
	WHEN TRIM(pozisyon) LIKE '%front%end%' 
		OR TRIM(pozisyon) LIKE '%ön%yüz%' 
		OR TRIM(pozisyon) LIKE '%angular%' THEN 'Frontend Developer'
	WHEN TRIM(pozisyon) LIKE '%dev%ops%' THEN 'DevOps Engineer'
	WHEN TRIM(pozisyon) LIKE '%account%mana%' 
		OR TRIM(pozisyon) LIKE '%müşteri%yönet%' THEN 'Account Manager'
	WHEN TRIM(pozisyon) LIKE '%syst%adm%'
		OR TRIM(pozisyon) LIKE '%sistem%adm%' 
		OR TRIM(pozisyon) LIKE '%sistem%müh%' 
		OR TRIM(pozisyon) LIKE '%sistem%yön%' THEN 'System Admin/Engineer'
	WHEN TRIM(pozisyon) LIKE '%network spe%'
		OR TRIM(pozisyon) LIKE '%network%uzm%'
		OR TRIM(pozisyon) LIKE '%network%security%'
		OR TRIM(pozisyon) LIKE '%Ağ Güvenlik%' THEN 'Network Specialist'
	WHEN TRIM(pozisyon) LIKE '%yedekleme%' 
		OR TRIM(pozisyon) LIKE '%backup%' THEN 'Backup Specialist'
	WHEN TRIM(pozisyon) LIKE '%sanalla%' 
		OR TRIM(pozisyon) LIKE '%virtual%'THEN 'Virtualization Specialist'
	WHEN TRIM(pozisyon) LIKE '%linux%' 
		OR TRIM(pozisyon) LIKE '%unix%' THEN 'Linux Admin'
	WHEN TRIM(pozisyon) LIKE '%windws%'
		OR TRIM(pozisyon) LIKE '%windows%'
		OR TRIM(pozisyon) = 'WINDWS SİSTEM' THEN 'Windows Admin'
	WHEN TRIM(pozisyon) LIKE '%product%manager%'
		OR TRIM(pozisyon) LIKE '%ürün%yönet%' THEN 'Product Manager'
	WHEN TRIM(pozisyon) LIKE '%project%engineer%'
		OR TRIM(pozisyon) LIKE '%proje%mühendis%' 
		OR TRIM(pozisyon) LIKE '%project%ex%' THEN 'Project Engineer'
	WHEN TRIM(pozisyon) LIKE '%project%manager%'
		OR TRIM(pozisyon) LIKE '%proje%yönet%' 
		OR TRIM(pozisyon) = 'Senior PM' THEN 'Project Manager'
	WHEN TRIM(pozisyon) LIKE '%proje%uzman%' THEN 'Project Specialist'
	WHEN TRIM(pozisyon) LIKE '%iş%anali%'
		OR TRIM(pozisyon) LIKE '%business%anal%'
		OR TRIM(pozisyon) = 'İş Analsiti Yönetmen'
		OR TRIM(pozisyon) = 'Analist'  THEN 'Business Analyst'
	WHEN TRIM(pozisyon) LIKE '%sistem%anali%'
		OR TRIM(pozisyon) LIKE '%system%anal%' THEN 'System Analyst'
	WHEN TRIM(pozisyon) LIKE '%ürün%anali%'
		OR TRIM(pozisyon) LIKE '%product%anal%' THEN 'Product Analyst'
	WHEN TRIM(pozisyon) LIKE '%ANDROID%'
		OR TRIM(pozisyon) LIKE '%ios%android%' 
		OR TRIM(pozisyon) LIKE '%Android%' THEN 'Android Developer'
	WHEN TRIM(pozisyon) LIKE '%iOS%' 
		OR TRIM(pozisyon) LIKE '%Ios%' THEN 'iOS Developer'
	WHEN TRIM(pozisyon) LIKE '%flutter%' THEN 'Flutter Developer'
	WHEN TRIM(pozisyon) LIKE '%big%data%' 
		OR TRIM(pozisyon) LIKE '%büyük%veri%' THEN 'Big Data Engineer'
	WHEN TRIM(pozisyon) LIKE '%uygulama destek%'
		OR TRIM(pozisyon) LIKE '%application%support%' THEN 'Application Support Engineer'
	WHEN TRIM(pozisyon) LIKE '%ar ge engin%' 
		OR  TRIM(pozisyon) LIKE '%ar-ge engin%' 
		OR  TRIM(pozisyon) LIKE '%ar ge müh' 
		OR  TRIM(pozisyon) LIKE '%ar ge yönet%' 
		OR  TRIM(pozisyon) LIKE '%r&d%' 
		OR  TRIM(pozisyon) LIKE '%arge%' THEN 'R&D Engineer'
	WHEN TRIM(pozisyon) LIKE '%asset%' AND TRIM(pozisyon) LIKE '%configuration%' 
		OR TRIM(pozisyon) LIKE '%konfigürasyon%' THEN 'Asset & Configuration Manager'
	WHEN TRIM(pozisyon) = 'Bilgi Teknolojileri Müdür Yardımcısı' THEN 'IT Assistant Manager'
	WHEN TRIM(pozisyon) LIKE '%CRM%' THEN 'CRM Specialist'
	WHEN TRIM(pozisyon)  LIKE '%cyber security%' 
		OR TRIM(pozisyon) LIKE '%siber%' THEN 'Cyber Security Specialist'
	WHEN TRIM(pozisyon) = 'DB OPERASYON' THEN 'Database Operation Specialist'
	WHEN TRIM(pozisyon) LIKE '%Django%' THEN 'Django Developer'
	WHEN TRIM(pozisyon) LIKE '%PHP%' THEN 'PHP Developer'
	WHEN TRIM(pozisyon)  LIKE '%embedded soft%' 
		OR TRIM(pozisyon) LIKE '%gömülü%yazılım%' THEN 'Embedded Software Engineer'
	WHEN TRIM(pozisyon)  LIKE '%hardware design%' 
		OR TRIM(pozisyon) LIKE '%donanım tasarım%' THEN 'Hardware Design Engineer'
	WHEN TRIM(pozisyon) LIKE '%finan%' AND TRIM(pozisyon) LIKE '%manage%' 
		OR TRIM(pozisyon) LIKE '%müdür%' THEN 'Finance Manager'
	WHEN TRIM(pozisyon) LIKE '%Finans%Uzmanı%' THEN 'Finance Specialist'
	WHEN TRIM(pozisyon) = 'Finans Analisti' THEN 'Finance Analyst'
	WHEN TRIM(pozisyon) = 'Finansal Raporlama ve Bütçe Planlama Danışmanı' THEN 'Financial Reporting and Budget Planning Consultant'
	WHEN TRIM(pozisyon) LIKE '%ik uzman%' AND TRIM(pozisyon) LIKE '%manage%' 
		OR TRIM(pozisyon) LIKE '%müdür%' THEN 'Finance Manager'
	WHEN TRIM(pozisyon) = 'Finans Uzmanı' THEN 'Finance Specialist'
	WHEN TRIM(pozisyon) IN (
	'İK Uzmanı', 'İK Elemanı', 'HR Specialist', 'HR Generalist',
	'Human Resources Specialist', 'İK Operasyon Sorumlusu' , 'Human Resources Generalist',
	'İnsan Kaynakları Uzmanı','Kıdemli İnsan Kaynakları Uzmanı' , 'İnsan ve Kültür Uzmanı' , 
	'İnsan Kaynakları Elemanı', 'People and Culture Specialist' , 'Talent Acquisition Executive',
	'Talent Acquisition Specialist' , 'Talent Acquisiton Specialist'
	) THEN 'HR Specialist'

	WHEN TRIM(pozisyon) IN (
		'Human Resources Business Partner', 'İnsan Kaynakları İş Ortağı' , 'HR Business Partner'
	) THEN 'HRBP'

	WHEN TRIM(pozisyon) IN (
		'İşe Alım uzmanı', 'IT İşe alım uzmanı', 'IT recruiter' , 'IT Recruiter/Talent Acquisition Specialist' , 
		'HRBP/IT Recruiter'
	) THEN 'Recruiter'
	WHEN TRIM(pozisyon) IN (
		'İK Yöneticisi', 'İnsan Kaynakları Yöneticisi','Human Resources Manager' , 'İnsan Kaynakları Direktörü'
	) THEN 'HR Manager'
	WHEN (TRIM(pozisyon) LIKE '%yönetici%' AND TRIM(pozisyon) LIKE '%asist%') 
		OR TRIM(pozisyon) = 'Ofis Asistanı' THEN 'Executive Assistant'
	WHEN TRIM(pozisyon) LIKE '%middleware%' OR  TRIM(pozisyon) LIKE '%orta%katman%' THEN 'Middleware Specialist'
	WHEN TRIM(pozisyon) LIKE '%test%' 
		OR  TRIM(pozisyon) LIKE '%qa%'
		OR  TRIM(pozisyon) LIKE '%quality assurance%' THEN 'Test/QA Specialist'
	WHEN TRIM(pozisyon) LIKE '%weblogic%' THEN 'Weblogic Specialist'
	WHEN TRIM(pozisyon) = 'İş Çöz. Direktörü' THEN 'Business Solutions Manager'
	WHEN TRIM(pozisyon) LIKE '%Solution%Designer%' THEN 'Solution Designer'
	WHEN TRIM(pozisyon) LIKE '%Solution Eng%' THEN 'Solution Engineer'
	WHEN TRIM(pozisyon) LIKE '%L2 Support%' 
		OR  TRIM(pozisyon) LIKE '%L2 Destek%' THEN 'L2 Support Engineer'
	WHEN TRIM(pozisyon) LIKE '%Openshift%' THEN 'Openshift Specialist'
	WHEN TRIM(pozisyon) LIKE '%otomasyon%' 
		OR TRIM(pozisyon) LIKE '%automation%' THEN 'Automation Management Specialist'
	WHEN TRIM(pozisyon) = 'Otomatik Kapı Ustası' THEN 'Automatic Door Expert'
	WHEN TRIM(pozisyon) LIKE '%muhasebe%' THEN 'Bookkeeper'
	WHEN TRIM(pozisyon) LIKE '%performans%pazarlama%' THEN 'Performance Marketing Specialist'
	WHEN TRIM(pozisyon) LIKE '%red%hat%' THEN 'Red Hat Linux Specialist'
	WHEN TRIM(aday)     = 'Sabri Volkan Balaban' THEN 'ERP Consultant'
	WHEN TRIM(pozisyon) LIKE '%storage%' 
		OR TRIM(pozisyon) LIKE '%depolama%' THEN 'Storage Specialist'
	WHEN TRIM(pozisyon)     = 'Teknoloji Direktörü' THEN 'Director of Technology'
	WHEN TRIM(pozisyon) LIKE '%UI%' OR TRIM(pozisyon) LIKE '%UX%' THEN 'UI/UX Designer'
	WHEN TRIM(pozisyon) LIKE '%Software%Engin%' 
	OR TRIM(pozisyon) LIKE '%Yazılım%Müh%' THEN 'Software Engineer'
	WHEN TRIM(pozisyon) LIKE '%Yazılım%Yöneti%' THEN 'Software Manager'
	WHEN TRIM(pozisyon) LIKE '%Python%' THEN 'Python Developer'
	WHEN TRIM(pozisyon) LIKE '%Data Engineer%' 
		OR TRIM(pozisyon) LIKE '%Veri Müh%'  THEN 'Data Engineer'
	WHEN TRIM(pozisyon) LIKE '%exchange%'
		OR TRIM(pozisyon) LIKE '%Sistem Uzman%' 
		OR TRIM(pozisyon) LIKE '%System Specialist%' THEN 'System Specialist'
	WHEN TRIM(pozisyon) LIKE 'Security Compliance & Governance%' THEN 'Security GRC Specialist'
	WHEN TRIM(pozisyon) = 'Team Lead'  THEN 'BI/DWH Consultant'
	WHEN TRIM(pozisyon) LIKE '%L1 Destek%' THEN 'L1 Support Engineer'
	WHEN TRIM(pozisyon) LIKE '%Agile%' 
		OR TRIM(pozisyon) LIKE '%Scrum%' THEN 'Agile/Scrum Master'
	WHEN TRIM(pozisyon) LIKE '%Data%Anal%' 
		OR TRIM(pozisyon) = 'Data Visualization Consultant Team Head' 
		OR TRIM(pozisyon) LIKE '%Veri Anal%'
		OR TRIM(pozisyon) LIKE '%Veri katman%' THEN 'Data Analyst'
	WHEN TRIM(pozisyon) LIKE '%Digital Marketing%'  THEN 'Digital Marketing Manager'
	WHEN TRIM(pozisyon) LIKE '%Digital Transform%'  THEN 'Digital Transformation Supervisor'
	WHEN TRIM(pozisyon) LIKE '%satış%uzman%' 
		OR  TRIM(pozisyon) LIKE '%sales%special%' 
		OR  TRIM(pozisyon) LIKE '%sales%executive%' THEN 'Sales Specialist'
	WHEN TRIM(pozisyon) = 'Satış ve Pazarlama Yöneticisi'  THEN 'Sales Manager'
	WHEN TRIM(pozisyon) LIKE '%Elixir%'  THEN 'Elixir Developer'
	WHEN TRIM(pozisyon) LIKE '%cloud%' AND TRIM(pozisyon) LIKE '%engineer%'  THEN 'Cloud Engineer'
	WHEN TRIM(pozisyon) LIKE '%enterprise%architect%'  THEN 'Enterprise Platform Architect'
	WHEN TRIM(pozisyon) = 'Dijital Workforce Analytics Specialist'  THEN 'Digital Workforce Analytics Specialist'
	WHEN TRIM(pozisyon) = 'Dijital Workforce Operations Supervisor'  THEN 'Digital Workforce Operations Supervisor'
	WHEN TRIM(pozisyon) = 'Genel Paylaşım' OR TRIM(pozisyon) = 'Genel Sunum' THEN 'n/a'
	WHEN TRIM(pozisyon) = 'https://www.linkedin.com/in/yasemin-kekezo%C4%9Flu-psm-i-a4513729/' THEN 'PHP Developer'
	WHEN TRIM(pozisyon) LIKE '%IBM AIX%' THEN 'IBM AIX Specialist'
	WHEN TRIM(pozisyon) LIKE '%IBM BPM%' THEN 'IBM BPM Specialist'
	WHEN TRIM(pozisyon) LIKE '%Information Security%' THEN 'Information Security Specialist'
	WHEN TRIM(pozisyon) LIKE '%IT Application%' THEN 'IT Application Administrator'
	WHEN TRIM(pozisyon) LIKE '%IVR%Analist%' THEN 'IVR Analyst'
	WHEN TRIM(pozisyon) LIKE '%İş%Geliştirme%' THEN 'Business Development Specialist'
	WHEN TRIM(pozisyon) LIKE '%API %' THEN 'API Management Specialist'
	WHEN TRIM(pozisyon) = 'Junior Developer'
		OR TRIM(pozisyon) = 'Senior/Mid Developer' THEN 'Software Developer'
	WHEN TRIM(pozisyon) LIKE '%React Native%' THEN 'React Native Developer'
	WHEN TRIM(pozisyon) LIKE '%Help Desk Manage%' THEN 'IT Help Desk Manager'
	WHEN TRIM(pozisyon) = 'Kıdemli Teknisyen' THEN 'IT Technician'
	WHEN TRIM(pozisyon) LIKE '%LLM/NLP%' THEN 'LLM/NLP Engineers'
	WHEN TRIM(pozisyon) = 'Mikroservis Mimarı' THEN 'Microservice Architect'
	WHEN TRIM(pozisyon) LIKE '%Mobile Developer%' THEN 'Mobile Developer'
	WHEN TRIM(pozisyon) = 'Operasyon Uzmanı' THEN 'IT Operation Specialist'
	WHEN TRIM(pozisyon) = 'OSS Snr. SA/Integration Expert' THEN 'Object Storage Service Integration Expert'
	WHEN TRIM(pozisyon) = 'Outsystems' THEN 'Outsystems Developer'
	WHEN TRIM(pozisyon) = 'PEGA Danışmanı' THEN 'PEGA Consultant'
	WHEN TRIM(pozisyon) LIKE '%Power Platform%' THEN 'Power Platform Engineer'
	WHEN TRIM(pozisyon) LIKE '%Presales%' THEN 'Presales Consultant'
	WHEN TRIM(pozisyon) LIKE '%Program and Portfolio%' THEN 'Program and Portfolio Director'
	WHEN TRIM(pozisyon) LIKE '%React Dev%' THEN 'React Developer'
	WHEN TRIM(pozisyon) LIKE '%React.js%' THEN 'React.js Developer'
	WHEN TRIM(pozisyon) LIKE '%RPA Develop%' THEN 'RPA Developer'
	WHEN TRIM(pozisyon) LIKE '%Security Operations%' THEN 'Security Operations Team Lead'
	WHEN TRIM(pozisyon) LIKE '%Customer Success Man%' THEN 'Customer Success Manager'
	WHEN TRIM(pozisyon) LIKE '%Data Scientist%' 
		OR TRIM(pozisyon) LIKE '%Veri Bilim%' THEN 'Data Scientist'
	WHEN TRIM(pozisyon) LIKE '%DBA%'  THEN 'DBA'
	WHEN TRIM(pozisyon) LIKE '%Machine Learning%'  THEN 'Machine Learning Engineer'
	WHEN TRIM(pozisyon) LIKE '%Service Owner%'  THEN 'Service Owner Specialist'
	WHEN TRIM(pozisyon) LIKE '%Siebel%'  THEN 'Siebel Developer'
	WHEN TRIM(pozisyon) LIKE '%Solution Consultant%'  THEN 'Solution Consultant'
	WHEN TRIM(pozisyon) = 'Service Management Senior Manager'  THEN 'Service Manager'
	WHEN TRIM(pozisyon) LIKE '%Sheme Dev%'  THEN 'Scheme Developer'
	WHEN TRIM(pozisyon) = 'Sistek Mühendisi'  THEN 'System Engineer'
	WHEN TRIM(pozisyon) = 'Sistem-Operasyon Destek Uzmanı'  THEN 'Operation Support Specialist'
	WHEN TRIM(pozisyon) = 'SME-Banking (Credit)'  THEN 'Credit Risk Analyst'
	WHEN TRIM(pozisyon) = 'Software Development Manager'  THEN 'Software Manager'
	WHEN TRIM(pozisyon) LIKE 'Software Suppo%' 
		OR TRIM(pozisyon) LIKE 'Support Specia%'  THEN 'Software Support Specialist'
	WHEN TRIM(pozisyon) = 'Software Team Lead'  THEN 'Software Development Team Lead'
	WHEN TRIM(pozisyon) LIKE 'Solution Develop%'  THEN 'Solution Development Team Lead'
	WHEN TRIM(pozisyon) LIKE '%Design Engin%'  THEN 'Hardware Design Engineer'
	WHEN TRIM(pozisyon) = 'Takım Lideri'  THEN 'Data Management Team Lead'
	WHEN TRIM(pozisyon) = 'Teknik Destek Mühendisi'  THEN 'Technical Support Engineer'
	WHEN TRIM(pozisyon) = 'Teknik Lider'  
		OR TRIM(pozisyon) = 'Teknik Team Lead' THEN 'Software Development Team Lead'
	WHEN TRIM(pozisyon) = 'Ticketing Support'  THEN 'Ticketing Support Specialist'
	WHEN TRIM(pozisyon) = 'Vdf-Ydışı-IOT'  THEN 'Software Architect'
	WHEN TRIM(pozisyon) LIKE '%Web Analytics%'  THEN 'Web Analytics Specialist'
	WHEN TRIM(pozisyon) = 'Yapay Zeka Direktörü'  THEN 'Artificial Intelligence Director'
	WHEN TRIM(pozisyon) = 'Yazılım Destek Uzmanı'  THEN 'Software Support Engineer'
	WHEN TRIM(pozisyon) = 'Yönetim'  THEN 'Data Solution Architect'		
	WHEN TRIM(pozisyon) LIKE '%NLP%'  THEN 'Natural Language Processing Expert'	
	ELSE TRIM(pozisyon)
END AS title
,CASE 
	WHEN TRIM(kurum) LIKE 'Asis%' THEN 'Asis Otomasyon'
	WHEN TRIM(kurum) LIKE 'Codexist%' THEN 'Codexist Bilişim'
	WHEN TRIM(kurum) LIKE '%Digilera%' THEN 'Digilera'
	WHEN TRIM(kurum) = 'Enerjisa' THEN 'EnerjiSA'
	WHEN TRIM(kurum) LIKE 'EYE%' 
		OR TRIM(kurum) LIKE 'EY %' 
		OR TRIM(kurum) LIKE 'EY-%'  THEN 'EYE Teknoloji'
	WHEN TRIM(kurum) LIKE 'Gantek%' 
		OR TRIM(kurum) = 'Vodafone-Openshift' 
		OR TRIM(kurum) = 'TT-DEVOPS' 
		OR TRIM(kurum) = 'LINUX ADMIN - İSTANBUL' 
		OR TRIM(kurum) = 'Gatntek (TT)' 
		OR TRIM(kurum) = 'Ganktek (TT)'  THEN 'Gantek'
	WHEN TRIM(kurum) LIKE '%ID3%' 
		OR TRIM(kurum) LIKE '%Kuveyt%' 
		OR TRIM(kurum) = 'Vakıf Katılım' THEN 'ID3'
	WHEN TRIM(kurum) LIKE '%Infolojik%' 
		OR TRIM(kurum) LIKE '%İnfolojik%'  THEN 'İnfolojik'
	WHEN TRIM(kurum) LIKE '%Inomera%' 
		OR TRIM(kurum) LIKE '%İnomera%'  THEN 'Inomera'
	WHEN TRIM(kurum) LIKE '%_nsp_re_T%'   
		THEN 'InspireIT'
	WHEN TRIM(kurum) LIKE '%Intellica%' 
		OR TRIM(kurum) LIKE '%İntellica%'  
		OR TRIM(kurum) = 'INTELLICA'  THEN 'Intellica'
		WHEN TRIM(kurum) LIKE '%IWF%' 
		OR TRIM(kurum) LIKE '%SRP%' THEN 'SRP Legal'
	WHEN TRIM(kurum) LIKE 'MDS%ap%' THEN 'MDS ap Tech'
	WHEN TRIM(kurum) LIKE 'Metric%' THEN 'Metric Yazılım'
	WHEN TRIM(kurum) LIKE 'Misyon%' THEN 'Misyon Bank'
	WHEN TRIM(kurum) LIKE 'Netaş%' THEN 'NETAŞ'
	WHEN TRIM(kurum) LIKE 'Omreon%' THEN 'Omreon'
	WHEN TRIM(kurum) LIKE 'Optim%' 
		OR TRIM(kurum) LIKE '%Optiim%' THEN 'Optiim'
	WHEN TRIM(kurum) LIKE 'pia%'
		OR TRIM(kurum) LIKE 'pıa%' THEN 'PiA'
	WHEN TRIM(kurum) LIKE 'Polat%' THEN 'Polat Grup'
	WHEN TRIM(kurum) LIKE 'PROTO%' 
		OR TRIM(kurum) LIKE '%Proto%' THEN 'Proto Yazılım'
	WHEN TRIM(kurum) LIKE 'SİSTEK%' THEN 'Sistek'
	WHEN TRIM(kurum) LIKE 'Tatilbudur%' THEN 'TatilBudur'
	WHEN TRIM(kurum) LIKE 'TAV%' THEN 'TAV Technologies'
	WHEN TRIM(kurum) LIKE 'Vektor%' THEN 'Vektor Mobility'
	WHEN TRIM(kurum) = 'YıldızTech' THEN 'Yıldız Tech'
	WHEN TRIM(kurum) LIKE '%Vava%' THEN 'VavaCars'
	WHEN TRIM(kurum) LIKE 'Unite%' THEN 'UniteBT'
	WHEN TRIM(kurum) LIKE 'SANKO%' THEN 'SANKO Holding'
	WHEN TRIM(kurum) LIKE 'Pusula%' THEN 'Pusula Yazılım'
	WHEN TRIM(kurum) = 'Perasoft' THEN 'Pera Soft'
	WHEN TRIM(kurum) LIKE 'KPO%' THEN 'KPO'
	WHEN TRIM(kurum) LIKE 'Ithinka%' 
		OR TRIM(kurum) LIKE 'İthinka%' THEN 'Ithinka'
	WHEN TRIM(kurum) = 'İdeasoft' THEN 'Ideasoft'
	WHEN TRIM(kurum) LIKE '%Etiya%' THEN 'Etiya'
	WHEN TRIM(kurum) LIKE '%Çözüm%' THEN 'Çözümevi'
	WHEN TRIM(kurum) = 'CLINICAL MIND' THEN 'Clinical Mind'
	WHEN TRIM(kurum) LIKE 'Buinsoft%' THEN 'Buinsoft'
	WHEN TRIM(kurum) = 'Be 1 Consultancy' THEN 'BE1 Consultancy'
	WHEN TRIM(kurum) = 'Avivasa' THEN 'AvivaSA'
	WHEN TRIM(kurum) LIKE 'AVD%' THEN 'AVD Teknoloji'
	WHEN TRIM(kurum) LIKE '%Alhazen%' THEN 'Alhazen'
	WHEN TRIM(kurum) = 'AKampus' THEN 'Akampüs'
	WHEN TRIM(kurum) = 'LEDBİM' THEN 'Ledbim'
	WHEN TRIM(kurum) = '6 yıl' 
		OR TRIM(kurum) = '-' THEN NULL
	ELSE TRIM(kurum)
END AS customer       
, CASE 
	WHEN TRIM(tecr_yili) = '110-120K' THEN NULL
	WHEN TRIM(tecr_yili) LIKE 'Seviye%' THEN CAST([dbo].[extract_numbers](SUBSTRING(tecr_yili,10,LEN(tecr_yili))) AS FLOAT)
	ELSE CAST([dbo].[extract_numbers](TRIM(tecr_yili)) AS FLOAT)
END AS experience     
,CASE
	WHEN PATINDEX('[0-9][0-9][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN 
		TRY_CAST (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%[Kk]%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
		AS FLOAT   ) *1000
	WHEN PATINDEX('[0-9][0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%-%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
		AS FLOAT   ) * 1000
	WHEN PATINDEX('[0-9][0-9][0-9][,.][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][0-9][,.][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][,.][0-9][Kk]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			REPLACE (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%[Kk]%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
			, ',' ,'.'
					  )
		 AS FLOAT ) *1000
	WHEN PATINDEX('[0-9][0-9][0-9][,.][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][0-9][,.][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('[0-9][,.][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			REPLACE (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%-%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
			, ',' ,'.'
					  )
		 AS FLOAT ) *1000
	WHEN PATINDEX('%[0-9][0-9][0-9][,.][0-9][0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('%[0-9][0-9][,.][0-9][0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('%[0-9][,.][0-9][0-9][0-9]-%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			REPLACE (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%-%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
			, ',' ,'.'
					  )
		 AS FLOAT ) *1000
	WHEN PATINDEX('%[0-9][0-9][0-9][,.][0-9][0-9][0-9]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('%[0-9][0-9][,.][0-9][0-9][0-9]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	  OR PATINDEX('%[0-9][,.][0-9][0-9][0-9]%', REPLACE(TRIM(net_ucret),' ','')) = 1
	THEN
			TRY_CAST (
			REPLACE (
			SUBSTRING (
				 REPLACE(TRIM(net_ucret),' ','')
				,PATINDEX('%[0-9]%',REPLACE(TRIM(net_ucret),' ',''))
				,PATINDEX('%[^0-9]%',REPLACE(TRIM(net_ucret),' ',''))-1
		               )
			, ',' ,'.'
					  )
		 AS FLOAT ) * 1000
	ELSE TRY_CAST(TRIM(net_ucret) AS FLOAT)

END AS net_salary      
 ,CASE 
	WHEN TRIM([adayin_lokasyonu_il_ilce]) LIKE '%İst.%'
	THEN REPLACE(TRIM([adayin_lokasyonu_il_ilce]),'İst.','İstanbul')
	ELSE TRIM([adayin_lokasyonu_il_ilce])
END AS [location]      
,CASE
	WHEN TRIM(ingilizce_e_h) LIKE '%A1%'
		OR TRIM(ingilizce_e_h) LIKE '%Başlangıç%' 
		OR TRIM(ingilizce_e_h) LIKE '%Düşük%'  THEN 'A1'
	WHEN TRIM(ingilizce_e_h) LIKE '%A2%' 
		OR TRIM(ingilizce_e_h) LIKE '%Temel%' THEN 'A2'
	WHEN TRIM(ingilizce_e_h) LIKE '%B1%'
	    OR TRIM(ingilizce_e_h) LIKE '%B[ ]1%'
		OR TRIM(ingilizce_e_h) LIKE '%orta%' 
		OR TRIM(ingilizce_e_h) LIKE '%orta seviye%'
		OR TRIM(ingilizce_e_h) LIKE 'Intermediate%' 
		OR TRIM(ingilizce_e_h) LIKE 'Mid%' 
		OR TRIM(ingilizce_e_h) LIKE '%Profesyonel%' 
		OR TRIM(ingilizce_e_h) LIKE '%Tekn%' THEN 'B1'
	WHEN TRIM(ingilizce_e_h) LIKE '%B2%' 
		OR TRIM(ingilizce_e_h) LIKE '%iyi%'   
		OR TRIM(ingilizce_e_h) LIKE '%Tekn% +%' 
		OR TRIM(ingilizce_e_h) LIKE 'Upper %[İI]%ntermediate' THEN 'B2'
	WHEN TRIM(ingilizce_e_h) LIKE '%C1%' 
	OR TRIM(ingilizce_e_h) LIKE '%Aktif%' 
	OR TRIM(ingilizce_e_h) LIKE '%Akıcı%' 
	OR TRIM(ingilizce_e_h) LIKE '%Adv[ae]nced%' 
	OR TRIM(ingilizce_e_h) LIKE '%İleri%' THEN 'C1'
	WHEN TRIM(ingilizce_e_h) LIKE '%C2%' 
	OR TRIM(ingilizce_e_h) LIKE '%Anadil%' THEN 'C2'
	ELSE NULL
END AS english_level      
,TRIM([recruiter]) AS recruiter
,CASE 
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Li%' THEN 'Linkedin'
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Ka%' THEN 'Kariyer.net'
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Re%'
		OR TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) = 'Aday yönlendirmesi' 
		OR TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) = 'İnfolojik'  THEN 'Referans'
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Veri%'
		OR TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) = 'Eski Aday' THEN 'Veritabanı'
	WHEN TRIM(ulasilan_kaynak_linkedin_kariyer_veritabani_vb) LIKE '%Baş%' THEN 'Başvuru'
	ELSE 'n/a'
END AS [source]      
,CASE
	WHEN TRIM(mulakat_yontemi_online_telefon) LIKE '%Tel%' THEN  'Telefon'
	WHEN TRIM(mulakat_yontemi_online_telefon) LIKE '%Onl%' 
		OR TRIM(mulakat_yontemi_online_telefon) = 'Onilne'	THEN 'Online'
	ELSE 'n/a'
END AS interview_method       
,TRIM([kategori]) AS elimination_reason
,TRIM([teklif_red_kategorisi]) AS offer_reject_reason
,CASE
	WHEN TRIM(linkedin) LIKE '%linkedin%' THEN  TRIM(linkedin)
	ELSE 'n/a'
END AS linkedin_url
  FROM [TechnoHR].[ods].[et_aday_raporu]
GO

TRUNCATE TABLE stg.application_history;

;WITH AllApplications AS
(
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date     
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
	WHEN hr = 'Gizem' THEN 'Gizem Afacan'
	WHEN hr = 'Elif' THEN 'Elif Day'
	WHEN hr LIKE 'Tuna%' THEN 'Tunahan'
	WHEN hr = 'özge' OR hr = 'öZGE'  THEN 'Özge'
	WHEN hr = 'sibel'  THEN 'Sibel'
	ELSE hr
	END AS recruiter
    ,CASE
        WHEN musteri IS NULL OR musteri LIKE '%Genel%' THEN 'n/a'
        WHEN musteri LIKE 'Logo%' THEN 'Logo Yazılım'
        WHEN musteri LIKE 'Vava%' THEN 'VavaCars'
        WHEN musteri LIKE 'Mobillium%' THEN 'Mobillium'
        WHEN musteri LIKE 'P[iıIİ][aA]%' THEN 'PiA'
        ELSE musteri
    END AS customer
    ,CASE
	    WHEN pozisyon IS NULL THEN 'n/a'
	    WHEN pozisyon LIKE '%Scrum%' OR pozisyon LIKE '%Agile%' THEN 'Agile/Scrum Master'
	    WHEN pozisyon LIKE '%Kanban%'  THEN 'Kanban Master'
	    ELSE pozisyon
    END AS title
FROM [TechnoHR].[ods].[et_agilescrumkanban]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date    
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE 
	WHEN hr = 'özge' OR hr = 'öZGE' THEN 'Özge'
	ELSE hr
	END AS recruiter
    ,[musteri] AS customer   
	,'Artificial Intelligence Director' AS title
 FROM [TechnoHR].[ods].[et_ai]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date    
    ,UPPER(ad_soyad) AS candidate_full_name
    ,hr AS recruiter          
    ,[musteri] AS customer
    ,CASE
         WHEN lokasyon = 'Lead API Architect-Ereteam' OR  lokasyon IS NULL THEN 'API Management Specialist'
         WHEN lokasyon = 'Software Architect-Java' THEN 'Software Architect'
     END AS title
  FROM [TechnoHR].[ods].[et_api_management]
UNION ALL
SELECT  
    TRY_CONVERT(DATE,[tarih],103) AS application_date    
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
	WHEN hr = 'Elif' THEN 'Elif Day'
	ELSE hr
	END AS recruiter
    ,[musteri] AS customer
    ,'Software Developer' AS title
FROM [TechnoHR].[ods].[et_application_dev]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date    
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
         WHEN hr = 'AKIN' THEN 'Akın'
         WHEN hr = 'Deniz K.' THEN 'Deniz Karsel'
         WHEN hr = 'Elif' THEN 'Elif Day'
         WHEN hr = 'Gizem' THEN 'Gizem Afacan'
         WHEN hr = 'HATİCE Ş.' THEN 'Hatice'
         WHEN hr = 'Sbel' THEN 'Sibel'
         WHEN hr = 'Yasemin H.' THEN 'Yasemin Hepyaşar'
         ELSE hr
     END AS recruiter
    ,CASE
	     WHEN musteri LIKE '%Etiya%' THEN 'Etiya'
	     WHEN musteri LIKE '%Fimple%' THEN 'Fimple'
	     WHEN musteri LIKE '%Optiim%' THEN 'Optiim'
	     WHEN musteri LIKE 'P[iıIİ][aA]%' THEN 'PiA'
	     WHEN musteri = 'Enerjisa' THEN 'EnerjiSA'
	     WHEN musteri = 'ıd3' THEN 'ID3'
	     WHEN musteri IS NULL OR musteri = 'Genel' OR musteri = 'Software Architect' THEN 'n/a'
	     ELSE musteri
     END AS customer
    ,CASE
         WHEN lokasyon LIKE '%Software%'
           OR musteri LIKE '%Software%' THEN 'Software Architect'
         WHEN lokasyon LIKE '%Çözüm%'
           OR lokasyon LIKE '%Solution%' 
           OR musteri LIKE '%Çözüm%' 
           OR musteri LIKE '%Solution%' THEN 'Solution Architect'
         ELSE 'Software Architect'
     END AS title
FROM [TechnoHR].[ods].[et_architect]
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date    
    ,UPPER(ad_soyad) AS candidate_full_name
	,CASE 
		 WHEN hr ='Gizem' THEN 'Gizem Afacan'
		 ELSE hr
	 END AS recruiter
	,CASE 
		 WHEN musteri LIKE '%Gantek%' THEN 'Gantek'
		 ELSE musteri
	 END AS customer
	,'Asset & Configuration Manager' AS title
FROM [TechnoHR].[ods].[et_asset_ve_konfigurasyon]
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date    
    ,UPPER(ad_soyad) AS candidate_full_name
	,CASE 
		 WHEN hr ='Gizem' THEN 'Gizem Afacan'
		 WHEN hr ='sibel' THEN 'Sibel'

		 ELSE hr
	 END AS recruiter
	,CASE 
		 WHEN musteri IS NULL THEN 'n/a'
		 WHEN musteri ='Enerjisa-Eşarj' THEN 'Eşarj'
		 ELSE musteri
	 END AS customer
	 ,CASE 
		 WHEN pozisyon ='AWS Network Architect & Admin' THEN 'System & Network Team Lead'
		 ELSE 'n/a' 
	 END AS title
FROM [TechnoHR].[ods].[et_aws_network]
UNION ALL
SELECT
	TRY_CONVERT(DATE,[tarih],103) AS application_date    
    ,UPPER(TRIM(ad_soyad)) AS candidate_full_name
	,CASE 
		 WHEN TRIM(hr) = '?' OR TRIM(hr) = 'Gidilmesin' THEN 'n/a'
		 WHEN TRIM(hr) = 'ege' THEN 'Ege'
		 WHEN TRIM(hr) = 'Elif' THEN 'Elif Day'
		 WHEN TRIM(hr) = 'AKIN' THEN 'Akın'
		 WHEN TRIM(hr) = 'Deniz K.' THEN 'Deniz Karsel'
		 WHEN TRIM(hr) = 'ECE' THEN 'Ece'
		 WHEN TRIM(hr) = 'selin' THEN 'Selin'
		 WHEN TRIM(hr) LIKE 'Şevval%' THEN 'Şevval Nur'
		 WHEN TRIM(hr) LIKE 'Hayra%' THEN 'Hayra'
		 WHEN TRIM(hr) LIKE 'Tanay%' THEN 'Özge Tanay'
		 WHEN TRIM(hr) LIKE 'Yasemin H%' THEN 'Yasemin Hepyaşar'
		 WHEN TRIM(hr) = 'HATİCE Ş.' THEN 'Hatice'
		 WHEN TRIM(hr) = 'Sbel' OR TRIM(hr) = 'sibel' OR TRIM(hr) LIKE 'Sibel%' THEN 'Sibel'
		 WHEN TRIM(hr) = 'MK' THEN 'Meral'
		 WHEN TRIM(hr) = 'Tuğba Nur' THEN 'Tuğba'
		 WHEN hr = 'EMRE' THEN 'Emre'
		 WHEN TRIM(hr) = 'özge' THEN 'Özge'
		 WHEN TRIM(hr) ='Gizem' THEN 'Gizem Afacan'
		 WHEN TRIM(hr) LIKE 'Zeynep%' THEN 'Zeynep'
	ELSE TRIM(hr)
	 END AS recruiter	
	 ,CASE 
		 WHEN TRIM(musteri_pozisyon) LIKE '%loj_k%' 
			OR TRIM(musteri_pozisyon) LIKE 'İnfolojilk%'  
			OR TRIM(musteri_pozisyon) LIKE 'İnfojik%' 
			OR TRIM(musteri_pozisyon) LIKE 'Infoljık%' 
		  THEN 'İnfolojik'
		 WHEN TRIM(musteri_pozisyon) LIKE '_ntellica%' THEN 'Intellica'
		 WHEN TRIM(musteri_pozisyon) LIKE 'Dama%' THEN 'Damalink'
		 WHEN TRIM(musteri_pozisyon) LIKE 'Ereteam%' 
		   OR TRIM(musteri_pozisyon) LIKE 'Eereteam%' 
		   OR TRIM(musteri_pozisyon) LIKE 'Erateam%' 
		   OR TRIM(musteri_pozisyon) LIKE 'Eretam%' 
		   OR TRIM(musteri_pozisyon) LIKE 'Eretem%'  THEN 'Ereteam'
		 WHEN TRIM(musteri_pozisyon) LIKE 'Fimple%' THEN 'Fimple'
		 WHEN TRIM(musteri_pozisyon) LIKE 'Genel%' 
		   OR TRIM(musteri_pozisyon) IS NULL  
		   OR TRIM(musteri_pozisyon) ='?' THEN 'n/a' 
		 WHEN TRIM(musteri_pozisyon) LIKE 'Inspire%' THEN 'InspireIT'
		 WHEN TRIM(musteri_pozisyon) LIKE '_ntel%' 
		   OR TRIM(musteri_pozisyon) LIKE 'Inttellica%'
		   OR TRIM(musteri_pozisyon) LIKE 'İntelllica%' 
		   OR TRIM(musteri_pozisyon) LIKE 'İnttellica%' THEN 'Intellica'
		 WHEN TRIM(musteri_pozisyon) LIKE 'Kafein%' THEN 'Kafein'
		 WHEN TRIM(musteri_pozisyon) LIKE 'MDS%' THEN 'MDS ap Tech'
		 WHEN TRIM(musteri_pozisyon) LIKE 'Metric%' THEN 'Metric Yazılım'
		 WHEN TRIM(musteri_pozisyon) LIKE 'Neowise%' THEN 'Neowise'
		 WHEN TRIM(musteri_pozisyon) LIKE 'Opti%' THEN 'Optiim'
		 WHEN TRIM(musteri_pozisyon) LIKE 'P[iıIİ][aA]%' THEN 'PiA'		 
		 WHEN TRIM(musteri_pozisyon) LIKE 'Sanko%' THEN 'SANKO Holding'
		 WHEN TRIM(musteri_pozisyon) LIKE 'Tatil%' THEN 'TatilBudur'
		 WHEN TRIM(musteri_pozisyon) LIKE 'TAV%' THEN 'TAV Technologies'
		 ELSE TRIM(musteri_pozisyon)
	 END AS customer 
	 ,'BI/DWH Consultant' AS title
FROM [TechnoHR].[ods].[et_bietl]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(aday_ad_soyad) AS candidate_full_name
    ,CASE
        WHEN hr = 'Gizem' THEN 'Gizem Afacan'
        WHEN hr = 'AKIN' THEN 'Akın'
        WHEN hr = 'Elif' THEN 'Elif Day'
        WHEN hr = 'Tuna' THEN 'Tunahan'
        WHEN hr = 'Sbel' THEN 'Sibel'
        WHEN hr = 'Tuğba Nur' THEN 'Tuğba'
        WHEN hr = 'özge' THEN 'Özge'
        ELSE hr
    END AS recruiter
    ,CASE
        WHEN musteri IS NULL OR musteri LIKE '%Genel%' THEN 'n/a'
        WHEN musteri LIKE 'Databoss%' THEN 'DataBoss'
        WHEN musteri LIKE 'Eye%' THEN 'EYE Teknoloji'
        WHEN musteri LIKE 'Gantek%' THEN 'Gantek'
        WHEN musteri LIKE 'Mobiliz%' THEN 'Mobiliz'
        WHEN musteri LIKE 'Vava%' THEN 'VavaCars'
        ELSE musteri
    END AS customer     
     ,'Big Data Engineer' AS title
FROM [TechnoHR].[ods].[et_big_data]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
        WHEN hr = 'Deniz K.' THEN 'Deniz Karsel'
        WHEN hr = 'Elif' THEN 'Elif Day'
        WHEN hr = 'gizem' THEN 'Gizem Afacan'
        WHEN hr LIKE 'Tuğba%' THEN 'Tuğba'
        WHEN hr = 'yasemin' THEN 'Yasemin'
        WHEN hr = 'özlem' THEN 'Özlem'
        ELSE hr
    END AS recruiter
    ,CASE
        WHEN musteri LIKE 'netaş%' THEN 'NETAŞ'
    END AS customer
	,'Java Developer' AS title
FROM [TechnoHR].[ods].[et_bugfix]
UNION ALL
SELECT  
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
        WHEN hr = 'TUNA' THEN 'Tunahan'
    END AS recruiter    
    ,'NETAŞ' AS customer
    ,'Mainframe Developer' AS title
FROM [TechnoHR].[ods].[et_cobol]
UNION ALL
SELECT
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
        WHEN hr = 'Elif' THEN 'Elif Day'
        WHEN hr = 'Gizem' THEN 'Gizem Afacan'
        WHEN hr LIKE 'Şevval%' THEN 'Şevval Nur'
        WHEN hr LIKE 'Tuğba%' THEN 'Tuğba'
        WHEN hr LIKE 'Zeynep%' THEN 'Zeynep'
        ELSE hr
    END AS recruiter	
    ,CASE
        WHEN musteri LIKE 'Odeon%' THEN 'Odeon'
        WHEN musteri LIKE 'Ta%' THEN 'TatilBudur'
    END AS customer
	,'CRM Specialist' AS title
FROM [TechnoHR].[ods].[et_crm]
UNION ALL
SELECT 
     TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
	    WHEN hr = 'DENİZ' THEN 'Deniz'
	    WHEN hr = 'DENİZ K.' THEN 'Deniz Karsel'
	    WHEN hr = 'Gizem' THEN 'Gizem Afacan'
	    WHEN hr = 'TUNA' THEN 'Tunahan'
	    ELSE hr
     END AS recruiter
    ,CASE
	    WHEN musteri = 'EVAM' THEN 'Evam'
	    ELSE musteri
     END AS customer    
	,CASE
		WHEN musteri = 'Fimple' THEN 'Customer Success Manager'
		WHEN pozisyon LIKE '%Application Support Engineer' THEN 'Application Support Engineer'
		WHEN pozisyon LIKE '%Solution%' THEN 'Solution Engineer'
		ELSE 'n/a'
	END AS title
FROM [TechnoHR].[ods].[et_customer_success]
UNION ALL
SELECT 
     TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,COALESCE(UPPER(ad_soyad),'n/a') AS candidate_full_name
    ,CASE
	    WHEN hr = 'AKIN' THEN 'Akın'
	    WHEN hr LIKE  'Buse%' THEN 'Buse'
	    WHEN hr = 'Elif' THEN 'Elif Day'
	    WHEN hr = 'Gizem' THEN 'Gizem Afacan'
	    WHEN hr = 'Gizem D.' THEN 'Gizem Dilara'
	    WHEN hr = 'özge' THEN 'Özge'
	    WHEN hr IS NULL THEN 'n/a'
	    ELSE hr
     END AS recruiter      
	,CASE
	    WHEN musteri LIKE 'BuinSoft%' THEN 'Buinsoft'
	    WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
	    WHEN musteri LIKE 'Invent%' THEN 'Invent Analytics'
	    WHEN musteri LIKE 'Ithinka%' THEN 'Ithinka'
	    WHEN musteri LIKE 'Optiim%' THEN 'Optiim'
	    ELSE musteri
     END AS customer          
    ,'Data Scientist' AS title
FROM [TechnoHR].[ods].[et_data_scientist]
UNION ALL
SELECT 
     TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(TRIM(ad_soyad)) AS candidate_full_name      
,CASE
	WHEN TRIM(hr) = 'AKIN' THEN 'Akın'
	WHEN TRIM(hr) LIKE 'Asena%' THEN 'Asena'
	WHEN TRIM(hr) = 'Deniz K.' THEN 'Deniz Karsel'
	WHEN TRIM(hr) LIKE 'Deniz%' THEN 'Deniz'
	WHEN TRIM(hr) = 'Elif' THEN 'Elif Day'
	WHEN TRIM(hr) LIKE 'Fatma%' THEN 'Fatma'
	WHEN TRIM(hr) = 'Gizem' THEN 'Gizem Afacan'
	WHEN TRIM(hr) LIKE 'Hilal%' THEN 'Hilal'
	WHEN TRIM(hr) LIKE 'Meral%' OR TRIM(hr) = 'MK' THEN 'Meral'
	WHEN TRIM(hr) LIKE 'Onur%' THEN 'Onur'
	WHEN TRIM(hr) = 'Sbel' OR TRIM(hr) = 'Siibel' THEN 'Sibel'
	WHEN TRIM(hr) LIKE 'Sema%' THEN 'Semanur'
	WHEN TRIM(hr) LIKE 'Sibel%' THEN 'Sibel'
	WHEN TRIM(hr) LIKE 'Şevval%' THEN 'Şevval Nur'
	WHEN TRIM(hr) LIKE 'Tuğba%' THEN 'Tuğba'
	WHEN TRIM(hr) = 'TUNA' THEN 'Tunahan'
	WHEN TRIM(hr) = 'yasemin' THEN 'Yasemin'
	WHEN TRIM(hr) LIKE 'Yasemin%' THEN 'Yasemin Hepyaşar'
	WHEN TRIM(hr) = 'ÖZGE' THEN 'Özge'
	ELSE TRIM(hr)
 END AS recruiter      
,CASE
	    WHEN musteri LIKE 'Gante%' OR musteri = 'Opensource' THEN 'Gantek'
	    WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
	    ELSE musteri
     END AS customer      
	 ,'DBA' AS title
FROM [TechnoHR].[ods].[et_dba]
UNION ALL
SELECT 
     TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,COALESCE(UPPER(ad_soyad),'n/a') AS candidate_full_name        
,CASE
	 WHEN hr IS NULL OR hr = 'Genel' THEN 'n/a'
	 WHEN hr = 'AKIN' THEN 'Akın'
	 WHEN hr LIKE 'Begüm%' THEN 'Begüm'
	 WHEN hr = 'buğra' THEN 'Buğra'
	 WHEN hr LIKE 'Buse%' THEN 'Buse'
	 WHEN hr LIKE 'Deniz%' THEN 'Deniz'
	 WHEN hr = 'Elif' THEN 'Elif Day'
	 WHEN hr LIKE 'EMRE%' THEN 'Emre'
	 WHEN hr = 'Gizem' THEN 'Gizem Afacan'
	 WHEN hr LIKE 'Hanife%' THEN 'Hanife'
	 WHEN hr LIKE 'Hayra%' THEN 'Hayra'
	 WHEN hr LIKE 'Hilal%' THEN 'Hilal'
	 WHEN hr = 'Özge T.' OR hr = 'Tanay' THEN 'Özge Tanay'
	 WHEN hr = 'Sbel' THEN 'Sibel'
	 WHEN hr LIKE 'Sedef%' THEN 'Sedef'
	 WHEN hr LIKE 'Sema%' THEN 'Semanur'
	 WHEN hr LIKE 'Sibel%' THEN 'Sibel'
	 WHEN hr LIKE 'Şevval%' THEN 'Şevval Nur'
	 WHEN hr = 'TUNA' THEN 'Tunahan'
	 WHEN hr = 'Yasemin H.' THEN 'Yasemin Hepyaşar'
	 WHEN hr = 'Zeynep Oktay' THEN 'Zeynep'
	 WHEN hr = 'özge' THEN 'Özge'
	 WHEN hr = 'selin' THEN 'Selin'
	 ELSE hr
 END AS recruiter      
,CASE
	WHEN TRIM(musteri) IS NULL 
		OR TRIM(musteri) = 'Genel' 
		OR TRIM(musteri) = 'Başvuru' 
		OR TRIM(musteri) = 'Referans' THEN 'n/a'
	WHEN TRIM(musteri) = 'buinsoft' THEN 'Buinsoft'
	WHEN TRIM(musteri) LIKE 'Creentech%' THEN 'Creentech'
	WHEN TRIM(musteri) LIKE 'Codexist%' THEN 'Codexist Bilişim'
	WHEN TRIM(musteri) LIKE 'Data%' THEN 'DataBoss'
	WHEN TRIM(musteri) LIKE 'Etiya%' THEN 'Etiya'
	WHEN TRIM(musteri) LIKE 'Gante%' THEN 'Gantek'
	WHEN TRIM(musteri) LIKE 'ID3%' THEN 'ID3'
	WHEN TRIM(musteri) = 'Ihinka' THEN 'Ithinka'
	WHEN TRIM(musteri) LIKE 'Ithinka%' THEN 'Ithinka'
	WHEN TRIM(musteri) LIKE 'Intellica%' THEN 'Intellica'
	WHEN TRIM(musteri) LIKE 'İdeasoft%' THEN 'Ideasoft'
	WHEN TRIM(musteri) LIKE '[İI]ntel%' THEN 'Intellica'
	WHEN TRIM(musteri) LIKE 'Kafein%' THEN 'Kafein'
	WHEN TRIM(musteri) LIKE 'Logo%' THEN 'Logo Yazılım'
	WHEN TRIM(musteri) LIKE 'Optiim%' THEN 'Optiim'
	WHEN TRIM(musteri) LIKE 'P[iıIİ][aA]%' THEN 'PiA'
	WHEN TRIM(musteri) LIKE 'Snap%' 
		OR TRIM(musteri) = 'Snaypbytes'  THEN 'Snapbytes'
	WHEN TRIM(musteri) LIKE 'Tatil%' THEN 'TatilBudur'
	WHEN TRIM(musteri) LIKE 'TAV%' THEN 'TAV Technologies'
	WHEN TRIM(musteri) = 'Türib-ID3' THEN 'ID3'
	WHEN TRIM(musteri) LIKE 'VavaCars%' THEN 'VavaCars'
	ELSE TRIM(musteri)
     END AS customer       
     ,'DevOps Engineer' AS title
FROM [TechnoHR].[ods].[et_devops]
UNION ALL
SELECT 
     TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
	     WHEN hr = 'Elif' THEN 'Elif Day'
	     WHEN hr = 'Gizem' THEN 'Gizem Afacan'
	     ELSE hr
     END AS recruiter
     ,CASE
	     WHEN musteri LIKE '%ASİS%' THEN 'Asis Otomasyon'
	     ELSE musteri
     END AS customer 
    ,'Hardware Design Engineer' AS title
FROM [TechnoHR].[ods].[et_donanim_tasarim]
UNION ALL
SELECT 
     TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name      
    ,CASE
	     WHEN hr = 'Elif' THEN 'Elif Day'
	     WHEN hr = 'Gizem' THEN 'Gizem Afacan'
	     ELSE hr
     END AS recruiter      
      ,CASE
	     WHEN musteri LIKE '%MDS%' THEN 'MDS ap Tech'
	     ELSE musteri
     END AS customer 
     ,'Financial Risk Advisory' AS title
FROM [TechnoHR].[ods].[et_finansal_risk_yonetimi]
UNION ALL
SELECT 
TRY_CONVERT(DATE,[tarih],103) AS application_date            
,UPPER(ad_soyad) AS candidate_full_name       
,CASE
	     WHEN hr = 'Elif' THEN 'Elif Day'
	     WHEN hr = 'Gizem' THEN 'Gizem Afacan'
	     WHEN hr LIKE 'Yasemin H%' THEN 'Yasemin Hepyaşar'
	     ELSE hr
END AS recruiter    
    ,'Ereteam' AS customer    
    ,'TM1 Consultant' AS title
FROM [TechnoHR].[ods].[et_fpmtm1consultant]
UNION ALL
SELECT 
  TRY_CONVERT(DATE,[tarih],103) AS application_date            
 ,UPPER(TRIM(ad_soyad)) AS candidate_full_name  
 ,CASE
	WHEN TRIM(hr) = 'bensu simge' THEN 'Bensu Simge'
	WHEN TRIM(hr) = 'Deniz K.' THEN 'Deniz Karsel'
	WHEN TRIM(hr) = 'Elif' THEN 'Elif Day'
	WHEN TRIM(hr) = 'Gizem' THEN 'Gizem Afacan'
	WHEN TRIM(hr) = 'HATİCE Ş.' THEN 'Hatice'
	WHEN TRIM(hr) = 'okan' THEN 'Okan'
	WHEN TRIM(hr) LIKE 'Onur%' THEN 'Onur'
	WHEN TRIM(hr) LIKE 'Sibel%' THEN 'Sibel'
	WHEN TRIM(hr) = 'Tanay' THEN 'Özge Tanay'
	WHEN TRIM(hr) = 'Tuğba Nur' THEN 'Tuğba'
	WHEN TRIM(hr) = 'selin' THEN 'Selin'
	WHEN TRIM(hr) = 'TUNA' THEN 'Tunahan'
	WHEN TRIM(hr) LIKE 'Yasemin H%' THEN 'Yasemin Hepyaşar'
	WHEN TRIM(hr) LIKE 'Zeynep%' THEN 'Zeynep'
	WHEN TRIM(hr) = 'PiA' THEN 'n/a'
	WHEN TRIM(hr) = 'ege' THEN 'Ege'
	WHEN TRIM(hr) = 'ECE' THEN 'Ece'
	ELSE TRIM(hr) 
  END AS recruiter   
  ,CASE
	WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
	WHEN musteri LIKE 'ID3%' THEN 'ID3'
	WHEN musteri LIKE 'Ith[iı]nka%' OR musteri LIKE 'THY%' THEN 'Ithinka'
	WHEN musteri LIKE 'Optiim%' THEN 'Optiim'
	ELSE musteri
  END AS customer       
,CASE 
	WHEN tool  LIKE '%React%' THEN 'React Developer'
	ELSE 'Frontend Developer'
END AS title
FROM [TechnoHR].[ods].[et_frontend]
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(ad_soyad) AS candidate_full_name      
	,[hr] AS recruiter
	,CASE
		WHEN musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Mobiliz%' THEN 'Mobiliz'
		ELSE musteri
	END AS customer 
	,'Go Developer' AS title
FROM [TechnoHR].[ods].[et_go]
UNION ALL
SELECT 
TRY_CONVERT(DATE,[tarih],103) AS application_date            
,UPPER(TRIM(ad_soyad)) AS candidate_full_name
 ,CASE
	WHEN hr = 'Elif' THEN 'Elif Day'
	WHEN hr = 'Gizem' THEN 'Gizem Afacan'
	WHEN hr LIKE 'Sibel%' THEN 'Sibel'
	ELSE hr
END AS recruiter    
,CASE
	WHEN musteri LIKE '%Asis' THEN 'Asis Otomasyon'
	ELSE musteri
END AS customer 
,'Embedded Software Engineer' AS title
FROM [TechnoHR].[ods].[et_gomulu_embedded]
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(TRIM(ad_soyad)) AS candidate_full_name
	,[hr] AS recruiter
	,CASE
			WHEN musteri LIKE '%TAV%' THEN 'TAV Technologies'
			ELSE musteri
		END AS customer	
		,'IT Help Desk Manager' AS title
FROM [TechnoHR].[ods].[et_help_desk]
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,ISNULL(UPPER(TRIM(ad_soyad)),'n/a') AS candidate_full_name	
	,CASE
		WHEN hr = 'özge' THEN 'Özge'
		WHEN hr IS NULL  THEN 'n/a'
		ELSE hr
	END AS recruiter  	
	,COALESCE([musteri],'n/a') AS customer
	,'IaaS Admin' AS title
FROM [TechnoHR].[ods].[et_iaas]
UNION ALL
SELECT
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(TRIM(ad_soyad)) AS candidate_full_name	
    ,[hr] AS recruiter
    ,[musteri] AS customer
    ,'IBM BPM Specialist' AS title
FROM [TechnoHR].[ods].[et_ibm_bpm]
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,ISNULL(UPPER(ad_soyad),'n/a') AS candidate_full_name	
	,CASE
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr = 'DENİZ' THEN 'Deniz'
		WHEN hr IS NULL THEN 'n/a'
		ELSE hr
	END AS recruiter 	
	,CASE
		WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Asis%' THEN 'Asis Otomasyon'
		WHEN musteri LIKE 'Data%' THEN 'DataBoss'
		WHEN musteri LIKE 'Enerji%' THEN 'EnerjiSA'
		WHEN musteri LIKE 'Gantek%' THEN 'Gantek'
		WHEN musteri LIKE '[İI]ntellica%' THEN 'Intellica'
		WHEN musteri LIKE 'MDS%' THEN 'MDS ap Tech'
		WHEN musteri LIKE 'P[iıIİ][aA]%' THEN 'PiA'
		WHEN musteri LIKE 'Vava%' THEN 'VavaCars'
		WHEN musteri LIKE 'Vekt[oö]r%' THEN 'Vektor Mobility'
		ELSE musteri
	END AS customer  
	,CASE 
    WHEN EXISTS (
        SELECT 1 
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
    THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
    ELSE 'HR Specialist'
	END AS title
FROM [TechnoHR].[ods].[et_ik] t
UNION ALL
SELECT
   	TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,CASE
		WHEN TRIM(ad_soyad) NOT LIKE '%[a-zA-Z]%' THEN 'n/a'
		ELSE UPPER(TRIM(ad_soyad))
	END AS candidate_full_name
 	,CASE
		WHEN hr LIKE 'bensu%' THEN 'Bensu Simge'
		WHEN hr = 'AKIN' THEN 'Akın'
		WHEN hr = 'buğra' THEN 'Buğra'
		WHEN hr LIKE 'Buse%' THEN 'Buse'
		WHEN hr = 'Deniz K.' THEN 'Deniz Karsel'
		WHEN hr = 'ECE' THEN 'Ece'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Eilf Mine' THEN 'Elif Mine'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr LIKE 'Onur%' THEN 'Onur'
		WHEN hr = 'Sbel' THEN 'Sibel'
		WHEN hr = 'EMRE' THEN 'Emre'
		WHEN hr LIKE 'Sena%' THEN 'Sena'
		WHEN hr = 'Tanay' THEN 'Özge Tanay'
		WHEN hr = 'TUNA' THEN 'Tunahan'
		WHEN hr = 'Yasemin H.' THEN 'Yasemin Hepyaşar'
		WHEN hr LIKE 'Zeynep%' THEN 'Zeynep'
		WHEN hr = 'özge' OR hr = 'öZGE' THEN 'Özge'
		WHEN hr = 'Sİbel' OR hr = 'sibel' THEN 'Sibel'
		ELSE hr
	END AS recruiter 		
	,CASE
		WHEN musteri IS NULL 
			OR musteri LIKE 'Genel%'
			OR musteri = 'Başvuru' THEN 'n/a'
		WHEN musteri LIKE 'Anadolu%' THEN 'Anadolu Sigorta'
		WHEN musteri LIKE 'Arvato%' THEN 'Arvato'
		WHEN musteri LIKE 'AVD%' THEN 'AVD Teknoloji'
		WHEN musteri LIKE 'Doğa%' THEN 'Doğa Sigorta'
		WHEN musteri LIKE 'Etiya%' THEN 'Etiya'
		WHEN musteri LIKE 'Eye%' THEN 'EYE Teknoloji'
		WHEN musteri LIKE 'ID3%' THEN 'ID3'
		WHEN musteri LIKE '[İI]nfoloj[iı]k%' THEN 'İnfolojik'
		WHEN musteri = 'InpireIT' THEN 'InspireIT'
		WHEN musteri LIKE '[İI]ntellica%' THEN 'Intellica'
		WHEN musteri LIKE 'Ithinka%' THEN 'Ithinka'
		WHEN musteri LIKE 'Netaş%' THEN 'NETAŞ'
		WHEN musteri LIKE 'Odeon%' THEN 'Odeon'
		WHEN musteri LIKE 'Optiim%' THEN 'Optiim'
		WHEN musteri LIKE 'Paycore%' THEN 'PayCore'
		WHEN musteri LIKE 'P[iıİI][aA]%' THEN 'PiA'
		WHEN musteri LIKE 'Sanko%' THEN 'SANKO Holding'
		WHEN musteri LIKE 'Tati%' THEN 'TatilBudur'
		WHEN musteri LIKE 'THY%' THEN 'ID3'
		WHEN musteri LIKE 'Vava%' THEN 'VavaCars'
		ELSE musteri
	END AS customer 
	,CASE 
    WHEN EXISTS (
        SELECT 1 
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
    THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
    ELSE 'Business Analyst'
	END AS title	
FROM [TechnoHR].[ods].[et_issistem_analisti] t
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(TRIM(ad_soyad)) AS candidate_full_name
 	,CASE
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr = 'Sbel' THEN 'Sibel'
		WHEN hr = 'Tanay' THEN 'Özge Tanay'
		WHEN hr LIKE 'Tuğba%' THEN 'Tuğba'
		ELSE hr
	END AS recruiter 		
 ,CASE
		WHEN musteri IS NULL OR musteri = 'Genel' OR musteri = 'Windows' THEN 'n/a'
		WHEN musteri LIKE 'Alhazen%' THEN 'Alhazen'
		WHEN musteri LIKE 'Anadolu%' OR musteri = 'Anaolu Sigorta' THEN 'Anadolu Sigorta'
		WHEN musteri LIKE 'Arvato%' THEN 'Arvato'
		WHEN musteri LIKE 'Gantek%' THEN 'Gantek'
		WHEN musteri LIKE '[Iİ]deasoft%' THEN 'Ideasoft'
		WHEN musteri LIKE 'Tatil%' THEN 'TatilBudur'
		WHEN musteri LIKE 'TAV%' THEN 'TAV Technologies'
		WHEN musteri LIKE 'Unite%' THEN 'UniteBT'
		ELSE musteri
	END AS customer  	
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
		THEN (
			SELECT TOP 1 r.title
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
		ELSE 'IT Application Administrator'
	END AS title
FROM [TechnoHR].[ods].[et_it_applicationsystem_admin]t
UNION ALL
SELECT 
     TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,COALESCE(UPPER(aday_adi_soyadi),'n/a') AS candidate_full_name
    ,CASE 
		WHEN hr IS NULL THEN 'n/a'
		WHEN hr = 'özge' OR hr = 'öZGE' THEN 'Özge'
		ELSE hr 
	END AS recruiter
    ,COALESCE(musteri,'n/a') AS customer   
	,'IT Assistant Manager' AS title
FROM [TechnoHR].[ods].[et_it_manager]
UNION ALL
SELECT 
     TRY_CONVERT(DATE,tarih,103) AS application_date            
	,UPPER(aday) AS candidate_full_name      
    ,CASE
		WHEN hr = 'özge' THEN 'Özge'
		ELSE hr
	END AS recruiter
    ,CASE
		WHEN musteri LIKE '%AVD%' THEN 'AVD Teknoloji'
		ELSE musteri
	END AS customer
    ,'IVR Analyst' AS title
FROM [TechnoHR].[ods].[et_ivr_analyst]
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(TRIM(ad_soyad)) AS candidate_full_name
    ,CASE
		WHEN TRIM(hr) LIKE '%?%' OR TRIM(hr) = 'bootcamp' OR TRIM(hr) = 'mesaj' OR TRIM(hr) = 'Tekn.' THEN 'n/a'
		WHEN TRIM(hr) = 'Afife' OR TRIM(hr) = 'Bootcamp-Afife' THEN 'Afife'
		WHEN TRIM(hr) = 'AKIN' THEN 'Akın'
		WHEN TRIM(hr) = 'bensu simge' THEN 'Bensu Simge'
		WHEN TRIM(hr) LIKE 'Emre%' OR TRIM(hr) = 'bootcamp-emre' THEN 'Emre'
		WHEN TRIM(hr) LIKE 'Zeynep%' OR TRIM(hr) = 'Bootcamp-zeynep' THEN 'Zeynep'
		WHEN TRIM(hr) = 'buğra' THEN 'Buğra'
		WHEN TRIM(hr) = 'Deniz K.' THEN 'Deniz Karsel'
		WHEN TRIM(hr) LIKE 'Deniz%' THEN 'Deniz'
		WHEN TRIM(hr) LIKE 'Ebru%' THEN 'Ebru'
		WHEN TRIM(hr) = 'EGE' THEN 'Ege'
		WHEN TRIM(hr) = 'Elif' THEN 'Elif Day'
		WHEN TRIM(hr) LIKE 'Furkan%' THEN 'Furkan'
		WHEN TRIM(hr) = 'GAMZE' THEN 'Gamze'
		WHEN TRIM(hr) = 'Gizem' OR TRIM(hr) LIKE 'Gizem%' THEN 'Gizem Afacan'
		WHEN TRIM(hr) = 'HATİCE Ş.' THEN 'Hatice'
		WHEN TRIM(hr) LIKE 'Hilal%' THEN 'Hilal'
		WHEN TRIM(hr) = 'KAAN' THEN 'Kaan'
		WHEN TRIM(hr) = 'özlem' THEN 'Özlem'
		WHEN TRIM(hr) LIKE 'Meral%' OR TRIM(hr) LIKE 'MK%' THEN 'Meral'
		WHEN TRIM(hr) LIKE 'Nisan%' THEN 'Nisan'
		WHEN TRIM(hr) LIKE 'Onur%' THEN 'Onur'
		WHEN TRIM(hr) LIKE 'Özge%' OR TRIM(hr) = 'Özgre' THEN 'Özge'
		WHEN TRIM(hr) LIKE 'Sibel%' OR TRIM(hr) = 'Sbel' THEN 'Sibel'
		WHEN TRIM(hr) LIKE 'H[aA]nife%' THEN 'Hanife'
		WHEN TRIM(hr) LIKE 'Selin%' THEN 'Selin'
		WHEN TRIM(hr) LIKE 'Sema%' THEN 'Semanur'
		WHEN TRIM(hr) LIKE 'Tanay%' THEN 'Özge Tanay'
		WHEN TRIM(hr) LIKE 'Tuğba%' THEN 'Tuğba'
		WHEN TRIM(hr) = 'TUNA' THEN 'Tunahan'		
		WHEN TRIM(hr) = 'yasemin' THEN 'Yasemin'
		WHEN TRIM(hr) LIKE 'Yasemin H%' OR TRIM(hr) = 'YaseminH.' OR TRIM(hr) = 'Yassemin H.'  THEN 'Yasemin Hepyaşar'
		ELSE TRIM(hr)
	END recruiter
    ,CASE
		WHEN TRIM(musteri) IS NULL 
			OR TRIM(musteri) = '?'  OR TRIM(musteri) = '-' 
			OR TRIM(musteri) = 'Başvuru'  OR TRIM(musteri) LIKE 'Genel%' 
			OR TRIM(musteri) LIKE '%Java%' OR TRIM(musteri) LIKE '%rapor%' 
			OR TRIM(musteri) LIKE '%referans%' OR TRIM(musteri) = 'Sibel' THEN 'n/a'
		WHEN TRIM(musteri) LIKE 'A[nd]adolu%' OR TRIM(musteri) = 'Anandolu Sigorta' THEN 'Anadolu Sigorta'
		WHEN TRIM(musteri) LIKE 'Aktif%' THEN 'AktifTech'
		WHEN TRIM(musteri) LIKE 'Co[ds]e%' THEN 'Codexist Bilişim'
		WHEN TRIM(musteri) LIKE 'Data%' THEN 'DataBoss'
		WHEN TRIM(musteri) LIKE 'd[iıİI]g[iıİI]lera%' THEN 'Digilera'
		WHEN TRIM(musteri) LIKE 'Etiy%' OR TRIM(musteri) LIKE 'Eiy%' THEN 'Etiya'
		WHEN TRIM(musteri) LIKE 'Evam%' THEN 'Evam'
		WHEN TRIM(musteri) LIKE 'EYE%' THEN 'EYE Teknoloji'
		WHEN TRIM(musteri) LIKE 'Gantek%' THEN 'Gantek'
		WHEN TRIM(musteri) LIKE 'ID3%' THEN 'ID3'
		WHEN TRIM(musteri) LIKE '[iıİI]nfoloj[iı]k%' THEN 'İnfolojik'
		WHEN TRIM(musteri) LIKE '[iıİI]no[mr]e[mr]a%' THEN 'Inomera'
		WHEN TRIM(musteri) LIKE '[iıİI]ntel%' THEN 'Intellica'
		WHEN TRIM(musteri) LIKE '[iıİI]th%' THEN 'Ithinka'
		WHEN TRIM(musteri) LIKE 'Kafein%' THEN 'Kafein'
		WHEN TRIM(musteri) LIKE 'MDS%' THEN 'MDS ap Tech'
		WHEN TRIM(musteri) LIKE 'Me%' THEN 'Metric Yazılım'
		WHEN TRIM(musteri) LIKE 'Mobil%' THEN 'Mobiliz'
		WHEN TRIM(musteri) LIKE 'Mobiversite%' THEN 'Mobiversite'
		WHEN TRIM(musteri) LIKE 'Neta%' THEN 'NETAŞ'
		WHEN TRIM(musteri) LIKE 'Opti%' THEN 'Optiim'
		WHEN TRIM(musteri) LIKE 'Paycore%' THEN 'PayCore'
		WHEN TRIM(musteri) LIKE 'Pera%' THEN 'Perasoft'
		WHEN TRIM(musteri) LIKE 'P[iıİI][aA]%' THEN 'PiA'
		WHEN TRIM(musteri) LIKE 'P[rt]oto%' THEN 'Proto Yazılım'
		WHEN TRIM(musteri) LIKE 'Sistek%' THEN 'Sistek'
		WHEN TRIM(musteri) LIKE 'TAV%' THEN 'TAV Technologies'
		WHEN TRIM(musteri) LIKE 'THY%' THEN 'THY'
		WHEN TRIM(musteri) LIKE 'Türib%' THEN 'TÜRİB'
		WHEN TRIM(musteri) LIKE 'Vekt[oö]r%' THEN 'Vektor Mobility'
		WHEN TRIM(musteri) LIKE 'quickstarter%' THEN 'Quickstarter'
		ELSE TRIM(musteri)
	END AS customer
 ,'Java Developer' AS title
FROM [TechnoHR].[ods].[et_java]
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,COALESCE(UPPER(ad_soyad),'n/a') AS candidate_full_name    
    ,CASE
         WHEN hr IS NULL THEN 'n/a'
         ELSE hr
     END AS recruiter    
    ,[musteri] AS customer
    ,'Automatic Door Expert' AS title
FROM [TechnoHR].[ods].[et_kapi]
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(TRIM(ad_soyad)) AS candidate_full_name
	,CASE
		WHEN hr IS NULL OR hr = 'GANTEK' THEN 'n/a'
		WHEN hr = 'AKIN' THEN 'Akın'
		WHEN hr = 'buğra' THEN 'Buğra'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr LIKE 'Funda%' THEN 'Funda'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr = 'HATİCE Ş.' THEN 'Hatice'
		WHEN hr LIKE 'Meral%' THEN 'Meral'
		WHEN hr = 'Sbel' OR hr LIKE 'Sibel%'THEN 'Sibel'
		WHEN hr = 'öZGE' THEN 'Özge'
		WHEN hr = 'TUNA' THEN 'Tunahan'
		WHEN hr = 'Yasemin H.' THEN 'Yasemin Hepyaşar'
		ELSE hr
	END AS recruiter      
		,CASE
		WHEN musteri IS NULL OR musteri = 'Başvuru' OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri = 'Alliance' THEN 'Alliance Healthcare'
		WHEN musteri LIKE 'Anadolu%' THEN 'Anadolu Sigorta'
		WHEN musteri LIKE 'Creentech%' THEN 'Creentech'
		WHEN musteri LIKE 'Enerji%' THEN 'EnerjiSA'
		WHEN musteri LIKE 'Eye%' THEN 'EYE Teknoloji'
		WHEN musteri LIKE 'Gante%' THEN 'Gantek'
		WHEN musteri LIKE '[Iİ]ntellica%' THEN 'Intellica'
		WHEN musteri LIKE 'Odeon%' THEN 'Odeon'
		WHEN musteri = 'TAV' THEN 'TAV Technologies'
		WHEN musteri = 'Unite BT' THEN 'UniteBT'
		ELSE musteri
	END AS customer
   ,CASE 
    WHEN EXISTS (
        SELECT 1 
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
    THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
 WHEN TRIM(ad_soyad) NOT LIKE '%[A-Za-z]%' THEN 'n/a'
    ELSE 'System Engineer'
	END AS title	
FROM  [TechnoHR].[ods].[et_linuxunix] t
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(ad_soyad) AS candidate_full_name       
    ,CASE
		WHEN hr = 'özge' THEN 'Özge'
		WHEN hr = 'Sİbel' THEN 'Sibel'
		ELSE hr
	END AS recruiter
    ,[musteri] AS customer
    ,'Account Manager' AS title
FROM [TechnoHR].[ods].[et_m_yoneticisi_tasindi]
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(ad_soyad) AS candidate_full_name             
    ,CASE
		WHEN hr LIKE 'Deniz%' THEN 'Deniz'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'ege' THEN 'Ege'
		WHEN hr = 'Şeyma' THEN 'Şeyma'
		WHEN hr = 'özge' THEN 'Özge'
		WHEN hr = 'Yasemin H.' THEN 'Yasemin Hepyaşar'
		ELSE hr
	 END AS recruiter
    ,CASE 
		WHEN musteri IS NULL THEN 'n/a'
		WHEN musteri LIKE 'Enerji%' THEN 'EnerjiSA'
		WHEN musteri LIKE 'EY%' THEN 'EYE Teknoloji'
		WHEN musteri LIKE 'Gantek%' THEN 'Gantek'
		ELSE musteri
	END customer
    ,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
    THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		WHEN TRIM(ad_soyad) NOT LIKE '%[A-Za-z]%' THEN 'n/a'
		ELSE 'System Engineer'
	END AS title
FROM [TechnoHR].[ods].[et_middlewareorta_katman] t
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,CASE 
		WHEN TRIM(aday_ad_soyad) IS NULL OR TRIM(aday_ad_soyad) = '?' THEN 'n/a'
		ELSE UPPER(TRIM(aday_ad_soyad))
	END candidate_full_name
	,CASE
		WHEN hr IS NULL THEN 'n/a'
		WHEN hr = 'Deniz K.' THEN 'Deniz Karsel'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr LIKE 'Hila%' THEN 'Hilal'
		WHEN hr LIKE 'Meral%' THEN 'Meral'
		WHEN hr = 'Sbel' OR hr = 'Sİbel' THEN 'Sibel'
		WHEN hr = 'selin' THEN 'Selin'
		WHEN hr LIKE 'Şevval%' OR hr LIKE 'Ş.Nur%' THEN 'Şevval Nur'
		WHEN hr LIKE 'Tuna%' THEN 'Tunahan'
		WHEN hr LIKE 'Yasemin H%' THEN 'Yasemin Hepyaşar'
		WHEN hr = 'yasemin' THEN 'Yasemin'
		WHEN hr LIKE 'Tuğba%' THEN 'Tuğba'
		WHEN hr LIKE 'Zeynep%' THEN 'Zeynep'
		WHEN hr = 'özge' THEN 'Özge'
		ELSE hr
	END AS recruiter
,CASE 
	WHEN [musteri_teknoloji] IS NULL OR [musteri_teknoloji] = 'Genel' OR [musteri_teknoloji] = 'iOS' THEN 'n/a'
	WHEN [musteri_teknoloji] LIKE '%[kK]amp[üu]s%' THEN 'Akampüs'
	WHEN [musteri_teknoloji] LIKE 'Buinsoft%' THEN 'Buinsoft'
	WHEN [musteri_teknoloji] LIKE 'EYE%' THEN 'EYE Teknoloji'
	WHEN [musteri_teknoloji] LIKE 'Fair%' THEN 'Fair Teknoloji'
	WHEN [musteri_teknoloji] LIKE 'ID%' THEN 'ID3'
	WHEN [musteri_teknoloji] LIKE 'Ithinka%' THEN 'Ithinka'
	WHEN [musteri_teknoloji] LIKE 'İnfolojik%' THEN 'İnfolojik'
	WHEN [musteri_teknoloji] LIKE 'konuş%' THEN 'Konuşarak Öğren'
	WHEN [musteri_teknoloji] LIKE 'Ledbim%' THEN 'Ledbim'
	WHEN [musteri_teknoloji] LIKE 'Mobiliz%' THEN 'Mobiliz'
	WHEN [musteri_teknoloji] LIKE 'Mobiilium%' OR [musteri_teknoloji] LIKE 'Mobiliium%'
		OR [musteri_teknoloji] LIKE 'Mobilium%' OR [musteri_teknoloji] LIKE 'Mobillum%'
		OR [musteri_teknoloji] LIKE 'Mobillium%' OR [musteri_teknoloji] LIKE 'Mobilllium%' THEN 'Mobillium'
	WHEN [musteri_teknoloji] LIKE 'Mobiversite%' THEN 'Mobiversite'
	WHEN [musteri_teknoloji] LIKE 'Odeon%' OR [musteri_teknoloji] LIKE 'Oeon%' THEN 'Odeon'
	WHEN [musteri_teknoloji] LIKE 'Optiim%' THEN 'Optiim'
	WHEN [musteri_teknoloji] LIKE 'P[iıIİ][aA]%' THEN 'PiA'
	WHEN [musteri_teknoloji] LIKE 'Tatil%' THEN 'TatilBudur'
	WHEN [musteri_teknoloji] LIKE 'TAV%' THEN 'TAV Technologies'
	WHEN [musteri_teknoloji] LIKE 'THY%' THEN 'THY'
	WHEN [musteri_teknoloji] LIKE 'Vektor%' THEN 'Vektor Mobility'
	ELSE [musteri_teknoloji]
 END AS customer	
,CASE
	WHEN [alan] LIKE 'Mobile%' THEN 'Mobile Developer'
	WHEN [alan] LIKE '[ıiIİ][oO][sS]%' THEN 'iOS Developer'
	WHEN [alan] LIKE 'Andro[iI]d%' THEN 'Android Developer'
	WHEN [alan] LIKE 'React%' THEN 'React Native Developer'
	ELSE 'n/a'
END title
FROM [TechnoHR].[ods].[et_mobile_dev]
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(ad_soyad) AS candidate_full_name 	
	,CASE
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr = 'Özge Ş' THEN 'Özge'
		WHEN hr = 'Özge T.' OR hr = 'Tanay' THEN 'Özge Tanay'
		WHEN hr = 'Sİbel' THEN 'Sibel'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Ka[zi][zi]en' THEN 'Kaizen'
		WHEN musteri LIKE 'Tatil%' THEN 'TatilBudur'
		WHEN musteri LIKE 'Gante%' THEN 'Gantek'
		ELSE musteri
	END customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Finance Specialist'
	END AS title
FROM [TechnoHR].[ods].[et_muhasebe_finans] t
UNION ALL
SELECT
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,CASE
	WHEN TRIM(ad_soyad) IS NULL 
		OR TRIM(ad_soyad) = '.NET Core - Angular' 
		OR TRIM(ad_soyad) = '?' THEN 'n/a'
	ELSE UPPER(TRIM(ad_soyad))
     END AS candidate_full_name
    ,CASE
		WHEN TRIM(hr) IS NULL OR TRIM(hr) = '?' THEN 'n/a'
		WHEN TRIM(hr)  = 'EMRE' THEN 'Emre'
		WHEN TRIM(hr)  = 'ECE' THEN 'Ece'
		WHEN TRIM(hr)  = 'AKIN' THEN 'Akın'
		WHEN TRIM(hr)  LIKE 'Beyza%' THEN 'Beyza'
		WHEN TRIM(hr)  = 'buğra' THEN 'Buğra'
		WHEN TRIM(hr)  LIKE 'Burak%' THEN 'Burak'
		WHEN TRIM(hr)  LIKE 'Buse%' THEN 'Buse'
		WHEN TRIM(hr)  LIKE 'Ebru%' THEN 'Ebru'
		WHEN TRIM(hr)  = 'Elif' OR TRIM(hr) = 'Eif' THEN 'Elif Day'
		WHEN TRIM(hr)  LIKE 'Furkan%' THEN 'Furkan'
		WHEN TRIM(hr)  = 'Gizem' THEN 'Gizem Afacan'
		WHEN TRIM(hr)  = 'HATİCE Ş.' THEN 'Hatice'
		WHEN TRIM(hr)  LIKE 'Onur%' THEN 'Onur'
		WHEN TRIM(hr)  LIKE 'Özge%' OR TRIM(hr) = 'Özxge' THEN 'Özge'
		WHEN TRIM(hr)  = 'sibel' OR TRIM(hr)  = 'Sbel' THEN 'Sibel'
		WHEN TRIM(hr)  LIKE 'Sema%' THEN 'Semanur'
		WHEN TRIM(hr)  = 'TUNA' THEN 'Tunahan'
		WHEN TRIM(hr)  = 'yasemin' THEN 'Yasemin'
		WHEN TRIM(hr)  LIKE 'Yasemin H%' THEN 'Yasemin Hepyaşar'
		ELSE TRIM(hr)
	 END AS recruiter
    ,CASE 
		WHEN musteri IS NULL OR musteri = 'Başvuru'
			OR musteri LIKE 'Genel%' THEN 'n/a'
		WHEN musteri = 'Agesa' THEN 'AgeSA'
		WHEN musteri LIKE 'Arv[ao]t[ao]%' THEN 'Arvato'
		WHEN musteri LIKE 'Asis%' THEN 'Asis Otomasyon'
		WHEN musteri LIKE 'AVD%' THEN 'AVD Teknoloji'
		WHEN musteri LIKE 'cartonplast%' THEN 'Cartonplast'
		WHEN musteri LIKE 'Digilera%' THEN 'Digilera'
		WHEN musteri LIKE 'EYE%' THEN 'EYE Teknoloji'
		WHEN musteri LIKE 'Gantek%' THEN 'Gantek'
		WHEN musteri LIKE 'ID3%' THEN 'ID3'
		WHEN musteri LIKE '[İI]nfoloj[iı]k%' THEN 'İnfolojik'
		WHEN musteri LIKE 'Invent%' THEN 'Invent Analytics'
		WHEN musteri LIKE 'Ithinka%' THEN 'Ithinka'
		WHEN musteri LIKE 'Ji%' THEN 'JitterBit'
		WHEN musteri = 'Kaaizen' OR musteri LIKE 'Kaizen%' OR musteri = 'Kazien' THEN 'Kaizen'
		WHEN musteri LIKE 'Kafein%' THEN 'Kafein'
		WHEN musteri LIKE 'Kibele%' THEN 'Kibele'
		WHEN musteri LIKE 'Logo%' THEN 'Logo Yazılım'
		WHEN musteri LIKE 'Netaş%' THEN 'NETAŞ'
		WHEN musteri LIKE 'Odeon%' THEN 'Odeon'
		WHEN musteri LIKE 'Optiim%' THEN 'Optiim'
		WHEN musteri LIKE 'Pay%' THEN 'PayCore'
		WHEN musteri LIKE 'P[iıIİ][aA]%' THEN 'PiA'
		WHEN musteri LIKE 'Proto%' THEN 'Proto Yazılım'
		WHEN musteri LIKE 'Sanko%' THEN 'SANKO Holding'
		WHEN musteri LIKE 'Tatil%' THEN 'TatilBudur'
		WHEN musteri LIKE 'Tetra%' THEN 'Tetra Bilişim'
		WHEN musteri LIKE 'Unite%' THEN 'UniteBT'
		WHEN musteri LIKE 'Vava%' THEN 'VavaCars'
		ELSE musteri
	END customer
    ,'.NET Developer' AS title
FROM [TechnoHR].[ods].[et_net]
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(ad_soyad) AS candidate_full_name 
	,CASE
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'TUNA' THEN 'Tunahan'
		WHEN hr = 'özge' THEN 'Özge'

		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri IS NULL OR musteri = 'Genel 'THEN 'n/a'
		ELSE musteri
	END customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Node.js Developer'
	END AS title
FROM [TechnoHR].[ods].[et_nodejs] t
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,CASE
		WHEN TRIM(ad_soyad) IS NULL OR TRIM(ad_soyad) LIKE 'açmadı%' THEN 'n/a'
		ELSE UPPER(TRIM(ad_soyad))
	END AS candidate_full_name
    ,CASE
		WHEN hr IS NULL THEN 'n/a'
		WHEN hr = 'Hllal' THEN 'Hilal'
		WHEN hr = 'Öxge' OR hr = 'özge' OR hr = 'öZGE' THEN 'Özge'
		WHEN hr = 'Sİbel' THEN 'Sibel'
		ELSE hr
	END AS recruiter
    ,CASE 
		WHEN musteri IS NULL THEN 'n/a'
		WHEN musteri LIKE 'Data%' THEN 'DataBoss'
		ELSE musteri
	END customer
	,'Executive Assistant' AS title
FROM [TechnoHR].[ods].[et_ofis_yo_asist]
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(ad_soyad) AS candidate_full_name       
    ,[hr] AS recruiter
    ,CASE 
		WHEN musteri LIKE 'Optiim%' THEN 'Optiim'
		ELSE musteri
	END customer
	,'Object Storage Service Integration Expert' AS title
FROM [TechnoHR].[ods].[et_oss]
UNION ALL
SELECT 
	TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(aday_adi_soyadi) AS candidate_full_name   
	,[hr] AS recruiter
	,CASE 
		WHEN musteri LIKE 'Optiim%' THEN 'Optiim'
		ELSE musteri
	END customer
	,'PEGA Consultant' AS title
FROM [TechnoHR].[ods].[et_pega]
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,CASE
		WHEN ad_soyad IS NULL OR LEN(ad_soyad) < 5 THEN 'n/a'
		ELSE UPPER(ad_soyad)
	END AS candidate_full_name
	,CASE
		WHEN hr IS NULL THEN 'n/a'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri IS NULL OR musteri = '-' 
			OR musteri = 'başvuru' OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Digilera%' THEN 'Digilera'
		WHEN musteri LIKE '[İI]deasoft%' THEN 'Ideasoft'
		WHEN musteri LIKE 'Tatil%' THEN 'TatilBudur'
		ELSE musteri
	END customer
	,'PHP Developer' AS title
FROM [TechnoHR].[ods].[et_php]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,CASE
		WHEN TRIM(ad_soyad) LIKE 'Elif KARABULAK%' THEN 'ELİF KARABULAK'
		WHEN TRIM(ad_soyad) LIKE 'Ayla Günal%' THEN 'AYLA GÜNAL'
		WHEN TRIM(ad_soyad) LIKE 'Cemre Nur%' THEN 'CEMRE NUR ALAGÖZ'
		WHEN TRIM(ad_soyad) LIKE 'Cansu Betül%' THEN 'CANSU BETÜL ÖCEL'
		ELSE UPPER(TRIM(ad_soyad))
	END AS candidate_full_name
	,CASE
		WHEN hr LIKE 'Buse%' THEN 'Buse'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
		WHEN hr = 'Sibell'  OR hr = 'sİBEL' THEN 'Sibel'
		WHEN hr = 'Tuna'  THEN 'Tunahan'
		WHEN hr = 'özge'  THEN 'Özge'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri LIKE 'Genel%' THEN 'n/a'
		WHEN musteri LIKE 'Asis%' THEN 'Asis Otomasyon'
		WHEN musteri LIKE 'Data%' THEN 'DataBoss'
		WHEN musteri LIKE 'Digilera%' THEN 'Digilera'
		WHEN musteri LIKE 'Etiya%' THEN 'Etiya'
		WHEN musteri LIKE 'Eye%' THEN 'EYE Teknoloji'
		WHEN musteri LIKE 'Fimple%' THEN 'Fimple'
		WHEN musteri LIKE 'ID3%' THEN 'ID3'
		WHEN musteri LIKE '[İI]deasoft%' THEN 'Ideasoft'
		WHEN musteri LIKE '[İI]ntel%' THEN 'Intellica'
		WHEN musteri LIKE '[İI]thin%' THEN 'Ithinka'
		WHEN musteri LIKE 'MBIS%' THEN 'MBIS'
		WHEN musteri LIKE 'Mobil%' THEN 'Mobillium'
		WHEN musteri LIKE 'N[İI]SO%' THEN 'NISO'
		WHEN musteri LIKE 'Odeon%' THEN 'Odeon'
		WHEN musteri LIKE 'Optiim%' THEN 'Optiim'
		WHEN musteri LIKE 'P[iıIİ][aA]%' THEN 'PiA'
		WHEN musteri LIKE '%Vavacars%' THEN 'VavaCars'
		WHEN musteri LIKE 'Sanko%' THEN 'SANKO Holding'
		WHEN musteri LIKE 'Tatil%' THEN 'TatilBudur'
		WHEN musteri LIKE 'Vektor%' THEN 'Vektor Mobility'
		WHEN musteri LIKE 'Yıldız%' THEN 'Yıldız Tech'
		ELSE musteri
	END customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Project Manager'
	END AS title
FROM [TechnoHR].[ods].[et_pmprod_prog_portf_dig_mark] t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,UPPER(ad_soyad) AS candidate_full_name	
	,CASE
		WHEN hr LIKE 'Beril%' THEN 'Beril'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
		WHEN hr = 'HATİCE Ş.'  THEN 'Hatice'
		WHEN hr = 'Zeynep Oktay'  THEN 'Zeynep'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE '[İI]ntellica%' THEN 'Intellica'
		WHEN musteri LIKE 'Mobillium%' THEN 'Mobillium'
		WHEN musteri LIKE 'P[iıIİ][aA]%' THEN 'PiA'
		WHEN musteri LIKE 'Tatil%' THEN 'TatilBudur'
		WHEN musteri LIKE 'Vektor%' THEN 'Vektor Mobility'
		ELSE musteri
	END customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Product Designer'
	END AS title
FROM [TechnoHR].[ods].[et_product_designeruiux] t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
		WHEN hr = 'ege' THEN 'Ege'
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
		ELSE hr
	END AS recruiter
    ,CASE 
		WHEN musteri IS NULL OR musteri = 'Başvuru' THEN 'n/a'
		WHEN musteri LIKE 'Data%' THEN 'DataBoss'
		ELSE musteri
	END customer
    ,'Python Developer' AS title
FROM [TechnoHR].[ods].[et_python]
UNION ALL
SELECT
     TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
	    WHEN hr = 'Tuna'  THEN 'Tunahan'
		ELSE hr
	END AS recruiter
    ,'Kibele' AS customer
    ,'Robotic and Automation Engineer' AS title
FROM [TechnoHR].[ods].[et_robotik_otomasyon]
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
	,CASE
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri_pozisyon LIKE 'ID3%' THEN 'ID3'
		WHEN musteri_pozisyon LIKE 'ITHINKA%' THEN 'Ithinka'
		WHEN musteri_pozisyon LIKE 'Unite%' THEN 'UniteBT'
		ELSE musteri_pozisyon
	END customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'RPA Developer'
	END AS title
FROM [TechnoHR].[ods].[et_rpa]t
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
    ,[hr] AS recruiter
    ,'EYE Teknoloji' AS customer
    ,'RPA Developer' AS title
FROM [TechnoHR].[ods].[et_rpg]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name
    ,CASE
		WHEN hr = ' ' THEN 'n/a'
		WHEN hr LIKE 'Buse%' THEN 'Buse'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
		WHEN hr LIKE 'Hilal%' THEN 'Hilal'
		WHEN hr LIKE 'Neval%' THEN 'Neval'
		WHEN hr LIKE 'Sibel%' THEN 'Sibel'
		WHEN hr = 'özge'  THEN 'Özge'
		WHEN hr = 'Sema'  THEN 'Semanur'
		WHEN hr LIKE 'Tuna%'  THEN 'Tunahan'
		ELSE hr
	END AS recruiter
    ,CASE 
		WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Gantek%' THEN 'Gantek'
		ELSE musteri
	END customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Virtualization Specialist'
	END AS title
FROM [TechnoHR].[ods].[et_sanallastirma]t
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,CASE
		WHEN ad_soyad IS NULL OR ad_soyad LIKE 'SAP%' THEN 'n/a'
		ELSE UPPER(ad_soyad)
	END AS candidate_full_name
    ,CASE
		WHEN hr IS NULL OR hr = 'Referans' THEN 'n/a'
		WHEN hr = 'EMRE' THEN 'Emre'
		WHEN hr = 'DENİZ' THEN 'Deniz'
		WHEN hr = 'AKIN' THEN 'Akın'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
		WHEN hr LIKE 'Hanife%' THEN 'Hanife'
		WHEN hr LIKE 'Onur%' THEN 'Onur'
		WHEN hr LIKE 'Sedef%' THEN 'Sedef'
		WHEN hr LIKE 'Tuna%'  THEN 'Tunahan'
		WHEN hr LIKE 'Yasemin H%'  THEN 'Yasemin Hepyaşar'
		WHEN hr LIKE 'özge%' THEN 'Özge'
		WHEN hr = 'sİBEL' OR hr = 'sibel' OR hr = 'Sİbel' THEN 'Sibel'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri_pozisyon LIKE 'Çözüm%' THEN 'Çözümevi'
		WHEN musteri_pozisyon LIKE 'Inspire%' THEN 'InspireIT'
		WHEN musteri_pozisyon LIKE 'Intellica%' THEN 'Intellica'
		WHEN musteri_pozisyon LIKE 'MBIS%' THEN 'MBIS'
		WHEN musteri_pozisyon LIKE 'MDS%' THEN 'MDS ap Tech'
		WHEN musteri_pozisyon LIKE 'Metric%' THEN 'Metric Yazılım'
		WHEN musteri_pozisyon LIKE 'SANKO%' THEN 'SANKO Holding'
		WHEN musteri_pozisyon LIKE 'SPRO%' THEN 'SPRO'
		ELSE 'n/a'
	END customer
	,CASE
		WHEN sap_tool IS NULL 
		THEN 
			CASE 
				WHEN tool = 'SAP FI' THEN 'SAP FI Consultant'
				WHEN tool = 'SAP PP' THEN 'SAP PP Consultant'
				ELSE  'SAP Consultant'
			END
		WHEN sap_tool LIKE '%Basis%' THEN 'SAP Basis Consultant'
		WHEN sap_tool LIKE 'BW%' THEN 'SAP BW/4HANA Consultant'
		WHEN sap_tool LIKE 'EWM%' THEN 'SAP EWM Consultant'
		WHEN sap_tool LIKE 'Power%' THEN 'SAP PowerDesigner Consultant'
		WHEN sap_tool LIKE '%BW/BO%' OR sap_tool LIKE '%BO/BW%' THEN 'SAP BO/BW Consultant'
		WHEN sap_tool LIKE '%ABAP%' THEN 'SAP ABAP Consultant'
		WHEN sap_tool LIKE '%BI%' THEN 'BI/DWH Consultant'
		WHEN sap_tool LIKE '%BO%' THEN 'SAP BO Consultant'
		WHEN sap_tool LIKE '%BPC%' THEN 'SAP BPC Consultant'
		WHEN sap_tool LIKE '%BW%' THEN 'SAP BW Consultant'
		WHEN sap_tool LIKE '%Data%' THEN 'SAP Dataservices Consultant'
		WHEN sap_tool LIKE '%Destek%' THEN 'SAP Support Specialist'
		WHEN sap_tool LIKE '%EWM%' THEN 'SAP EWM Consultant'
		WHEN sap_tool LIKE '%PM%' THEN 'SAP PM Consultant'
		WHEN sap_tool LIKE '%PP%' THEN 'SAP PP Consultant'
		WHEN sap_tool LIKE '%QM%' THEN 'SAP QM Consultant'
		WHEN sap_tool LIKE '%SD%' THEN 'SAP SD Consultant'
		WHEN sap_tool LIKE '%WM%' THEN 'SAP WM Consultant'
		WHEN sap_tool LIKE '%WM%' THEN 'SAP WM Consultant'
		ELSE 'SAP Consultant'
	END AS title
FROM [TechnoHR].[ods].[et_sap]
UNION ALL
SELECT 
	 TRY_CONVERT(DATE,[tarih],103) AS application_date            
	,CASE
		WHEN TRIM(ad_soyad) = '-' THEN 'n/a'
		ELSE UPPER(TRIM(ad_soyad))
	END AS candidate_full_name
    ,CASE
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr LIKE 'Gizem%' THEN 'Gizem Afacan'
		WHEN hr LIKE 'Neval%' THEN 'Neval'
		WHEN hr = 'Sbel' OR hr = 'Sİbel' THEN 'Sibel'
		WHEN hr = 'Tuna' THEN 'Tunahan'
		WHEN hr = 'özge' OR hr = 'öZGE' THEN 'Özge'

		WHEN hr LIKE 'ulaşılmasın%' THEN 'n/a'
		ELSE hr
	END AS recruiter
    ,CASE 
		WHEN musteri LIKE 'Arvato%' THEN 'Arvato'
		WHEN musteri LIKE 'Creentech%' THEN 'Creentech'
		WHEN musteri LIKE 'Data%' THEN 'DataBoss'
		WHEN musteri LIKE 'Fimple%' THEN 'Fimple'
		WHEN musteri LIKE '%Gantek%' THEN 'Gantek'
		WHEN musteri LIKE 'ID3%' THEN 'ID3'
		WHEN musteri LIKE '[İI]nfoloj[iı]k%' THEN 'İnfolojik'
		WHEN musteri LIKE 'NeviTech%' THEN 'NeviTech'
		WHEN musteri LIKE 'Snap%' THEN 'Snapbytes'
		WHEN musteri LIKE 'Unite%' THEN 'UniteBT'
		WHEN musteri LIKE 'Vektor%' THEN 'Vektor Mobility'
		ELSE 'n/a'
	END customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Sales Specialist'
	END AS title
FROM [TechnoHR].[ods].[et_satis]t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(TRIM(ad_soyad)) AS candidate_full_name
    ,CASE
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
		WHEN hr LIKE 'Hayra%' THEN 'Hayra'
		WHEN hr = 'Sbel'  THEN 'Sibel'
		WHEN hr = 'Tanay'  THEN 'Özge Tanay'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri_pozisyon LIKE 'Fimple%' THEN 'Fimple'
		WHEN musteri_pozisyon = 'Etiya' OR musteri_pozisyon LIKE '%Etiya%' THEN 'Etiya'
		WHEN musteri_pozisyon LIKE '%Gantek%' THEN 'Gantek'
		WHEN musteri_pozisyon LIKE 'Unite%' THEN 'UniteBT'
		WHEN musteri_pozisyon LIKE 'EYE%' THEN 'EYE Teknoloji'
		ELSE 'n/a'
	END customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Information Security Specialist'
	END AS title
FROM [TechnoHR].[ods].[et_security]t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name    
	,CASE
		WHEN hr = 'Gizem'  THEN 'Gizem Afacan'
		WHEN hr = 'Elif'  THEN 'Elif Day'
		ELSE hr
	END AS recruiter
    ,[musteri] AS customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Service Manager'
	END AS title
FROM [TechnoHR].[ods].[et_service_management]t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date            
    ,UPPER(ad_soyad) AS candidate_full_name    
    ,[hr] AS recruiter
    ,'n/a' AS customer
    ,'Cyber Security Specialist' AS title
FROM [TechnoHR].[ods].[et_siber_guvenlik]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
   ,COALESCE(UPPER(TRIM(aday_ad_soyad)),'n/a') AS candidate_full_name
	,CASE
		WHEN hr IS NULL THEN 'n/a'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr LIKE 'Elif M%' THEN 'Elif Mine'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr LIKE 'Hanife%' THEN 'Hanife'
		WHEN hr LIKE 'Özge%' THEN 'Özge'
		WHEN hr LIKE 'Sedef%' THEN 'Sedef'
		WHEN hr = 'Siibel' OR  hr = 'sİBEL' THEN 'Sibel'
		WHEN hr = 'Sema' THEN 'Semanur'

		ELSE hr
	END AS recruiter
    ,CASE 
		WHEN musteri IS NULL OR musteri = 'Başvuru' 
			OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Arvato%' THEN 'Arvato'
		WHEN musteri LIKE 'Cree%' THEN 'Creentech'
		WHEN musteri LIKE 'Eye%' THEN 'EYE Teknoloji'
		WHEN musteri LIKE '%Gantek%' THEN 'Gantek'
		WHEN musteri LIKE '[İI]deasoft%' THEN 'Ideasoft'
		WHEN musteri LIKE 'Tatil%' THEN 'TatilBudur'
		WHEN musteri LIKE 'Unite%' THEN 'UniteBT'
		ELSE musteri
	END customer    
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.aday_ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.aday_ad_soyad
    )
		ELSE 'System-Network Specialist'
	END AS title
FROM [TechnoHR].[ods].[et_sistem_network]t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
    ,UPPER(TRIM([ad_soyad])) AS candidate_full_name
	,CASE
		WHEN hr = 'DENİZ' THEN 'Deniz'
		WHEN hr = 'SİBEL' THEN 'Sibel'
		WHEN hr LIKE 'EMRE%' THEN 'Emre'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr LIKE 'Gizem D%' THEN 'Gizem Dilara'
		ELSE hr
	END AS recruiter
    ,CASE 
		WHEN musteri = 'başvuru' OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Gantek%' THEN 'Gantek'
		WHEN musteri = 'SİSTEK' THEN 'Sistek'
		WHEN musteri LIKE 'P[iıIİ][aA]%' THEN 'PiA'
		ELSE musteri
	END customer 
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Automation Management Specialist'
	END AS title
FROM [TechnoHR].[ods].[et_sistem_otomasyonu]t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
    ,UPPER(ad_soyad) AS candidate_full_name    
	,CASE
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		ELSE hr
	END AS recruiter
    ,CASE 
		WHEN musteri = 'Logo' THEN 'Logo Yazılım'
		ELSE 'n/a'
	END customer 
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Site Realibility Engineer'
	END AS title
FROM [TechnoHR].[ods].[et_site_reliability_eng]t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
    ,UPPER(ad_soyad) AS candidate_full_name        
	,CASE
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		ELSE hr
	END AS recruiter
    ,[musteri] AS customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Subject Matter Expert'
	END AS title
FROM [TechnoHR].[ods].[et_sme_banking_credit]t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
    ,UPPER(TRIM([ad_soyad])) AS candidate_full_name    
	,CASE
		WHEN hr = 'buğra' THEN 'Buğra'
		WHEN hr LIKE 'Beyza%' THEN 'Beyza'
		WHEN hr LIKE 'Buse%' THEN 'Buse'
		WHEN hr LIKE 'Ebru%' THEN 'Ebru'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr LIKE 'Hanife%' THEN 'Hanife'
		WHEN hr LIKE 'Hayra%' THEN 'Hayra'
		WHEN hr LIKE 'Hilal%' THEN 'Hilal'
		WHEN hr LIKE 'Onur%' THEN 'Onur'
		WHEN hr LIKE 'Özge%' THEN 'Özge'
		WHEN hr = 'Sbel' OR hr = 'Sİbel' THEN 'Sibel'
		WHEN hr = 'meral' THEN 'Meral'
		WHEN hr = 'Sema' THEN 'Semanur'
		WHEN hr = 'Tanay' THEN 'Özge Tanay'
		ELSE hr
	END AS recruiter
    ,CASE 
		WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Gan%' THEN 'Gantek'
		ELSE musteri
	END customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.ad_soyad
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.ad_soyad
    )
		ELSE 'Storage-Backup Specialist'
	END AS title
FROM [TechnoHR].[ods].[et_storage_backup]t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
	,CASE
		WHEN ad_soyad IS NULL OR ad_soyad = ' ' OR ad_soyad = 'aranacak' THEN 'n/a'
		ELSE UPPER(ad_soyad)
	END AS candidate_full_name
	,CASE
		WHEN TRIM(hr) IS NULL  THEN 'n/a'
		WHEN TRIM(hr) = 'Elif' THEN 'Elif Day'
		WHEN TRIM(hr) = 'Gizem' THEN 'Gizem Afacan'
		WHEN TRIM(hr) LIKE 'Furkan%' THEN 'Furkan'
		WHEN TRIM(hr) = 'Hillal' THEN 'Hilal'
		WHEN TRIM(hr) = 'Özge T.' OR TRIM(hr) = 'Tanay' THEN 'Özge Tanay'
		WHEN TRIM(hr) LIKE 'Sibel%' THEN 'Sibel'
		WHEN TRIM(hr) = 'Sema' THEN 'Semanur'
		ELSE TRIM(hr)
	END AS recruiter
    ,CASE 
		WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Eye%' THEN 'EYE Teknoloji'
		WHEN musteri = 'Logo' THEN 'Logo Yazılım'
		WHEN musteri LIKE 'P[iıİI][aA]%' THEN 'PiA'
		WHEN musteri LIKE 'Tetra%' THEN 'Tetra Bilişim'
		ELSE musteri
	END customer
    ,'Application Support Engineer' AS title
FROM [TechnoHR].[ods].[et_support]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
    ,UPPER(aday_adi_soyadi) AS candidate_full_name
	,CASE
		WHEN hr LIKE 'Meral%' THEN 'Meral'
		WHEN hr LIKE 'EMRE%' THEN 'Emre'
		WHEN hr = 'özge' THEN 'Özge'

		ELSE hr
	END AS recruiter
    ,'EYE Teknoloji' AS customer
	,CASE 
		WHEN EXISTS (
			SELECT 1 
			FROM stg.at_aday_rapor AS r
			WHERE r.candidate_full_name = t.aday_adi_soyadi
		)
     THEN (
        SELECT TOP 1 r.title
        FROM stg.at_aday_rapor AS r
        WHERE r.candidate_full_name = t.aday_adi_soyadi
    )
		ELSE 'Test/QA Specialist'
	END AS title
FROM [TechnoHR].[ods].[et_test_analisti]t
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
    ,UPPER(TRIM([aday_adi_soyadi])) AS candidate_full_name
	,CASE
		WHEN hr = 'Deniz K.' THEN 'Deniz Karsel'
		WHEN hr = 'ECE' THEN 'Ece'
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr LIKE 'Hanife%' THEN 'Hanife'
		WHEN hr = 'HATİCE Ş.' THEN 'Hatice'
		WHEN hr LIKE 'Meral%' THEN 'Meral'
		WHEN hr LIKE 'Onur%' THEN 'Onur'
		WHEN hr = 'Öxge' OR hr LIKE '[öÖ]zge%' THEN 'Özge'
		WHEN hr = 'Sbel' THEN 'Sibel'
		WHEN hr LIKE 'Sedef%' THEN 'Sedef'
		WHEN hr = 'EMRE' THEN 'Emre'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'A[lk]hazen%' THEN 'Alhazen'
		WHEN musteri LIKE 'AVD%' THEN 'AVD Teknoloji'
		WHEN musteri LIKE 'EYE%' OR musteri LIKE 'Vakıf%' OR musteri LIKE 'THY%' THEN 'EYE Teknoloji'
		WHEN musteri LIKE '%Vava%' THEN 'VavaCars'
		WHEN musteri LIKE 'ID3%' THEN 'ID3'
		WHEN musteri LIKE 'Inspire%' THEN 'InspireIT'
		WHEN musteri LIKE '[İI]ntel%' THEN 'Intellica'
		WHEN musteri LIKE 'Jit%' THEN 'JitterBit'
		WHEN musteri LIKE 'Pera%' THEN 'Perasoft'
		WHEN musteri LIKE 'P[iıİI][aA]%' THEN 'PiA'
		WHEN musteri LIKE 'Tatil%' THEN 'TatilBudur'
		ELSE musteri
	END customer
    ,'Test/QA Specialist' AS title
FROM [TechnoHR].[ods].[et_test_qa]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
    ,UPPER(ad_soyad) AS candidate_full_name
	,CASE
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr = 'Yasemin H.' THEN 'Yasemin Hepyaşar'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri IS NULL OR musteri = 'Genel' THEN 'n/a'
		WHEN musteri LIKE 'Eye%' THEN 'EYE Teknoloji'
		ELSE musteri
	END customer
	,CASE
		WHEN pozisyon LIKE '%Siebel%' THEN 'Siebel Developer'
		WHEN pozisyon LIKE '%Tibco%' THEN 'Tibco Developer'
		ELSE 'Billing Developer'
	END AS title
FROM [TechnoHR].[ods].[et_tibco_siebel_billing]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
    ,UPPER(ad_soyad) AS candidate_full_name
    ,[hr] AS [recruiter]
	,CASE 
		WHEN musteri LIKE 'Tetra%' THEN 'Tetra Bilişim'
	END customer
    ,'System Admin/Engineer' AS title
FROM [TechnoHR].[ods].[et_uretim_sist_yon]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date
    ,UPPER(ad_soyad) AS candidate_full_name
	,CASE
		WHEN hr = 'Elif' THEN 'Elif Day'
		WHEN hr = 'Gizem' THEN 'Gizem Afacan'
		WHEN hr = 'Zeynep Oktay' THEN 'Zeynep'
		ELSE hr
	END AS recruiter
	,CASE 
		WHEN musteri LIKE 'tatil%' THEN 'TatilBudur'
	END customer
    ,'Web Analytics Specialist' AS title
FROM [TechnoHR].[ods].[et_urun_ve_analitik]
)
INSERT INTO stg.application_history (
       [application_date]
      ,[candidate_full_name]
      ,[recruiter]
      ,[customer]
      ,[title]
      ,[recruiter_email]
)
SELECT
    a.application_date
    ,a.candidate_full_name
    ,a.recruiter
    ,a.customer
    ,a.title
    ,COALESCE(eh.email,'n/a') AS recruiter_email
FROM AllApplications a
LEFT JOIN stg.et_hr eh
    ON eh.recruiter_firstname + ' ' + eh.recruiter_lastname = a.recruiter
    OR eh.recruiter_firstname = a.recruiter
    OR (a.recruiter = 'Elif Mine'      AND eh.recruiter_firstname + ' ' + eh.recruiter_lastname = 'Elif Mine')
    OR (a.recruiter = 'Deniz Karsel'  AND eh.recruiter_firstname + ' ' + eh.recruiter_lastname = 'Deniz Karsel')
    OR (a.recruiter = 'Elif Day'      AND eh.recruiter_firstname + ' ' + eh.recruiter_lastname = 'Elif Day')
    OR (a.recruiter = 'Gizem Afacan'  AND eh.recruiter_firstname + ' ' + eh.recruiter_lastname = 'Gizem Afacan')
    OR (a.recruiter = 'Gizem Dilara'  AND eh.recruiter_firstname + ' ' + eh.recruiter_lastname = 'Gizem Dilara')
    OR (a.recruiter = 'Özge Tanay'    AND eh.recruiter_firstname + ' ' + eh.recruiter_lastname = 'Özge Tanay')
    OR (a.recruiter = 'Şevval Nur'    AND eh.recruiter_firstname + ' ' + eh.recruiter_lastname = 'Şevval Nur')
    OR (a.recruiter = 'Talha Şahin'   AND eh.recruiter_firstname + ' ' + eh.recruiter_lastname = 'Talha Şahin')
    OR (a.recruiter = 'Yasemin Hepyaşar' AND eh.recruiter_firstname + ' ' + eh.recruiter_lastname = 'Yasemin Hepyaşar');



