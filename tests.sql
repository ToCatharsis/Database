--Testowanie funkcji zwracajacej koszt wszystkich uslug dodatkowych:
SELECT ad_serv_price(101) FROM dual;
SELECT ad_serv_price(103) FROM dual;

--Testowanie funkcji zwracajacej zwracajacej ostateczny koszt zakwaterowania i obslugi dla danego goscia:
SELECT get_total_price(101) FROM dual;
SELECT get_total_price(102) FROM dual;
SELECT get_total_price(103) FROM dual;

--Testowanie procedury, która zmienia stanowisko pracownika:
SELECT e.employee_id, e.position_id, p.salary FROM employees e LEFT JOIN payroll p ON(e.employee_id=p.employee_id);
DECLARE
v_position_id_f employees.employee_id%TYPE;
v_position_id_s employees.position_id%TYPE;
BEGIN
 SELECT position_id INTO v_position_id_f FROM employees WHERE employee_id = 101;
 SELECT position_id INTO v_position_id_s FROM employees WHERE employee_id = 102;
 update_pos(101, v_position_id_s);
 update_pos(102, v_position_id_f);
END;
/
SELECT e.employee_id, e.position_id, p.salary FROM employees e LEFT JOIN payroll p ON(e.employee_id=p.employee_id);

--Testowanie procedury, która zmienia znizke w zaleznosci od ilosci uslug dodatkowych:
SELECT reservation_id, discount_percent FROM reservations;
select *
from ADDITIONAL_SERVICES_ORDERS;
DECLARE
v_guest_id INTEGER := 101;
v_reservation_id INTEGER;
BEGIN
    INSERT INTO additional_services_orders (aso_id, guest_id, service_id, order_date)
        VALUES (105, v_guest_id, 101, TO_DATE('2022-01-03', 'yyyy/mm/dd'));
    SELECT reservation_id INTO v_reservation_id FROM reservations WHERE guest_id = v_guest_id;
    update_disc(v_reservation_id);
END;
/
SELECT reservation_id, discount_percent FROM reservations;

-- -- Testowanie wyzwalacza, ktory monitoruje czy placa pracownika miesci sie w zakresie przewidzianym przez stanowisko:
update payroll set salary = 83000 where employee_id=102;
update payroll set salary = 70000 where employee_id=103;
update payroll set salary = 33400 where employee_id=107;

-- Testowanie wyzwalacza reservation_cost_monitor:
insert into additional_services_orders (aso_id, guest_id, service_id, order_date)
values (104, 101, 105, TO_DATE('2022-01-03', 'yyyy-mm-dd'));

-- --Zapytanie zwracajace informacje o pracownikach takie jak: imiê i nazwisko, stanowisko oraz wynagrodzenie, jezeli ich zarobki sa wyzsze od srednich
select e.first_name ||' '|| e.last_name as employee, e.job_title as position, p.salary
from employees e join payroll p using(employee_id)
where p.salary > (select avg(salary) from payroll);

-- --Zapytanie zwracajace liste klientów wraz z laczna liczba zamowien
select g.first_name || ' ' || g.last_name as guest, count(a.service_id) as order_count
from guests g join additional_services_orders a using(guest_id)
group by g.first_name, g.last_name
order by count(a.service_id) desc;

--Zapytanie zwracajace pokoje i daty ich rezerwacji
select r.room_number, r.room_availability, t.room_type_name, res.check_in, res.check_out
from room_reservation rr right join rooms r on(r.room_number=rr.room_number) left join reservations res on(rr.reservation_id=res.reservation_id) join room_types t on(r.room_type_id=t.rt_id)
order by t.room_type_name;
select *
from RESERVATIONS;
insert into RESERVATIONS (RESERVATION_ID, GUEST_ID, CHECK_IN, CHECK_OUT) values (104,102,TO_DATE(sysdate, 'yyyy-mm-dd'),TO_DATE('2023-01-20', 'yyyy-mm-dd'));

-- Test dla procedury get_guest_services
declare
    v_guest_id ADDITIONAL_SERVICES_ORDERS.guest_id%type;
begin
    select GUEST_ID into v_guest_id from ADDITIONAL_SERVICES_ORDERS group by GUEST_ID order by count(GUEST_ID) desc fetch first 1 rows only;
    GET_GUEST_SERVICES(v_guest_id);
end;