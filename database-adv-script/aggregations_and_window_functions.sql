SELECT 
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  COUNT(b.booking_id) AS total_bookings
FROM User u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email



-- Windows Function Query

SELECT 
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank_by_bookings
  -- Alternative use 
  -- ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
