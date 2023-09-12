-- CREATE VIEW `nt_ipt` AS
SELECT
	'10689' as "HOSPCODE",
	a.an as "AN",
	CASE
		WHEN p.sex = 1 THEN 'ชาย'
		WHEN p.sex = 2 THEN 'หญิง'
	END as "GENDER",
	YEAR (now()) - YEAR (p.birthday) as "AGE",
	a.regdate as "RGTDATE",
	a.dchdate as "DCHDATE",
	a.admdate as "LOS",
	w.NAME as "WARDNAME",
	s.NAME as "SPCLTY_NAME",
	a.pdx as "PDX",
	icd.NAME as "ICD10_PDX_NAME",
	pt.NAME as "ABBRNAME",
	a.income as "TOTAL",
	d.NAME as "DCHSTNAME",
	CASE
		WHEN (
			(
				pdx LIKE 'N390%'
				OR dx0 LIKE 'N390%'
				OR dx1 LIKE 'N390%'
				OR dx2 LIKE 'N390%'
				OR dx3 LIKE 'N390%'
				OR dx4 LIKE 'N390%'
				OR dx5 LIKE 'N390%'
			)
			OR (
				pdx IN ('j13', 'j14', 'j15', 'j16', 'j18')
				OR dx0 IN ('j13', 'j14', 'j15', 'j16', 'j18')
				OR dx1 IN ('j13', 'j14', 'j15', 'j16', 'j18')
				OR dx2 IN ('j13', 'j14', 'j15', 'j16', 'j18')
				OR dx3 IN ('j13', 'j14', 'j15', 'j16', 'j18')
				OR dx4 IN ('j13', 'j14', 'j15', 'j16', 'j18')
				OR dx5 IN ('j13', 'j14', 'j15', 'j16', 'j18')
			)
			OR (
				pdx LIKE 'T802%'
				OR dx0 LIKE 'T802%'
				OR dx1 LIKE 'T802%'
				OR dx2 LIKE 'T802%'
				OR dx3 LIKE 'T802%'
				OR dx4 LIKE 'T802%'
				OR dx5 LIKE 'T802%'
				OR pdx LIKE '%857%'
				OR dx0 LIKE '%857%'
				OR dx1 LIKE '%857%'
				OR dx2 LIKE '%857%'
				OR dx3 LIKE '%857%'
				OR dx4 LIKE '%857%'
				OR dx5 LIKE '%857%'
			)
			OR (
				pdx LIKE 'T793%'
				OR dx0 LIKE 'T793%'
				OR dx1 LIKE 'T793%'
				OR dx2 LIKE 'T793%'
				OR dx3 LIKE 'T793%'
				OR dx4 LIKE 'T793%'
				OR dx5 LIKE 'T793%'
			)
		) THEN 'YES'
		ELSE 'NO'
	END as "DIAG_INFECT",
	CASE
		WHEN pdx LIKE 'N390%'
		OR dx0 LIKE 'N390%'
		OR dx1 LIKE 'N390%'
		OR dx2 LIKE 'N390%'
		OR dx3 LIKE 'N390%'
		OR dx4 LIKE 'N390%'
		OR dx5 LIKE 'N390%' THEN 'YES'
		ELSE 'NO'
	END as "DIAG_INFECT_UTI",
	CASE
		WHEN pdx IN ('j13', 'j14', 'j15', 'j16', 'j18')
		OR dx0 IN ('j13', 'j14', 'j15', 'j16', 'j18')
		OR dx1 IN ('j13', 'j14', 'j15', 'j16', 'j18')
		OR dx2 IN ('j13', 'j14', 'j15', 'j16', 'j18')
		OR dx3 IN ('j13', 'j14', 'j15', 'j16', 'j18')
		OR dx4 IN ('j13', 'j14', 'j15', 'j16', 'j18')
		OR dx5 IN ('j13', 'j14', 'j15', 'j16', 'j18') THEN 'YES'
		ELSE 'NO'
	END as "DIAG_INFECT_PNEU",
	CASE
		WHEN pdx LIKE 'T802%'
		OR dx0 LIKE 'T802%'
		OR dx1 LIKE 'T802%'
		OR dx2 LIKE 'T802%'
		OR dx3 LIKE 'T802%'
		OR dx4 LIKE 'T802%'
		OR dx5 LIKE 'T802%'
		OR pdx LIKE '%857%'
		OR dx0 LIKE '%857%'
		OR dx1 LIKE '%857%'
		OR dx2 LIKE '%857%'
		OR dx3 LIKE '%857%'
		OR dx4 LIKE '%857%'
		OR dx5 LIKE '%857%' THEN 'YES'
		ELSE 'NO'
	END as "DIAG_INFECT_CRABSI",
	CASE
		WHEN pdx LIKE 'T793%'
		OR dx0 LIKE 'T793%'
		OR dx1 LIKE 'T793%'
		OR dx2 LIKE 'T793%'
		OR dx3 LIKE 'T793%'
		OR dx4 LIKE 'T793%'
		OR dx5 LIKE 'T793%' THEN 'YES'
		ELSE 'NO'
	END as "DIAG_INFECT_WOUND"
FROM
	hos.an_stat a
	LEFT JOIN hos.patient p ON a.hn = p.hn
	LEFT JOIN hos.pttype pt ON a.pttype = pt.pttype
	LEFT JOIN hos.ipt i ON a.an = i.an
	LEFT JOIN hos.spclty s ON a.spclty = s.spclty
	LEFT JOIN hos.ward w ON a.ward = w.ward
	LEFT JOIN hos.icd101 icd ON a.pdx = icd.CODE
	LEFT JOIN hos.dchtype d ON i.dchtype = d.dchtype