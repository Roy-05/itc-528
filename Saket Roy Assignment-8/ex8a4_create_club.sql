create or replace procedure ex8a4_create_club(
    name in varchar2, 
    street in varchar2, 
    city in varchar2, 
    state in varchar2, 
    zip in number) as

club_name_text sporting_clubs.name%type;
club_id_text sporting_clubs.club_id%type;
begin
    insert into sporting_clubs (club_id, name, street, city, state, zip)
    values (
        club_sequence.nextval,
        name,
        street,
        city,
        state,
        zip);
    select club_sequence.currval into club_id_text from dual;
    select name into club_name_text from sporting_clubs where club_id = club_id_text;
    dbms_output.put_line('New Club ' || club_name_text || ' having ID ' || club_id_text || ' successfully created!');  
end;
    