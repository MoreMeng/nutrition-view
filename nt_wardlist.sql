-- Active: 1694485953768@@129.0.0.21@5432@ath_hosdb@public
-- CREATE VIEW `nt_wardlist` AS
SELECT
    i.bedno as "BED_NO",
    a.ward as "WARD",
    i.an as "AN",
    a.hn as "HN",
    CONCAT(p.pname, p.fname, ' ', p.lname) as "NAME"
FROM iptadm i
    LEFT JOIN an_stat a ON i.an = a.an
    LEFT JOIN patient p ON a.hn = p.hn
WHERE a.dchdate IS NULL;