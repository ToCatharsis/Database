create table room_types
(
    rt_id   integer primary key,
    room_type_name varchar2(30)
);

create table rooms
(
    room_number       number(3) primary key,
    room_type_id      integer      not null references room_types (rt_id),
    number_of_beds    number(1)    not null,
    price_per_night   number(5, 2) not null,
    room_availability varchar2(10) not null
);

create table amenities
(
    amenity_id   integer primary key,
    amenity_name varchar(50) not null
);

create table room_amenity
(
    ra_id          integer primary key,
    room_number integer not null,
    amenity_id  integer not null,
    foreign key (room_number) references rooms (room_number),
    foreign key (amenity_id) references amenities (amenity_id)
);

create table additional_services
(
    as_id  int primary key,
    name        varchar2(30)  not null,
    description varchar2(255) not null,
    price       number(5, 2)
);

create table guests
(
    guest_id     integer primary key,
    first_name   varchar2(20) not null,
    last_name    varchar2(20) not null,
    address      varchar2(30) not null,
    phone_number varchar2(15) not null
);

create table reservations
(
    reservation_id   int primary key,
    guest_id         int references guests (guest_id),
    check_in         date not null,
    check_out        date not null,
    discount_percent int,
    total_price      number(10, 2)
);

create table opinions
(
    opinion_id           int primary key,
    guest_id     int references guests (guest_id),
    opinion      varchar2(255) not null,
    score        int           not null,
    opinion_date date          not null
);

create table additional_services_orders
(
    aso_id         int primary key,
    guest_id   int references guests (guest_id),
    service_id int references additional_services (as_id),
    order_date date not null
);

create table room_reservation
(
    rr_id             int primary key,
    reservation_id int references reservations (reservation_id),
    room_number    number(3) references rooms (room_number)
);

create table positions
(
    position_id int primary key,
    name        varchar2(30)  not null,
    min_salary  number(10, 2) not null,
    max_salary  number(10, 2) not null
);

create table employees
(
    employee_id integer primary key,
    first_name  varchar2(20) not null,
    last_name   varchar2(20) not null,
    job_title   varchar2(30) not null,
    phone       varchar2(15) not null,
    position_id int references positions (position_id)
);

create table payroll
(
    payroll_id integer primary key,
    salary      number(10, 2) not null,
    employee_id int references employees (employee_id)
);


-- Sekcja dla usunięcia tabel
-- drop table room_types cascade constraints;
-- drop table rooms cascade constraints;
-- drop table amenities cascade constraints;
-- drop table room_amenity cascade constraints;
-- drop table additional_services cascade constraints;
-- drop table guests cascade constraints;
-- drop table reservations cascade constraints;
-- drop table opinions cascade constraints;
-- drop table additional_services_orders cascade constraints;
-- drop table room_reservation cascade constraints;
-- drop table positions cascade constraints;
-- drop table employees cascade constraints;
-- drop table payroll cascade constraints;