# data_analysis

This repository contains a data analysis project for LT. The goal is to find the maximum hour of operation and the intensity of operation during that hour. Additionally, it provides a breakdown of operations. It also builds a plot "Sum of Count of Operations Over Time"

## Prerequisites

- Oracle 21c
- `create_table.sql` to create the necessary table
- `populate_table.sql` to populate the table

## Usage

1. Run the SQL query mentioned below to generate the `data.csv` file.
2. Export the results from SQL Developer as a CSV file.

```sql
select to_char(o.datetime,'YYYY-MM-DD HH24'), o.operation_name, count(o.operation_name)
from operations o
group by to_char(o.datetime,'YYYY-MM-DD HH24'), o.operation_name
order by to_char(o.datetime,'YYYY-MM-DD HH24') asc;
