# TCL (Transaction Control Language)
-- There are 3 TCL commands
	-- 1. AUTO COMMIT -- By defualt AUTOCOMMIT is set to 1,  that means any modifcation made in the tabke that will directly save.
					  -- If it set to 0, then modification are not save automatically to save modification we need to use "Commit" after query.
                      
	-- 2. COMMIT -- commit used to save the transactions or any modifications.
    
    -- 3. ROLLBACK -- Whatever modification we made into tables that is automatically going to save, and whatif we want to undo some of our action? Here we can use rollback.


# if you run the bellow query accidently then you will lose your data and it is not possible to revise this data
-- DELETE FROM EMPLOYEES;

# so to do not lose your data just set your AUTOCOMMIT=0 so that if you run the above query accidently still you can undo your action by using ROLLBACK.
SET AUTOCOMMIT=0;

DELETE FROM EMPLOYEES;
SELECT * FROM EMPLOYEES;
ROLLBACK;
SELECT * FROM EMPLOYEES;

# so now you run the below query and you want to save this so you need to use COMMIT after running the query.
DELETE FROM EMPLOYEES;
COMMIT;
SELECT * FROM EMPLOYEES;

# after saving the transaction you cannot do the rollback.
