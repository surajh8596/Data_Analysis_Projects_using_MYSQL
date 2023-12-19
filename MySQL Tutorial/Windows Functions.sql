# What Windows functions do?
-- Window functions conduct calculations on a group of linked rows.
-- Windowing functions, unlike aggregate functions, do not combine the results of multiple rows into a single value.
-- Instead, each row retains its original identity, and the calculated result is returned for each row.

# Why to use windows functions?
-- Because the rows are not compressed together, window functions allow you to work with both aggregate and non-aggregate values simultaneously.
-- Window featur'es are also easy to use and understand. That is, they can lessen the  complexity of your queries, making them easier to maintain in the long run.
-- They can also assist with performance difficulties. You can, for example, use a window function instead of a self-join or cross-join.


# Syntax for windows function
-- SELECT <column_1>, <column_2>, <window_function>(expression) OVER 
-- (PARTITION BY <partition_list> ORDER BY<order_list> ROWS frame_clause FROM <table_name>;

-- "Window function" is the name of the window function we wish to apply, such as sum, average, or row number. 
-- "Expression" is the column's name on which the window function should be applied. Depending on the window function used, this may or may not be required.
-- "OVER" simply indicates that this is a window function.
-- "PARTITION BY" partitions the rows, allowing us to define which rows to utilise to compute the window function.
-- "Partition list" is the name of the column(s) by which we want to partition.
-- "ORDER BY" is used to sort the rows within each partition. This is optional and should not be specified.
-- "Order list" is the name of the column(s) to be ordered.
-- If we want to further limit the rows within our partition, we can utilise ROWS. This is optional and is rarely used.
-- The frame clause specifies how much we should offset from our current row.

# Windows function in MySQL
-- 1. CUME_DIST()	: Cumulative distribution value
-- 2. DENSE_RANK()	: Rank of current row within its partition, without gaps
-- 3. FIRST_VALUE()	: Value of argument from first row of window frame
-- 4. LAG()	        : Value of argument from row lagging current row within partition
-- 5. LAST_VALUE()	: Value of argument from last row of window frame
-- 6. LEAD()	    : Value of argument from row leading current row within partition
-- 7. NTH_VALUE()	: Value of argument from N-th row of window frame
-- 8. NTILE()	    : Bucket number of current row within its partition.
-- 9. PERCENT_RANK(): Percentage rank value
-- 10. RANK()	    : Rank of current row within its partition, with gaps
-- 11. ROW_NUMBER()	: Number of current row within its partition


SELECT employee_id, manager_id,
ROW_NUMBER() OVER w AS 'row_number' FROM employees
WINDOW w AS (ORDER BY manager_id);