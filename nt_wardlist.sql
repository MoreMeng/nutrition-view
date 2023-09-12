-- CREATE VIEW `nt_wardlist` AS
SELECT
	i.bedno as "BED_NO",
	a.ward as "WARD",
	i.an as "AN",
	a.hn as "HN",
	CONCAT(p.pname, p.fname, ' ', p.lname) as "NAME"
FROM
	hos.iptadm i
	LEFT JOIN hos.an_stat a ON i.an = a.an
	LEFT JOIN hos.patient p ON a.hn = p.hn
where
	a.dchdate is null;