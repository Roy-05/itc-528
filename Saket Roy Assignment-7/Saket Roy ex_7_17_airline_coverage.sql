create or replace procedure ex7_17_airline_coverage as

cursor flight_dest_cur is
    select distinct dest_region 
    from flight;

cursor flight_details(dest in varchar2) is 
    select flight_no, name, dest_city 
    from flight
    where dest_region = dest;

flight_dest varchar2(15);

begin
    open flight_dest_cur;
    loop
        fetch flight_dest_cur into flight_dest;
        exit when flight_dest_cur%notfound;

        dbms_output.put_line(chr(10)||chr(13)); -- CRLF for formatting
        
        dbms_output.put_line(rpad('Geographic Region:', 25) || flight_dest);
        dbms_output.put_line('------------------');
        
         dbms_output.put_line(chr(10)||chr(13)); -- CRLF for formatting
         
        dbms_output.put_line(rpad('Carrier', 25) || rpad('Flights', 10) || 'Destination');
        dbms_output.put_line(rpad('-------', 25) || rpad('-------', 10) || '-----------');

        for flight_row in flight_details(flight_dest)
        loop
            dbms_output.put_line(rpad(flight_row.name, 25) || rpad(flight_row.flight_no, 10) || flight_row.dest_city);
        end loop;
    end loop;
    close flight_dest_cur;
end;

