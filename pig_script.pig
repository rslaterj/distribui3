-- Load data into Pig --
branch_data = LOAD '/user/hadoop/csv/trace.csv' USING PigStorage(',')
              AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

-- Total number of records --
total_records = FOREACH (GROUP branch_data ALL) GENERATE COUNT(branch_data);
DUMP total_records;

-- Frequency of each branch type --
branch_freq = GROUP branch_data BY branch_type;
branch_freq = FOREACH branch_freq GENERATE group AS branch_type, COUNT(branch_data) AS frequency;
DUMP branch_freq;

-- Relationship between branch types and 'taken' value --
taken_freq = GROUP branch_data BY (branch_type, taken);
taken_freq = FOREACH taken_freq GENERATE group AS (branch_type, taken), COUNT(branch_data) AS frequency;
DUMP taken_freq;

-- Random query with approximately 1-hour sample size --
sample_branch_data = SAMPLE branch_data 10000000;
DUMP sample_branch_data;
