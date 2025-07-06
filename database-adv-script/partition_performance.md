# 📊 Booking Table Partitioning

This task demonstrates the use of table partitioning on the `Booking` table to improve performance for large datasets.

---

## ✅ Why Partitioning?

When the `Booking` table grows large, queries filtering by `start_date` (e.g., by year) become slower.

To optimize performance, we partitioned the table by `YEAR(start_date)`.

---

## ⚙️ Implementation

We recreated the `Booking` table using MySQL's `PARTITION BY RANGE` syntax:

```sql
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p_2022 VALUES LESS THAN (2023),
  PARTITION p_2023 VALUES LESS THAN (2024),
  PARTITION p_2024 VALUES LESS THAN (2025),
  PARTITION p_future VALUES LESS THAN MAXVALUE
);
