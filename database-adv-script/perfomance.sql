-- Initial query with realistic filters using WHERE and AND
SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  b.status,
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  p.property_id,
  p.name AS property_name,
  p.location,
  pay.payment_id,
  pay.amount,
  pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' AND p.location = 'Lagos';




-- Analyze performance of the initial query
EXPLAIN SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  b.status,
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  p.property_id,
  p.name AS property_name,
  p.location,
  pay.payment_id,
  pay.amount,
  pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' AND p.location = 'Lagos';



-- Optimized version (fewer columns, efficient joins)
SELECT 
  b.booking_id,
  b.start_date,
  b.status,
  u.first_name,
  u.email,
  p.name AS property_name,
  pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
