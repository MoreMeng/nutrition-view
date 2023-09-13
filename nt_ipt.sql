-- DROP VIEW "public"."nt_ipt";
-- CREATE VIEW "public"."nt_ipt" AS
SELECT '10689' "HOSPCODE",
    a.an "AN",
    CASE WHEN p.sex = '1' THEN 'ชาย' WHEN p.sex = '2' THEN 'หญิง' END "GENDER",
    a.age_y "AGE",
    a.regdate "RGTDATE",
    a.dchdate "DCHDATE",
    a.admdate "LOS",
    w.NAME "WARDNAME",
    s.NAME "SPCLTY_NAME",
    a.pdx "PDX",
    icd.NAME "ICD10_PDX_NAME",
    pt.NAME "ABBRNAME",
    a.income "TOTAL",
    d.NAME "DCHSTNAME",
    CASE WHEN UPPER(CONCAT ( pdx, dx0, dx1, dx2, dx3, dx4, dx5 )) SIMILAR TO '%N390%|%J13%|%J14%|%J15%|%J16%|%J18%|%T802%|%T857%|%T793%' THEN 'YES' ELSE 'NO' END "DIAG_INFECT",
    CASE WHEN UPPER(CONCAT ( pdx, dx0, dx1, dx2, dx3, dx4, dx5 )) ilike '%N390%' THEN 'YES' ELSE 'NO' END "DIAG_INFECT_UTI",
    CASE WHEN UPPER(CONCAT ( pdx, dx0, dx1, dx2, dx3, dx4, dx5 )) SIMILAR TO '%J13%|%J14%|%J15%|%J16%|%J18%' THEN 'YES' ELSE 'NO' END "DIAG_INFECT_PNEU",
    CASE WHEN UPPER(CONCAT ( pdx, dx0, dx1, dx2, dx3, dx4, dx5 )) SIMILAR TO '%T802%|%T857%' THEN 'YES' ELSE 'NO' END "DIAG_INFECT_CRABSI",
    CASE WHEN UPPER(CONCAT ( pdx, dx0, dx1, dx2, dx3, dx4, dx5 )) ilike '%T793%' THEN 'YES' ELSE 'NO' END "DIAG_INFECT_WOUND"
FROM an_stat a
LEFT JOIN patient p ON a.hn = p.hn
LEFT JOIN pttype pt ON a.pttype = pt.pttype
LEFT JOIN ipt i ON a.an = i.an
LEFT JOIN spclty s ON a.spclty = s.spclty
LEFT JOIN ward w ON a.ward = w.ward
LEFT JOIN icd101 icd ON a.pdx = icd.CODE
LEFT JOIN dchtype d ON i.dchtype = d.dchtype

-- DEBUG --
-- 	where a.an = '650015095'
-- limit 100
