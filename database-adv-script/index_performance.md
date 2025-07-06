# 📦 Index Optimization for Airbnb Database

This document describes how we identified high-usage columns and applied indexing to improve query performance using SQL's `CREATE INDEX` and `EXPLAIN`.

---

## Identify High-Usage Columns

We analyzed SQL queries from previous tasks (JOINs, WHERE filters, and ORDER BY clauses) to determine which columns are frequently used and would benefit from indexing.

### ✅ User Table
| Column     | Reason |
|------------|--------|
| `user_id`  | Used in JOINs (e.g., with Booking, Review, Message) |
| `email`    | Used in WHERE clauses (e.g., login or uniqueness) |

### ✅ Booking Table
| Column         | Reason |
|----------------|--------|
| `booking_id`   | Primary key (already indexed) |
| `user_id`      | JOIN with User table |
| `property_id`  | JOIN with Property table |
| `status`       | Used in filters (`WHERE status = 'confirmed'`) |
| `created_at`   | Used in date filters or sorting |

### ✅ Property Table
| Column           | Reason |
|------------------|--------|
| `property_id`    | Primary key (already indexed) |
| `host_id`        | JOIN with User table |
| `location`       | Filterable column |
| `pricepernight`  | Often used in sorting or filtering by price |

---

## Index Creation

We created indexes for these high-usage columns in `database_index.sql`:


-- User
CREATE INDEX idx_user_email ON User(email);

-- Booking
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Property
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);

#Observation 
Performance gains were observed using EXPLAIN by reducing rows scanned and enablingindex usage
