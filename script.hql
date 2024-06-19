-- Create the table
CREATE TABLE branches (
                          branch_addr STRING,
                          branch_type STRING,
                          taken INT,
                          target STRING
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
    STORED AS TEXTFILE;

-- Load data into the table from the local filesystem
LOAD DATA LOCAL INPATH '/trace.csv' INTO TABLE branches;
