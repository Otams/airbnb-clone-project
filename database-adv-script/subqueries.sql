-- Subquery

SELECT 
  property_id,
  name,
  location,
  pricepernight
FROM Property
WHERE property_id IN (
  SELECT property_id
  FROM Review
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);


--- Correlated Subquery

SELECT 
  user_id,
  first_name,
  last_name,
  email
FROM User u
WHERE (
  SELECT COUNT(*)
  FROM Booking b
  WHERE b.user_id = u.user_id
) > 3;


/*
## Subquery task using Joins

SELECT 
  p.property_id,
  p.name,
  p.location,
  p.pricepernight,
  AVG(r.rating) AS average_rating
FROM Property p
JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name, p.location, p.pricepernight
HAVING AVG(r.rating) > 4.0;


## Correlated Subquery using Joins

SELECT 
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  COUNT(b.booking_id) AS total_bookings
FROM User u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email
HAVING COUNT(b.booking_id) > 3;

*/