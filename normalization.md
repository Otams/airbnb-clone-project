# Database Normalization: Airbnb Database (3NF)

This document outlines how the Airbnb database schema satisfies the principles of normalization up to the Third Normal Form (3NF).

---

## 🔹 First Normal Form (1NF)

All tables in the schema have:
- Atomic (indivisible) values
- Unique primary keys
- No repeating groups

Therefore, the database satisfies 1NF.

---

## 🔹 Second Normal Form (2NF)

All tables either:
- Have a single-attribute primary key
- Or, in the case of compound keys, have all non-key attributes fully dependent on the whole key

There are no partial dependencies.

Therefore, the database satisfies 2NF.

---

## 🔹 Third Normal Form (3NF)

All non-key attributes are:
- Fully functionally dependent on the primary key
- Not transitively dependent on any other non-key attribute

No derived or redundant data exists.

Therefore, the schema satisfies 3NF.

---

## Summary

The Airbnb database schema (User, Property, Booking, Payment, Review, and Message) has been designed with normalization in mind and is fully compliant with 3NF.
