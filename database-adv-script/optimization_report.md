# SQL Performance Optimization

This task focuses on writing and analyzing a SQL query that retrieves bookings along with associated user, property, and payment details. 
We use `EXPLAIN` to evaluate performance and optimize the query accordingly.

---

## Initial Query

The initial query retrieves:

- All bookings (`Booking`)
- The user who made the booking (`User`)
- The property booked (`Property`)
- Associated payment information (`Payment`)


SELECT 
  b.booking_id, b.start_date, b.end_date, b.status,
  u.user_id, u.first_name, u.last_name, u.email,
  p.property_id, p.name AS property_name, p.location,
  pay.payment_id, pay.amount, pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
