# 🚀 Continuous Performance Monitoring and Optimization

This task focuses on continuously analyzing and improving query performance using tools like `EXPLAIN ANALYZE`, `SHOW PROFILE`, and schema tuning strategies.

---

## 🎯 Objective

- Monitor the performance of frequently used queries.
- Identify performance bottlenecks using tools such as `EXPLAIN ANALYZE`.
- Suggest and implement schema-level improvements such as:
  - New indexes
  - Schema refactors
  - Query rewrites

---

## 🔍 Tools Used

- `EXPLAIN` — Shows the query execution plan.
- `EXPLAIN ANALYZE` — (or simulated equivalent) helps understand row-by-row cost.
- `SHOW PROFILE` — For runtime statistics (MySQL-specific).

---

## 🧪 Sample Queries Analyzed

### 1. Retrieve bookings by user
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = '123e4567-e89b-12d3-a456-426614174000';
