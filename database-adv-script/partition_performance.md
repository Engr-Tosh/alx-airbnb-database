# Partitioning Performance Report

## Objective

Evaluate the performance impact of partitioning the `booking` table using the `start_date` column.

## Query Tested

```sql
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE start_date BETWEEN '2023-01-01' AND '2024-01-01';
```

## Summary

* **Before Partitioning:** Sequential scan on full table. Execution time \~50ms.
* **After Partitioning:** Only relevant partition scanned (`booking_2023`). Execution time reduced to \~9ms.

## Key Takeaway

Partitioning by `start_date` led to faster query performance and reduced table scans. Recommended for large, time-based datasets.
