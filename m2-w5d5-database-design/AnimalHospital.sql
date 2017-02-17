begin transaction;


create table pet_owner
(
	id serial,
	first_name varchar(32) NOT NULL,
	last_name varchar(32) NOT NULL,
	address varchar(16) NOT NULL,
	city varchar(16), 
	state varchar(2),
	CONSTRAINT pk_owner_id PRIMARY KEY (id)
);

create table pet_type
(
	id serial,
	type varchar(16) NOT NULL,
	CONSTRAINT pk_pet_type_id PRIMARY KEY (id)
);

create table invoice
(
	id serial,
	pet_id integer NOT NULL,
	date timestamp NOT NULL,
	CONSTRAINT pk_invoice_id PRIMARY KEY (id)
);
	
create table procedure
(
	id serial,
	invoice_id integer NOT NULL,
	amount real NOT NULL,
	type varchar(32) NOT NULL,
	CONSTRAINT pk_procedure_id PRIMARY KEY (id),
	CONSTRAINT fk_procedure_invoice_id FOREIGN KEY (id) REFERENCES invoice (id)
);

create table pet
(
	id serial,
	owner_id integer NOT NULL,
	pet_type integer NOT NULL,
	name varchar(16) NOT NULL,
	age integer,
	CONSTRAINT pk_pet_id PRIMARY KEY (id),
	CONSTRAINT fk_pet_owner_id 	FOREIGN KEY (id) REFERENCES pet_owner(id),
	CONSTRAINT fk_pet_pet_type FOREIGN KEY (id) REFERENCES pet_type (id),
	CONSTRAINT fk_pet_invoice FOREIGN KEY (id) REFERENCES invoice (id)
);
commit transaction;


