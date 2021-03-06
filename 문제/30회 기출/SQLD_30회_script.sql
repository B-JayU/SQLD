
-------------------------------------------
Q.11
-------------------------------------------
CREATE TABLE SQLD_30_11_01
(
  COL1 VARCHAR2(30),
  COL2 NUMBER
) ;

CREATE TABLE SQLD_30_11_02
(
  COL1 VARCHAR2(30),
  COL3 VARCHAR2(30),
  COL4 NUMBER
);

INSERT INTO SQLD_30_11_01 VALUES (1,20);
INSERT INTO SQLD_30_11_01 VALUES (2,30);
INSERT INTO SQLD_30_11_01 VALUES (3,40);
INSERT INTO SQLD_30_11_01 VALUES ('A',50);

INSERT INTO SQLD_30_11_02 VALUES (1,'ABC',10);
INSERT INTO SQLD_30_11_02 VALUES (2,'DEF',9);
INSERT INTO SQLD_30_11_02 VALUES (3,'XY',15);
INSERT INTO SQLD_30_11_02 VALUES ('A',1,5);

COMMIT;

-- SELECT * FROM SQLD_30_11_01;
-- SELECT * FROM SQLD_30_11_02;

SELECT A.COL1, A.COL2
FROM SQLD_30_11_01 A
WHERE A.COL1 > 0;

SELECT A.COL1, B.COL4
FROM SQLD_30_11_01 A
     INNER JOIN SQLD_30_11_02 B
             ON (A.COL1 = B.COL1)
WHERE B.COL3 > 'X';

SELECT COUNT(*)
FROM SQLD_30_11_01 A
WHERE EXISTS (SELECT 'X'
              FROM SQLD_30_11_02 B
              WHERE A.COL2 = B.COL4);

SELECT SUM(A.COL2)
FROM SQLD_30_11_01 A
     INNER JOIN SQLD_30_11_02 B
             ON (A.COL1 = B.COL1)
WHERE B.COL4 > '1';


-------------------------------------------
Q.12
-------------------------------------------

CREATE TABLE SQLD_30_12_01
(
  COL1 VARCHAR2(30),
  COL2 NUMBER
) ;

CREATE TABLE SQLD_30_12_02
(
  COL3 VARCHAR2(30),
  COL1 VARCHAR2(30) ,
  COL4 NUMBER
);

CREATE TABLE SQLD_30_12_03
(
  COL4 NUMBER,
  COL5 VARCHAR2(30)
);

INSERT INTO SQLD_30_12_01 VALUES (1,20);
INSERT INTO SQLD_30_12_01 VALUES (2,30);
INSERT INTO SQLD_30_12_01 VALUES (3,40);
INSERT INTO SQLD_30_12_01 VALUES ('A',50);

INSERT INTO SQLD_30_12_02 VALUES (1,'ABC',10);
INSERT INTO SQLD_30_12_02 VALUES (2,'DEF',9);
INSERT INTO SQLD_30_12_02 VALUES (3,'XY',15);
INSERT INTO SQLD_30_12_02 VALUES ('A',1,5);
INSERT INTO SQLD_30_12_02 VALUES ('A',2,null);

INSERT INTO SQLD_30_12_03 VALUES (10,'A');
INSERT INTO SQLD_30_12_03 VALUES (9,'B');
INSERT INTO SQLD_30_12_03 VALUES (15,'C');
INSERT INTO SQLD_30_12_03 VALUES (5,'D');

COMMIT;

SELECT * FROM SQLD_30_12_01;
SELECT * FROM SQLD_30_12_02;
SELECT * FROM SQLD_30_12_03;

SELECT A.COL1,
       (SELECT COL3 FROM SQLD_30_12_02 B
        WHERE A.COL1 = B.COL1) AS B_COL3
FROM SQLD_30_12_01 A
WHERE A.COL2 > 10;

SELECT A.COL1,
       (SELECT COL5 FROM SQLD_30_12_03 B
        WHERE A.COL4 = B.COL4) AS B_COL3
FROM SQLD_30_12_02 A
WHERE A.COL4 > 0;

SELECT A.COL1, B.COL3
FROM SQLD_30_12_01 A
     INNER JOIN SQLD_30_12_02 B
             ON (A.COL1 = B.COL1)
     INNER JOIN SQLD_30_12_03 C
             ON (B.COL4 = C.COL4)
WHERE C.COL4 > 5
AND A.COL2 > 10;

SELECT A.COL1, B.COL3
FROM SQLD_30_12_01 A
     INNER JOIN SQLD_30_12_02 B
             ON (A.COL1 = B.COL1)
WHERE EXISTS (SELECT 'X'
             FROM SQLD_30_12_03 C
             WHERE B.COL4 = C.COL4)


-------------------------------------------
Q.13
-------------------------------------------
SELECT JOB_ID, MANAGER_ID, SUM(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('SH_CLERK','ST_CLERK','SA_REP')
GROUP BY ROLLUP (JOB_ID,MANAGER_ID) ;

-------------------------------------------
Q.14
-------------------------------------------

CREATE TABLE  SQLD_30_14_01
(
  COL1 VARCHAR2(30),
  COL2 NUMBER
);

INSERT INTO SQLD_30_14_01 VALUES ('Y',20);
INSERT INTO SQLD_30_14_01 VALUES ('X',30);
INSERT INTO SQLD_30_14_01 VALUES ('A',40);
INSERT INTO SQLD_30_14_01 VALUES ('A',50);

COMMIT;

SELECT COUNT(*)
FROM SQLD_30_14_01
WHERE (COL1, COL2) IN ( ('A', 50) );


-------------------------------------------
Q.15
-------------------------------------------

CREATE TABLE  SQLD_30_15_01
(
  COL1 VARCHAR2(30),
  COL2 NUMBER
);

INSERT INTO SQLD_30_15_01 VALUES ('Y',20);
INSERT INTO SQLD_30_15_01 VALUES ('X',30);
INSERT INTO SQLD_30_15_01 VALUES ('A',40);
INSERT INTO SQLD_30_15_01 VALUES ('A',50);
INSERT INTO SQLD_30_15_01 VALUES (NULL,10);
INSERT INTO SQLD_30_15_01 VALUES (NULL,80);

COMMIT;

SELECT SUM(COL2)
FROM SQLD_30_15_01
WHERE COL1 IN ('A','X',NULL);

-------------------------------------------
Q.17
-------------------------------------------

CREATE TABLE  SQLD_30_17_01
(
  COL1 VARCHAR2(30),
  COL2 NUMBER
);

INSERT INTO SQLD_30_17_01 VALUES ('Y',20);
INSERT INTO SQLD_30_17_01 VALUES ('X',30);
INSERT INTO SQLD_30_17_01 VALUES ('A',40);
INSERT INTO SQLD_30_17_01 VALUES ('A',50);
INSERT INTO SQLD_30_17_01 VALUES (NULL,10);
INSERT INTO SQLD_30_17_01 VALUES (NULL,80);

COMMIT;

SELECT nvl(count(*), 9999)
FROM SQLD_30_17_01
WHERE 1=2

-------------------------------------------
Q.18
-------------------------------------------

CREATE TABLE  SQLD_30_18_01
(
  COL1 VARCHAR2(30),
  COL2 NUMBER
);

INSERT INTO SQLD_30_18_01 VALUES (1, 100);
INSERT INTO SQLD_30_18_01 VALUES (1, NULL);
INSERT INTO SQLD_30_18_01 VALUES (2, 100);
INSERT INTO SQLD_30_18_01 VALUES (2, 200);

COMMIT;

SELECT COL1, SUM(COL2)
FROM SQLD_30_18_01
GROUP BY COL1;


-------------------------------------------
Q.19
-------------------------------------------

CREATE TABLE SQLD_30_19
(COL1 NUMBER) ;

INSERT INTO SQLD_30_19 VALUES (1);
INSERT INTO SQLD_30_19 VALUES (2);
SAVEPOINT SV1;
UPDATE SQLD_30_19 SET COL1=4 WHERE COL1=2;
SAVEPOINT SV1;
DELETE SQLD_30_19 WHERE COL1 >=2;
ROLLBACK TO SV1;
INSERT INTO SQLD_30_19 VALUES (3);
SELECT MAX(COL1) FROM SQLD_30_19;


-------------------------------------------
Q.22
-------------------------------------------

CREATE TABLE SQLD_30_22
(COL1 NUMBER,
 COL2 NUMBER
) ;

INSERT INTO SQLD_30_22 VALUES (100,100);
INSERT INTO SQLD_30_22 VALUES (NULL,60);
INSERT INTO SQLD_30_22 VALUES (NULL,NULL);

COMMIT;

SELECT COALESCE(COL1, COL2 *50 , 50) FROM SQLD_30_22;


-------------------------------------------
Q.27
-------------------------------------------

SELECT LEVEL,
       LPAD('** ', (LEVEL -1 )*2 ,'**') || EMPLOYEE_ID AS EMP_TREE,
       MANAGER_ID,
       EMPLOYEE_ID
FROM EMPLOYEES
WHERE 1=1
START WITH MANAGER_ID IS NULL
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID ;


-------------------------------------------
Q.49
-------------------------------------------

CREATE TABLE SQLD_30_49
(
  ??????ID VARCHAR2(30),
  ???????????? NUMBER
);

INSERT INTO SQLD_30_49 VALUES ('B',450);
INSERT INTO SQLD_30_49 VALUES ('G',255);
INSERT INTO SQLD_30_49 VALUES ('F',255);
INSERT INTO SQLD_30_49 VALUES ('H',100);

COMMIT;

SELECT ??????ID,
        DENSE_RANK() OVER(ORDER BY ???????????? DESC),
        ????????????
FROM SQLD_30_49;


-------------------------------------------
Q.30
-------------------------------------------

CREATE TABLE SQLD_30_30_??????
(
  ??????ID NUMBER,
  ????????? VARCHAR2(30)
);

CREATE TABLE SQLD_30_30_??????
(
  ??????ID NUMBER,
  ????????? VARCHAR2(30),
  ???????????? NUMBER
);

CREATE TABLE SQLD_30_30_??????
(
  ??????ID NUMBER,
  ??????ID NUMBER,
  ??????ID NUMBER,
  ?????? NUMBER,
  ???????????? VARCHAR2(8)
);

INSERT INTO SQLD_30_30_?????? VALUES(1, 'A');
INSERT INTO SQLD_30_30_?????? VALUES(2, 'B');
INSERT INTO SQLD_30_30_?????? VALUES(3, 'C');
INSERT INTO SQLD_30_30_?????? VALUES(4, 'D');
INSERT INTO SQLD_30_30_?????? VALUES(5, 'E');
INSERT INTO SQLD_30_30_?????? VALUES(6, 'F');

INSERT INTO SQLD_30_30_?????? VALUES(100, 'P01',1000);
INSERT INTO SQLD_30_30_?????? VALUES(101, 'P02',2000);
INSERT INTO SQLD_30_30_?????? VALUES(102, 'P03',3000);
INSERT INTO SQLD_30_30_?????? VALUES(103, 'P04',4000);
INSERT INTO SQLD_30_30_?????? VALUES(200, 'X01',10000);
INSERT INTO SQLD_30_30_?????? VALUES(201, 'X02',100);
INSERT INTO SQLD_30_30_?????? VALUES(202, 'X03',23000);

TRUNCATE TABLE SQLD_30_30_??????;
INSERT INTO SQLD_30_30_?????? VALUES(1001, 1,100, 2,'20171201');
INSERT INTO SQLD_30_30_?????? VALUES(1002, 1,101, 1,'20171201');
INSERT INTO SQLD_30_30_?????? VALUES(1003, 2,200, 3,'20171201');
INSERT INTO SQLD_30_30_?????? VALUES(1004, 3,202, 1,'20171201');
INSERT INTO SQLD_30_30_?????? VALUES(1005, 4,103, 5,'20180504');
INSERT INTO SQLD_30_30_?????? VALUES(1006, 5,102, 2,'20180504');

INSERT INTO SQLD_30_30_?????? VALUES(1007, 1,200, 2,'20180504');
INSERT INTO SQLD_30_30_?????? VALUES(1008, 4,100, 1,'20180504');
INSERT INTO SQLD_30_30_?????? VALUES(1009, 4,200, 2,'20180806');
INSERT INTO SQLD_30_30_?????? VALUES(1010, 5,102, 3,'20180806');
INSERT INTO SQLD_30_30_?????? VALUES(1011, 5,101, 1,'20180806');
INSERT INTO SQLD_30_30_?????? VALUES(1012, 5,201, 1,'20190102');

INSERT INTO SQLD_30_30_?????? VALUES(1013, 2,103, 4,'20190102');
INSERT INTO SQLD_30_30_?????? VALUES(1014, 2,102, 1,'20190102');
INSERT INTO SQLD_30_30_?????? VALUES(1015, 1,202, 3,'20190102');

COMMIT;

SELECT * FROM SQLD_30_30_??????;
SELECT * FROM SQLD_30_30_??????;
SELECT * FROM SQLD_30_30_??????;


SELECT SUBSTR(C.????????????,1,4) AS ??????, A.?????????, SUM(C.??????*B.????????????)
FROM SQLD_30_30_?????? C
      INNER JOIN SQLD_30_30_?????? A ON C.??????ID = A.??????ID
      INNER JOIN SQLD_30_30_?????? B ON C.??????ID = B.??????ID
WHERE 1=1
GROUP BY SUBSTR(C.????????????,1,4) ,A.?????????
ORDER BY 1,2;



SELECT A.?????????,
        NVL(SUM(C.??????*B.????????????),0) AS ???????????????
FROM SQLD_30_30_?????? A
      LEFT OUTER JOIN SQLD_30_30_?????? C ON A.??????ID = C.??????ID
      LEFT OUTER JOIN SQLD_30_30_?????? B ON C.??????ID = B.??????ID
WHERE 1=1
GROUP BY A.?????????
ORDER BY 1,2;

SELECT A.?????????,
        NVL((
            SELECT SUM(C.?????? * B.????????????)
              FROM SQLD_30_30_?????? C
                    LEFT OUTER JOIN SQLD_30_30_?????? B ON C.??????ID = B.??????ID
            WHERE C.??????ID = A.??????ID),0 ) AS ???????????????
FROM SQLD_30_30_?????? A
WHERE 1=1
ORDER BY 1,2;

SELECT A.?????????,
        NVL(SUM(?????????),0) AS ???????????????
FROM SQLD_30_30_?????? A
      LEFT OUTER JOIN
     (
       SELECT C.??????ID, C.?????? * B.???????????? AS ?????????
       FROM SQLD_30_30_?????? C
             INNER JOIN SQLD_30_30_?????? B ON C.??????ID = B.??????ID) D
      ON A.??????ID = D.??????ID
WHERE 1=1
GROUP BY A.?????????
ORDER BY 1,2;

SELECT A.?????????,
        NVL(SUM(C.??????*B.????????????),0) AS ???????????????
FROM SQLD_30_30_?????? A
      INNER JOIN SQLD_30_30_?????? C ON A.??????ID = C.??????ID
      INNER JOIN SQLD_30_30_?????? B ON C.??????ID = B.??????ID
WHERE 1=1
GROUP BY A.?????????
ORDER BY 1,2;

-------------------------------------------
Q.31
-------------------------------------------

CREATE TABLE SQLD_30_31_01
(
  COL1 NUMBER,
  COL2 NUMBER
);

CREATE TABLE SQLD_30_31_02
(
  COL1 NUMBER,
  COL2 NUMBER
);

INSERT INTO SQLD_30_31_01 VALUES (1,2);
INSERT INTO SQLD_30_31_01 VALUES (1,2);
INSERT INTO SQLD_30_31_01 VALUES (1,3);

INSERT INTO SQLD_30_31_02 VALUES (1,2);
INSERT INTO SQLD_30_31_02 VALUES (1,4);
INSERT INTO SQLD_30_31_02 VALUES (1,5);

COMMIT;

SELECT DISTINCT COL1, COL2
FROM SQLD_30_31_01
UNION ALL
SELECT COL1, COL2
FROM SQLD_30_31_02;


-------------------------------------------
Q.32
-------------------------------------------

CREATE TABLE SQLD_30_32_01
(
  COL1 NUMBER,
  COL2 NUMBER,
  COL3 NUMBER
);

CREATE TABLE SQLD_30_32_02
(
  COL1 NUMBER,
  COL2 NUMBER,
  COL3 NUMBER
);

INSERT INTO SQLD_30_32_01 VALUES (1,2,NULL);
INSERT INTO SQLD_30_32_01 VALUES (2,NULL,1);
INSERT INTO SQLD_30_32_01 VALUES (4,NULL,NULL);

INSERT INTO SQLD_30_32_02 VALUES (1,NULL,-1);
INSERT INTO SQLD_30_32_02 VALUES (2,NULL, 1);
INSERT INTO SQLD_30_32_02 VALUES (3,5,2);

COMMIT;

SELECT COUNT(*)
FROM SQLD_30_32_01 A, SQLD_30_32_02 B
WHERE A.COL1 =B.COL1
AND NVL(A.COL2, -1) = NVL(B.COL2, -1)
AND NVL(A.COL3, -1) = NVL(B.COL3, -1)

-------------------------------------------
Q.34
-------------------------------------------
create table "??????"
(
	"??????ID" VARCHAR2(50) not null
		constraint "??????_PK" primary key,
	"?????????" VARCHAR2(50)
);

create table "??????"
(
	"??????ID" VARCHAR2(50),
	"??????ID" VARCHAR2(50)
		constraint "??????_FK" references "??????",
	"?????????" VARCHAR2(50)
);

(1) INSERT INTO ?????? VALUES ('C001','AAA');
(2) INSERT INTO ?????? VALUES ('O001','C001','XXX');
(3) UPDATE ?????? SET ??????ID = NULL WHERE ??????ID = 'O001';
(4) INSERT INTO ?????? VALUES ('O002','C002','YYY');


-------------------------------------------
Q.39
-------------------------------------------

CREATE TABLE SQLD_30_39 (N1 NUMBER);
INSERT INTO SQLD_30_39 VALUES(1);
INSERT INTO SQLD_30_39 VALUES(2);
CREATE TABLE TMP_SQLD_30_39 (N1 NUMBER);
INSERT INTO TMP_SQLD_30_39 VALUES(1);
TRUNCATE TABLE TMP_SQLD_30_39;
ROLLBACK;
COMMIT;
SELECT SUM(N1) FROM SQLD_30_39;


-------------------------------------------
Q.40
-------------------------------------------

CREATE TABLE SQLD_30_40
(
  COL1 NUMBER,
  COL2 NUMBER
);

INSERT INTO SQLD_30_40 VALUES (1,10);
INSERT INTO SQLD_30_40 VALUES (2,20);
INSERT INTO SQLD_30_40 VALUES (3,NULL);

COMMIT;

SELECT AVG ( NVL (COL2, 0 ) ) AS AVG_COL
FROM SQLD_30_40;


-------------------------------------------
Q.42
-------------------------------------------

CREATE TABLE SQLD_30_42_01
(
  COL1 VARCHAR2(30),
  COL2 VARCHAR2(30),
  COL3 NUMBER
);

CREATE TABLE SQLD_30_42_02
(
  COL1 VARCHAR2(30),
  COL2 VARCHAR2(30),
  COL3 NUMBER
);

INSERT INTO SQLD_30_42_01 VALUES ('A','X',1);
INSERT INTO SQLD_30_42_01 VALUES ('B','Y',2);
INSERT INTO SQLD_30_42_01 VALUES ('C','Z',3);
INSERT INTO SQLD_30_42_01 VALUES ('X','T',1);

INSERT INTO SQLD_30_42_02 VALUES ('A','X',1);
INSERT INTO SQLD_30_42_02 VALUES ('B','Y',2);
INSERT INTO SQLD_30_42_02 VALUES ('C','Z',3);
INSERT INTO SQLD_30_42_02 VALUES ('D','???',4);
INSERT INTO SQLD_30_42_02 VALUES ('E','???',5);

COMMIT;

SELECT * FROM SQLD_30_42_01;
SELECT * FROM SQLD_30_42_02;


MERGE INTO SQLD_30_42_01 A
USING SQLD_30_42_02 B
    ON (A.COL1 = B.COL1)
WHEN MATCHED THEN
    UPDATE SET A.COL3 = 4
            WHERE A.COL3 = 2
    DELETE WHERE A.COL3 <= 2
 WHEN NOT MATCHED THEN
    INSERT (A.COL1,A.COL2,A.COL3) VALUES(B.COL1,B.COL2,B.COL3);

SELECT * FROM SQLD_30_42_01;

* MERGE ????????? DELETE ????????? DELETE ?????? ????????? ?????? UPDATE ????????? ?????????. UPDATE ????????? ?????? ????????? DELETE ????????? ?????????


-------------------------------------------
Q.43
-------------------------------------------
SELECT ABS(-3.8), FLOOR(3.8), TRUNC(3.8), ROUND(3.8) FROM DUAL;


-------------------------------------------
Q.45
-------------------------------------------

CREATE TABLE SQLD_30_45
(
  ???????????? NUMBER,
  ?????????????????? NUMBER
);

INSERT INTO SQLD_30_45 VALUES (1,NULL);
INSERT INTO SQLD_30_45 VALUES (2,NULL);
INSERT INTO SQLD_30_45 VALUES (4,1);
INSERT INTO SQLD_30_45 VALUES (5,1);
INSERT INTO SQLD_30_45 VALUES (6,2);
INSERT INTO SQLD_30_45 VALUES (7,2);
INSERT INTO SQLD_30_45 VALUES (8,4);
INSERT INTO SQLD_30_45 VALUES (9,5);
INSERT INTO SQLD_30_45 VALUES (10,6);
INSERT INTO SQLD_30_45 VALUES (11,7);

COMMIT;

SELECT * FROM SQLD_30_45;

SELECT  LEVEL,
    LPAD('** ', (LEVEL -1 )*2 ,'  ') || ???????????? AS ????????????,
    ????????????,
    ??????????????????
FROM SQLD_30_45
START WITH ?????????????????? IS NULL
CONNECT BY ???????????? = PRIOR ??????????????????;



-------------------------------------------
Q.47
-------------------------------------------
DROP TABLE SQLD_30_47;

CREATE TABLE SQLD_30_47
(
  COL1 VARCHAR2(30),
  COL2 NUMBER
);

INSERT INTO SQLD_30_47(COL1, COL2) VALUES('ABCD',NULL);
INSERT INTO SQLD_30_47(COL1, COL2) VALUES('BC',NULL);
ALTER TABLE SQLD_30_47 MODIFY COL2 DEFAULT 10;
INSERT INTO SQLD_30_47(COL1, COL2) VALUES('XY',NULL);
INSERT INTO SQLD_30_47(COL1) VALUES('EXD');
SELECT SUM(COL2) FROM SQLD_30_47;


