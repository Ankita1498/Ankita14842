use mysql;
create database training21;
use training21;
drop table dept;
create table dept(
deptno int not null , 
dname varchar(20) not null,
loc varchar(30) not null);

 alter table dept 
add constraint pk_deptno primary key (deptno);

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');
select * from dept;

Create TABLE EMP
(
 EMPNO int NOT NULL,
 ENAME VARCHAR(20),
  JOB VARCHAR(9),
   MGR int,
    HIREDATE DATETIME,
    SAL NUmeric(7, 2),
    COMM Numeric(7, 2),
    DEPTNO int
 );
alter table EMP 
add constraint pk_emp_empno primary key(empno);

alter table emp
add foreign key (deptno) references dept(deptno);

alter table emp
add foreign key (mgr) references emp(empno);

INSERT INTO EMP VALUES   (7839, 'KING',   'PRESIDENT', NULL,    str_to_date('11/17/1981','%m/%d/%Y') , 5000, NULL, null);   
INSERT INTO EMP VALUES   (7566, 'JONES',  'MANAGER',   		7839, str_to_date('04/2/1981'	,'%m/%d/%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES   (7698, 'BLAKE',  'MANAGER',   		7839, str_to_date('05/01/1981'	,'%m/%d/%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES   (7782, 'CLARK',  'MANAGER',   		7839, str_to_date('06/09/1981'	,'%m/%d/%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES   (7999, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/01/2011'  ,'%m/%d/%Y'), 4000, NULL, 10);
INSERT INTO EMP VALUES   (7788, 'SCOTT',  'ANALYST',   		7566, str_to_date('12/09/1982'  ,'%m/%d/%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES   (7902, 'FORD',   'ANALYST',   		7566, str_to_date('12/03/1981'  ,'%m/%d/%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES   (7499, 'ALLEN',  'SALESMAN',  		7698, str_to_date('02/20/1981'  ,'%m/%d/%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES   (7521, 'WARD',   'SALESMAN',  		7698, str_to_date('02/22/1981'  ,'%m/%d/%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES   (7654, 'MARTIN', 'SALESMAN',  		7698, str_to_date('09/28/1981'  ,'%m/%d/%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES   (7844, 'TURNER', 'SALESMAN',  		7698, str_to_date('09/08/1981'  ,'%m/%d/%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES   (7900, 'JAMES',  'CLERK',			7698, str_to_date('12/03/1981'  ,'%m/%d/%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES   (7369, 'SMITH',  'CLERK',			7902, str_to_date('12/17/1980'  ,'%m/%d/%Y'), 800, NULL, 20);
INSERT INTO EMP VALUES   (7876, 'ADAMS',  'CLERK',			7788, str_to_date('01/12/2003'  ,'%m/%d/%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES   (7934, 'MILLER', 'CLERK',			7782, str_to_date('01/23/2002'  ,'%m/%d/%Y'), 1300, NULL, 10);
INSERT INTO EMP VALUES   (7901, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/23/2012'  ,'%m/%d/%Y'), 3000, NULL, 10);

select * from dept;
select * from emp;



-- 1st question
-- list all manager data
SELECT EMPNO,ENAME,JOB FROM EMP WHERE JOB='MANAGER';


-- 2nd question
-- list emp who are working as manager
-- or clerk or analyst
SELECT EMPNO,ENAME,JOB FROM EMP WHERE JOB='CLERK'OR JOB='MANAGER' OR JOB='ANALYST';


-- 3rd question
-- list of emp who are earning sal between
-- 3000 and 5000 inclusive
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL between 3000 AND 5000;


-- 4th question
-- LIST EMP WHO ARE 
-- WORKING AS MANAGER OR ANALYST OR CLERK
-- AND
-- EARNING SAL BETWEEN 3000 AND 5000
SELECT EMPNO,ENAME,JOB,SAL FROM EMP 
WHERE 
(JOB='CLERK'OR JOB='MANAGER' OR JOB='ANALYST' )AND
SAL BETWEEN 3000 AND 5000;


-- 5th question
-- list of emp earning comm
select EMPNO,ENAME,COMM from EMP where COMM>0;

-- 6th question
-- lst of emp whose comm is not null
select EMPNO,ENAME,COMM from EMP where COMM IS NOT NULL;

-- 7th question
-- lst emp whose name starts with S
select ENAME from EMP where ENAME like 'S%';

-- 8th question 
-- lst emp whose name ends with R
select ENAME from EMP where ENAME like '%R';


-- 9th question
-- lst emp whose name contains A
select ENAME from EMP where ENAME like '%A%';


-- 10th question
-- lst emp whose name contains A as second letter
select ENAME from EMP where ENAME like '_A%';

-- 11th question
-- lst emp whose name starts with either M or S
select ENAME from EMP where ENAME like 'M%' OR ENAME like 'S%';

-- 12th question
-- lst emp whose name starts between A to M
select * from EMP where ENAME REGEXP '^[A-M]';

-- 13th question
-- lst emp whose name contains _
select ENAME from EMP where ENAME REGEXP '_';


-- 14th question
-- lst of emp who are working as manager in either DEPt 10 or 20
-- And all clerk for DEPT3 30
select * from EMP where JOB='MANAGER' AND DEPTNO IN ('10','20') OR JOB='CLERK' AND DEPTNO='30';

-- 15th question
-- lst ENAME,SAL AND BONUS as 10% of SAL
select ENAME,SAL,(SAL*10/100) AS BONUS from EMP;

-- 16th question
-- lst emp data as per ASC order of name
select * from EMP order by ENAME;


-- 17th question
-- lst emp as per salary highest to lowest
select * from EMP order by SAL DESC;


-- 18th question
-- lst emp as per dept in highest to lowest SAL
select * from EMP group by deptno order by SAL DESC;


-- 19th question
-- lst top 3 highest paid emp
select * from EMP ORDER BY SAL DESc limit 3;

-- 20th question
-- return rank based on specified criteria
select EMPNO,ENAME,DEPTNO,SAL,
RANK() over(partition by DEPTNO ORDER BY SAL DESC) AS 'RANK' From EMP;


-- 22th question
-- list the different job name
select distinct JOB from emp;

-- 23th question
-- lst total organisation salary
select SUM(SAL) as TOTAL_ORGANISATION_SALARY from emp;


-- 24th question 
-- lst deptwise total salary
select deptno,sum(SAL) as TOTAL_DEPT_SAL from emp group by deptno;


-- 25th question
-- lst jobwise emp count
select JOB,COUNT(*) as EMP_COUNT from EMP GROUP BY JOB;


-- 26th question
-- lst of emp who have joined in month of feb
select * from EMP where MONTH(HIREDATE)=2;


-- 27th question
-- lst of emp joined between 1981 and 1983
select COUNT(*) as EMP_COUNT from EMP where HIREDATE BETWEEN '1981-01-01' AND '1983-12-31';

 
-- 28th question
-- lst how many years of service completed by each emp 
-- arrange based on tenure highest to lowest
select ENAME,YEAR(NOW())-YEAR(HIREDATE) AS 'TENURE' from EMP ORDER BY TENURE DESC;
