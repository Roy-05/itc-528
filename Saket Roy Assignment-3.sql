/*
----------------------------------------
Chapter 4, Lesson B, page 146: Ex 4B-11.
----------------------------------------
*/

select product.product_name, count(*) from purchase_order, product
where product.product_id = purchase_order.product_id
group by purchase_order.product_id, product.product_name;

/*
----------------------------------------
Chapter 4, Lesson B, page 146: Ex 4B-13.
----------------------------------------
*/

select product.supplier_id, supplier.name, count(*) from product, supplier
where supplier.supplier_id = product.supplier_id
group by product.supplier_id, supplier.name
having count(*) > 2
order by count(*) asc;

/*
----------------------------------------
Chapter 4, Lesson B, page 147: Ex 4B-22.
----------------------------------------
*/

select invoice_no from rental_invoice
where invoice_date 
between to_date('01-NOV-10', 'dd-mon-yy') 
and to_date('30-NOV-10', 'dd-mon-yy');

/*
----------------------------------------
Chapter 4, Lesson C, page 169: Ex 4C-5.
----------------------------------------
*/

select product_order.order_id, first_name, last_name 
from customer, product_order
where customer.customer_id = product_order.customer_id 
and product_order.ship_date - product_order.order_date < 5;