/*
*************************************************************************************
assignment 4
CS 460
Saud Aljandal 
1/22/2018
*************************************************************************************
*/



SELECT * FROM item;
SELECT * FROM customer;
select * from cart;
select * from cartitem;


-- 1. Determine the number of items and total price for of all items that exist. 
SELECT count(name), sum(price) FROM item;

-- 2. Show each customer with all of their cart ids.
SELECT name ,cart.id from customer
JOIN cart
on customer.id = cart.customer_id;


-- 3 show each customer with the number of carts they have.
select name, count(cart.id)
from customer
 join cart
on customer.id = cart.customer_id
-- group by count(cartitem.cart_id)
group by name;


-- 4 Show each customer with the ids for the items they've purchased. Join cust by cart table
select customer.name, cartitem.item_id
from customer 
join cart 
on customer.id = cart.customer_id 
join cartitem
on cart.id = cartitem.cart_id;


-- 5 Show each customer with the names of the items they've purchased
select customer.name, item.name
from customer 
join cart 
on customer.id = cart.customer_id 
join cartitem
on cart.id = cartitem.cart_id
join item
on item_id = item.id;


-- 6 Determine the amount of money each customer has spent.  HINT: group by customers and sum prices * qty.
select customer.name, sum(item.price * cartitem.qty)
from customer 
join cart 
on customer.id = cart.customer_id 
join cartitem
on cart.id = cartitem.cart_id
join item
on item_id = item.id
group by customer.name;

-- 7 Determine the number of different items bought per customer
select customer.name, count(item.name)
from customer 
join cart 
on customer.id = cart.customer_id 
join cartitem
on cart.id = cartitem.cart_id
join item
on item_id = item.id
group by customer.name;


-- 8 Per customer, determine the cost of the most expensive item
select customer.name, max(item.price)
from customer 
join cart 
on customer.id = cart.customer_id 
join cartitem
on cart.id = cartitem.cart_id
join item
on item_id = item.id
group by customer.name;

-- 9 List all customers that don't have any carts.
select name
from customer
where not exists(
select customer_id from cart where cart.customer_id = customer.id);

-- 10 List all items that do not appear in any shopping cart. 
select name
from item
where not exists(
select item_id from cartitem where item_id = item.id);