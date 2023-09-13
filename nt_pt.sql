-- DROP VIEW "public"."nt_pt";
-- CREATE VIEW "public"."nt_pt" AS
SELECT a.an "AN",
    a.hn "HN",
    CONCAT ( p.pname, p.fname, ' ', p.lname ) "NAME",
    a.ward "WARD",
    pt.name "CLAIM",
    CONCAT ( i.regdate, ' ', i.regtime ) "ADMIT_DATE",
    CONCAT ( i.dchdate, ' ', i.dchtime ) "DISCHARGE_DATE",
    a.pdx "ICD10",
    icd.name "DIAG"
FROM an_stat a
LEFT JOIN patient p ON a.hn = p.hn
LEFT JOIN pttype pt ON a.pttype = pt.pttype
LEFT JOIN ipt i ON a.an = i.an
LEFT JOIN icd101 icd ON a.pdx = icd.CODE
-- DEBUG --
-- LIMIT 100