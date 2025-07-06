-- Drop the original table if it exists
DROP TABLE IF EXISTS Booking;

-- Recreate Booking table with partitioning by RANGE on YEAR(start_date)
CREATE TABLE Booking (
  booking_id UUID NOT NULL PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p_2022 VALUES LESS THAN (2023),
  PARTITION p_2023 VALUES LESS THAN (2024),
  PARTITION p_2024 VALUES LESS THAN (2025),
  PARTITION p_future VALUES LESS THAN MAXVALUE
);



-- Sample query to test performance on partitioned table
EXPLAIN SELECT * FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
