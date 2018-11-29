CREATE TABLE t1 (a INTEGER);
CREATE TABLE t2 (a INTEGER, b INTEGER);
CREATE TABLE t3 (b INTEGER);

INSERT INTO t1 VALUES (1), (2);
INSERT INTO t2 VALUES (1, 101);
INSERT INTO t3 VALUES (101);

-- works
SELECT * FROM t1 LEFT JOIN t2 ON t1.a = t2.a LEFT JOIN t3 ON t2.b = t3.b OR t2.b IS NULL;

-- does not work
SELECT * FROM t1 LEFT JOIN (t2 LEFT JOIN t3 ON t2.b = t3.b OR t2.b IS NULL) ON t1.a = t2.a;

-- does not work
SELECT * FROM (t1 LEFT JOIN t2 ON t1.a = t2.a) LEFT JOIN t3 ON t2.b = t3.b OR t2.b IS NULL;