use training21;
-- Functions
-- Aggregate sum,avg,min,max,count
-- IPO
-- Inputs parameters
-- process instruction set which works on your inputs
-- output retrun value from your function
-- output may be a single value or table

select empno,ename,sal,comm,sal+comm as 'Total Salary' 
from emp;

-- value+null=null
select empno,ename,sal,comm,sal+ifnull(comm,0) as 'Total Salary' 
from emp;

-- create a function procdure outparatemeters
-- []-->optional
-- semi colon -> mysql ; delimiter end of instruction
-- we have define delimiter for the block of instruction
-- delimiter //
-- begin 
-- statement 1;
-- statement 2;
-- end; //


-- if comm < 500 add 200 sal+comm+200
-- if comm > 500 sal+comm
-- if comm is  null or 0 and sal < max(sal) adding 500 in salary 
 
delimiter //
create function addCommision1(sal decimal(7,2), comm decimal(7,2))
returns int
DETERMINISTIC
begin
	DECLARE RESULT int;
    SET RESULT=0;
	if (comm is null or comm = 0) and sal<(max(SAL))then
		SET RESULT=sal+500;
	elseif comm<500 then
		SET RESULT=sal+200+ifnull(comm,0);
	else
		SET RESULT=sal+ifNull(comm,0);
	end if;
    
    return RESULT;
    
end;//
delimiter ;

select empno,sal,comm,addcommision1(sal,comm) from emp ;


-- Procedure 
-- procedure -> modules 
-- parameters In Out Inout
-- does not return a value like a function
-- delimiter //
-- create procedure prc_demo([in|out parameter <datatype>,[]])
-- begin
-- 	declarations
--     execution
-- end; //
delimiter ;
-- prc_totalSalarydelimiter //
delimiter //
create procedure prc_totalSalary(in sal decimal(7,2),in comm decimal(7,2),out totalsalary decimal(7,2))
begin
	set totalsalary=sal+ifnull(comm,0);
    
end; // 
delimiter ;

CALL prc_totalSalary(5000,500,@totalsalary);
select @totalsalary;