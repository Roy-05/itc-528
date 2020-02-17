/*
--------------------------------------
Chapter 5, Lesson A, Page 211: Ex5A-5.
--------------------------------------
*/

declare
cursor product_cur is 
    select product.product_name, count(order_details.product_id) as pdt_ct
    from order_details
    full outer join product on
    product.product_id = order_details.product_id
    group by order_details.product_id, product.product_name, product.product_id
    order by product.product_id asc;
    
product_row product_cur%rowtype;
demand_status varchar2(15);

begin
open product_cur;

dbms_output.put_line(rpad('Product Name', 25) || 'Demand Status');
dbms_output.put_line(rpad('------------', 25) || '-------------');
loop
    fetch product_cur into product_row;
    exit when product_cur%notfound;
    
    if product_row.pdt_ct >= 2 then
        demand_status := 'High Demand';
    else
        demand_status := 'Low Demand';
        update product
        set price = price - 1
        where product.product_name = product_row.product_name;
    end if;
    
    dbms_output.put_line(rpad(product_row.product_name,25 ) || demand_status);
end loop;
end;