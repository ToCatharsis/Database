-- Populate room_types table
INSERT INTO room_types (rt_id, room_type_name)
VALUES (101, 'Standard');
INSERT INTO room_types (rt_id, room_type_name)
VALUES (102, 'Deluxe');
INSERT INTO room_types (rt_id, room_type_name)
VALUES (103, 'Suite');

commit;



-- Populate rooms table
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (101, 101, 1, 100.00, 'Available');
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (102, 101, 2, 120.00, 'Available');
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (103, 102, 1, 150.00, 'Available');
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (104, 102, 2, 170.00, 'Available');
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (105, 103, 1, 200.00, 'Available');
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (106, 103, 2, 220.00, 'Available');
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (107, 101, 3, 150.00, 'Available');
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (108, 101, 3, 150.00, 'Available');
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (109, 101, 3, 150.00, 'Available');
INSERT INTO rooms (room_number, room_type_id, number_of_beds, price_per_night, room_availability)
VALUES (110, 103, 3, 250.00, 'Available');
commit;



-- Populate amenities table
INSERT INTO amenities (amenity_id, amenity_name)
VALUES (101, 'Bar');
INSERT INTO amenities (amenity_id, amenity_name)
VALUES (102, 'Swimming pool');
INSERT INTO amenities (amenity_id, amenity_name)
VALUES (103, 'Gym');

commit;



-- Populate room_amenity table
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (101, 101, 101);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (102, 102, 102);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (103, 103, 102);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (104, 104, 103);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (105, 105, 102);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (106, 105, 103);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (107, 106, 102);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (108, 106, 103);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (109, 107, 101);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (110, 108, 101);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (111, 109, 101);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (112, 110, 101);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (113, 110, 102);
INSERT INTO room_amenity (ra_id, room_number, amenity_id)
VALUES (114, 110, 103);

commit;



-- Populate additional_services table
INSERT INTO additional_services (as_id, name, description, price)
VALUES (101, 'Breakfast', 'Full breakfast served in the dining room', 15.00);
INSERT INTO additional_services (as_id, name, description, price)
VALUES (102, 'Laundry', 'Laundry service for guests'' clothing', 20.00);
INSERT INTO additional_services (as_id, name, description, price)
VALUES (103, 'Airport shuttle', 'Complimentary shuttle service to and from the airport', 25.00);
INSERT INTO additional_services (as_id, name, description, price)
VALUES (104, 'Dry-cleaner', 'Dry-cleaner service for guests clothing', 15.00);
INSERT INTO additional_services (as_id, name, description, price)
VALUES (105, 'Massage', 'In-room massage service', 25.00);

commit;



-- Populate guests table
INSERT INTO guests (guest_id, first_name, last_name, address, phone_number)
VALUES (101, 'John', 'Doe', '123 Main St', '123-456-7890');
INSERT INTO guests (guest_id, first_name, last_name, address, phone_number)
VALUES (102, 'Jane', 'Doe', '456 Park Ave', '123-456-7891');

commit;



-- Populate reservations table
INSERT INTO reservations (reservation_id, guest_id, check_in, check_out, discount_percent, total_price)
VALUES (101, 101, TO_DATE('2022-01-01', 'yyyy/mm/dd'), TO_DATE('2022-01-03', 'yyyy/mm/dd'), 10, 270.00);
INSERT INTO reservations (reservation_id, guest_id, check_in, check_out, discount_percent, total_price)
VALUES (102, 102, TO_DATE('2022-02-01', 'yyyy/mm/dd'), TO_DATE('2022-02-03', 'yyyy/mm/dd'), 15, 295.50);

commit;



-- Populate opinions table
INSERT INTO opinions (opinion_id, guest_id, opinion, score, opinion_date)
VALUES (101, 101, 'Great hotel, would definitely stay here again', 5, TO_DATE('2022-01-03', 'yyyy/mm/dd'));
INSERT INTO opinions (opinion_id, guest_id, opinion, score, opinion_date)
VALUES (102, 102, 'Nice stay, but room service was slow', 4, TO_DATE('2022-02-03', 'yyyy/mm/dd'));

commit;



-- Populate additional_services_orders table
INSERT INTO additional_services_orders (aso_id, guest_id, service_id, order_date)
VALUES (101, 101, 101, TO_DATE('2022-01-02', 'yyyy/mm/dd'));
INSERT INTO additional_services_orders (aso_id, guest_id, service_id, order_date)
VALUES (102, 101, 102, TO_DATE('2022-01-03', 'yyyy/mm/dd'));
INSERT INTO additional_services_orders (aso_id, guest_id, service_id, order_date)
VALUES (103, 102, 103, TO_DATE('2022-02-02', 'yyyy/mm/dd'));

commit;



-- Populate room_reservation table
INSERT INTO room_reservation (rr_id, reservation_id, room_number)
VALUES (101, 101, 101);
INSERT INTO room_reservation (rr_id, reservation_id, room_number)
VALUES (102, 102, 103);

commit;



-- Populate positions table
INSERT INTO positions (position_id, name, min_salary, max_salary)
VALUES (101, 'Manager', 50000.00, 80000.00);
INSERT INTO positions (position_id, name, min_salary, max_salary)
VALUES (102, 'Supervisor', 40000.00, 60000.00);
INSERT INTO positions (position_id, name, min_salary, max_salary)
VALUES (103, 'Front desk clerk', 30000.00, 50000.00);
INSERT INTO positions (position_id, name, min_salary, max_salary)
VALUES (104, 'Driver', 35000.00, 55000.00);
INSERT INTO positions (position_id, name, min_salary, max_salary)
VALUES (105, 'Chambermaid', 30000.00, 50000.00);
INSERT INTO positions (position_id, name, min_salary, max_salary)
VALUES (106, 'Masseur', 45000.00, 60000.00);
INSERT INTO positions (position_id, name, min_salary, max_salary)
VALUES (107, 'Security guard', 30000.00, 40000.00);
INSERT INTO positions (position_id, name, min_salary, max_salary)
VALUES (108, 'Cook', 45000.00, 55000.00);

commit;



-- Populate employees table
INSERT INTO employees (employee_id, first_name, last_name, job_title, phone, position_id)
VALUES (101, 'Alice', 'Smith', 'Manager', '123-456-7892', 101);
INSERT INTO employees (employee_id, first_name, last_name, job_title, phone, position_id)
VALUES (102, 'Bob', 'Johnson', 'Supervisor', '123-456-7893', 102);
INSERT INTO employees (employee_id, first_name, last_name, job_title, phone, position_id)
VALUES (103, 'Charlie', 'Williams', 'Front desk clerk', '123-456-7894', 103);
INSERT INTO employees (employee_id, first_name, last_name, job_title, phone, position_id)
VALUES (104, 'George', 'Brown', 'Driver', '123-222-7373', 104);
INSERT INTO employees (employee_id, first_name, last_name, job_title, phone, position_id)
VALUES (105, 'Elizabeth', 'Jones', 'Chambermaid', '123-384-2535', 105);
INSERT INTO employees (employee_id, first_name, last_name, job_title, phone, position_id)
VALUES (106, 'Somchai', 'Wang', 'Masseur', '123-943-6685', 106);
INSERT INTO employees (employee_id, first_name, last_name, job_title, phone, position_id)
VALUES (107, 'David', 'Anderson', 'Security guard', '123-397-9537', 107);
INSERT INTO employees (employee_id, first_name, last_name, job_title, phone, position_id)
VALUES (108, 'William', 'Taylor', 'Cook', '123-961-1483', 108);

commit;



-- Populate payroll table
INSERT INTO payroll (payroll_id, employee_id, salary)
VALUES (101, 101, 60000.00);
INSERT INTO payroll (payroll_id, employee_id, salary)
VALUES (102, 102, 50000.00);
INSERT INTO payroll (payroll_id, employee_id, salary)
VALUES (103, 103, 40000.00);
INSERT INTO payroll (payroll_id, employee_id, salary)
VALUES (104, 104, 40000.00);
INSERT INTO payroll (payroll_id, employee_id, salary)
VALUES (105, 105, 39000.00);
INSERT INTO payroll (payroll_id, employee_id, salary)
VALUES (106, 106, 57000.00);
INSERT INTO payroll (payroll_id, employee_id, salary)
VALUES (107, 107, 34000.00);
INSERT INTO payroll (payroll_id, employee_id, salary)
VALUES (108, 108, 51000.00);

commit;