/*
--------------------------------------
Chapter 5, Lesson B, page 235: Ex5B-8.
--------------------------------------
*/

create or replace function ex5b_supplier_exist(supp_id_1 in varchar2, supp_id_2 in varchar2)
return boolean as

supp_ctr integer;

begin

select count(*) 
    into supp_ctr
    from supplier
    where 
        supplier_id = supp_id_1 or 
        supplier_id = supp_id_2;
        
if supp_ctr > 1 then
    return true;
else 
    return false;
end if;
end;

create or replace procedure ex5b_supplier_update(supp_id_1 in varchar2, supp_id_2 in varchar2)
as

cursor supplier_cur is
    select supplier_id, product_id
    from product;
    
supplier_row supplier_cur%rowtype;

cursor updated_supplier is
    select product_id
    from product
    where product_id = supplier_row.product_id;

updated_supplier_row updated_supplier%rowtype;

begin
open supplier_cur;

if ex5b_supplier_exist(supp_id_1, supp_id_2) = false then
    dbms_output.put_line('Invalid Suppliers. Run program unit again!');
    
else
    dbms_output.put_line('Product_ID');
    dbms_output.put_line('----------');

    loop
        fetch supplier_cur into supplier_row;
        exit when supplier_cur%notfound;
        
        if supplier_row.supplier_id = supp_id_1 then
            update product 
                set supplier_id = supp_id_2
                where supplier_id = supplier_row.supplier_id;
        
            update purchase_order 
                set supplier_id = supp_id_2
                 where supplier_id = supplier_row.supplier_id;
            
            for updated_supplier_row in updated_supplier
            loop
                dbms_output.put_line(updated_supplier_row.product_id);
            end loop;
        end if;
    end loop;
end if;

close supplier_cur;
end;

