-- CREATE VIEW `nt_pt` AS
SELECT
	a.an as "AN",
	a.hn as "HN",
	CONCAT(p.pname, p.fname, ' ', p.lname) AS `NAME`,
	a.ward as "WARD",
	pt.name as "CLAIM",
	CONCAT(i.regdate, ' ', i.regtime) as "ADMIT_DATE",
	CONCAT(i.dchdate, ' ', i.dchtime) as "DISCHARGE_DATE",
	a.pdx as "ICD10",
	icd.name as "DIAG"
FROM
	hos.an_stat a
	LEFT JOIN hos.patient p ON a.hn = p.hn
	LEFT JOIN hos.pttype pt ON a.pttype = pt.pttype
	LEFT JOIN hos.ipt i ON a.an = i.an
	LEFT JOIN hos.icd101 icd ON a.pdx = icd.CODE;