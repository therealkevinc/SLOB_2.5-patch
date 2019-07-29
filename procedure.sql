-- 
-- This file is a part of SLOB - The Simple Database I/O Testing Toolkit for Oracle Database
--
-- Copyright (c) 1999-2017 Kevin Closson and Kevin Closson d.b.a. Peak Performance Systems
--
-- The Software
-- ------------
-- SLOB is a collection of software, configuration files and documentation (the "Software").
--
-- Use
-- ---
-- Permission is hereby granted, free of charge, to any person obtaining a copy of the Software, to
-- use the Software. The term "use" is defined as copying, viewing, modifying, executing and disclosing
-- information about use of the Software to third parties.
--
-- Redistribution
-- --------------
-- Permission to redistribute the Software to third parties is not granted. The Software           
-- is obtainable from kevinclosson.net/slob. Any redistribution of the Software to third parties
-- requires express written permission from Kevin Closson.
--
-- The copyright notices and permission notices shall remain in all copies of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
-- BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.


WHENEVER OSERROR EXIT FAILURE ;
WHENEVER SQLERROR EXIT SQL.SQLCODE ;

grant execute on sys.dbms_flashback to user1;

create or replace procedure user1.slobupdate (pv_random PLS_INTEGER, pv_work_unit PLS_INTEGER, pv_redo_stress VARCHAR2)
authid current_user
AS 
  SCN varchar2(128);
BEGIN

SCN:=rpad(to_char(dbms_flashback.get_system_change_number),20,'A')||'AAAABBBBBBBBAAAAAAAABBBBBBBBAAAAAAAABBBBBBBBAAAAAAAABBBBBBBBAAAAAAAABBBBBBBBAAAAAAAABBBBBBBBAAAAAAAABBBBBBBB';

IF ( pv_redo_stress = 'HEAVY' ) THEN
        UPDATE cf1 SET
        c2  =  SCN,
        c3  =  SCN,
        c4  =  SCN,
        c5  =  SCN,
        c6  =  SCN,
        c7  =  SCN,
        c8  =  SCN,
        c9  =  SCN,
        c10  = SCN,
        c11  = SCN,
        c12  = SCN,
        c13  = SCN,
        c14 =  SCN,
        c15 =  SCN,
        c16 =  SCN,
        c17 =  SCN,
        c18 =  SCN,
        c19 =  SCN,
        c20 =  SCN
        WHERE  custid >  ( pv_random - pv_work_unit ) AND  ( custid < pv_random);
        COMMIT;
ELSE

        UPDATE cf1 SET
        c2  = SCN,
        c20 = SCN
        WHERE  ( custid >  ( pv_random - pv_work_unit )) AND  (custid < pv_random);
        COMMIT;
END IF;
END slobupdate;
/
SHOW ERRORS

EXIT;
