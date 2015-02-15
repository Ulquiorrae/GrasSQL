.header on
PRAGMA foreign_keys = on;

create table if not exists Vehicle(
	vehicle_id integer primary key,
	type varchar(15) not null
);

create table if not exists Driver(
	driver_id integer primary key,
	name varchar(20) not null,
	surname varchar(20) not null,
	age smallint default 18,
	age_work smallint default 1
);

create table if not exists Lines(
	line_id integer  primary key,
	start_line varchar(25) not null,
	end_line varchar(25) not null,
	start_hour smallint default 6,
	interval smallint default 1,
	vehicle_id integer,
	foreign key (vehicle_id) references Vehicle	
);

create table if not exists Shift (
	shift_id integer primary key,
	shift varchar(10) not null
);

create table if not exists Schedule (
	shift_id integer,
	driver_id integer,
	line_id integer,
	foreign key (shift_id) references  Shift,
	foreign key  (driver_id) references Driver,
	foreign key (line_id) references Lines
);
