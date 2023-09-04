# Read Only mode for databases: If this is activated we cannot modify the database but we can access the data within.

CREATE DATABASE MYDB;
USE MYDB;

-- By defualt read only mode is disabled, to actiavte it I set "read only=1" mode so that Database now cannot be modified.
ALTER DATABASE MYDB READ ONLY = 1;

-- If I try to drop my database it will show me an error saying "Schema 'mydb' is in read only mode"
DROP DATABASE MYDB;

-- Now I set "read only=0" and try to drop database and it actually drops the database.
ALTER DATABASE MYDB READ ONLY = 0;
DROP DATABASE MYDB;