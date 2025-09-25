-- allow tablespaces with empty location so that we can
-- 1) test LOCATION, but
-- 2) not have to create a directory on the filesytem to match LOCATION
SET allow_in_place_tablespaces = true;

-- create a tablespace using WITH clause
CREATE TABLESPACE regress_tblspacewith LOCATION '' WITH (random_page_cost = 3.0); -- ok

-- see that the tablespace ddl is correctly returned
SELECT pg_get_tablespace_ddl('regress_tblspacewith');

-- drop the tablespace
DROP TABLESPACE regress_tblspacewith;

