/*
---------------------------------------
 Chapter 5, Lesson C, page 263: Ex5C-5.
---------------------------------------
*/

create or replace trigger product_reorder_au
before update on product
for each row
when (new.quantity_in_stock < old.reorder_point)
begin
    insert into purchase_order(po_no, po_date, product_id, quantity, supplier_id)
    values (
        'PO' || po_sequence.nextval,
        sysdate,
        :old.product_id,
        :old.reorder_qty,
        :old.supplier_id
        );
end;

/*
---------------------------------------
Chapter 5, Lesson C, page 265: Ex5C-20.
---------------------------------------
*/

create or replace trigger hotel_kids_rule
before insert or update on hotel_reservation
for each row
when(new.num_kids > 0)
begin
    :new.bed_type := 'DQ';
end;
