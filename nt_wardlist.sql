-- DROP VIEW "public"."nt_wardlist";
-- CREATE VIEW "public"."nt_wardlist" AS
SELECT i.bedno "BED_NO",
    a.ward "WARD",
    i.an "AN",
    a.hn "HN",
    CONCAT ( p.pname, p.fname, ' ', p.lname ) "NAME"
FROM iptadm i
LEFT JOIN an_stat a ON i.an = a.an
LEFT JOIN patient p ON a.hn = p.hn
WHERE a.dchdate IS NULL
-- DEBUG --
-- LIMIT 100
