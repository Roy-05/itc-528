create or replace procedure ex8a4_create_club as
begin

insert into sporting_clubs (club_id, name, street, city, state, zip)
values (
    club_sequence.nextval,
    'Saket''s Awesome Club',
    '78, Rajdanga Nabapally',
    'Kolkata',
    'WB',
    70010);
    
end;
    