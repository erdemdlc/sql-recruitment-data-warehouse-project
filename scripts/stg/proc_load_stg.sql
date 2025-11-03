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
TRUNCATE TABLE stg.application_history
INSERT INTO stg.application_history (
	   [application_date]
      ,[candidate_full_name]
      ,[recruiter]
      ,[customer]
      ,[location]
      ,[title]
	)
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date     
    ,UPPER(ad_soyad) AS candidate_full_name
    ,hr AS recruiter
    ,CASE
        WHEN musteri LIKE '%Genel%' THEN 'n/a'
        WHEN musteri LIKE 'Logo%' THEN 'Logo Yazılım'
        WHEN musteri LIKE 'Vava%' THEN 'VavaCars'
        WHEN musteri LIKE 'Mobillium%' THEN 'Mobillium'
        WHEN musteri LIKE 'PİA%' THEN 'PiA'
        ELSE musteri
    END AS customer
    ,lokasyon AS [location]
    ,CASE
	    WHEN pozisyon LIKE '%Scrum%' OR pozisyon LIKE '%Agile%' THEN 'Agile/Scrum Master'
	    WHEN pozisyon LIKE '%Kanban%'  THEN 'Kanban Master'
	    ELSE pozisyon
    END AS title
FROM [TechnoHR].[ods].[et_agilescrumkanban]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date    
    ,UPPER(ad_soyad) AS candidate_full_name
    ,hr AS recruiter
    ,[musteri] AS customer
    ,[lokasyon] AS [location]
    ,'Artificial Intelligence Director' AS title
 FROM [TechnoHR].[ods].[et_ai]
UNION ALL
SELECT 
    TRY_CONVERT(DATE,[tarih],103) AS application_date    
    ,UPPER(ad_soyad) AS candidate_full_name
    ,hr AS recruiter          
    ,[musteri] AS customer
    ,NULL AS [location]
    ,CASE
         WHEN lokasyon = 'Lead API Architect-Ereteam' OR  lokasyon IS NULL THEN 'API Management Specialist'
         WHEN lokasyon = 'Software Architect-Java' THEN 'Software Architect'
     END AS title
  FROM [TechnoHR].[ods].[et_api_management]



