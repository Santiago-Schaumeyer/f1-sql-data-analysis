# F1 Data Reconciliation (SQL)

## Objective
Analyze and highlight the performance of Franco Colapinto compared to other drivers, while ensuring data consistency between multiple data sources.

## Description
This project simulates a real-world data reconciliation process using Formula 1 race data. Two systems are compared to detect inconsistencies such as missing records, mismatches, and duplicated entries.

## Business Context
Data reconciliation is widely used in organizations where multiple systems store similar data. This project replicates that scenario using race lap data, similar to real-world data validation workflows.

## Example Output
![Query Result](results/query_result.png)

## Tools
- PostgreSQL (database system)
- SQL (data querying and validation)

## Features
- Detection of missing records across systems
- Identification of mismatched lap times
- Detection of duplicated entries
- Driver performance analysis

## Key Analysis
- Performance comparison of Franco Colapinto vs other drivers
- Average lap time per driver
- Gap to fastest lap per circuit

## Data Validation
- FULL OUTER JOIN for reconciliation
- CASE statements for classification
- Duplicate detection logic

## Database Design
- Normalized schema (pilots, teams, circuits, races)
- Temporal relationship between drivers and teams
- Separate systems to simulate real-world inconsistencies

## Files
- schema.sql: database structure
- inserts.sql: sample data
- queries.sql: analysis and validation queries

## Future Improvements
- Add sector times (S1, S2, S3)
- Include race results (positions)
- Expand dataset with more races and drivers