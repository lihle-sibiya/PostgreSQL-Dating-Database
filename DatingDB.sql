-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.my_contacts
(
    contact_id bigserial,
    last_name character varying,
    first_name character varying,
    phone integer,
    email character varying,
    gender character varying,
    birthday date,
    profession character varying,
    city character varying,
    province character varying,
    status character varying,
    interests character varying,
    seeking boolean,
    prof_id integer,
    zip_code integer,
    status_id integer,
    PRIMARY KEY (contact_id),
    CONSTRAINT profession_unique UNIQUE (profession)
);

CREATE TABLE IF NOT EXISTS public.profession
(
    prof_id bigserial,
    profession character varying,
    PRIMARY KEY (prof_id)
);

CREATE TABLE IF NOT EXISTS public.zip_code
(
    zip_code integer,
    city character varying,
    province character varying,
    PRIMARY KEY (zip_code),
    CONSTRAINT zip_code_check CHECK (zip_code >= 1000 AND zip_code <= 9999)
);

CREATE TABLE IF NOT EXISTS public.status
(
    status_id bigserial,
    status character varying,
    PRIMARY KEY (status_id)
);

CREATE TABLE IF NOT EXISTS public.contact_interest
(
    contact_id bigserial,
    interest_id integer,
    PRIMARY KEY (contact_id)
);

CREATE TABLE IF NOT EXISTS public.contact_seeking
(
    contact_id bigserial,
    seeking_id integer,
    PRIMARY KEY (contact_id)
);

CREATE TABLE IF NOT EXISTS public.interests
(
    interest_id bigserial,
    interest integer,
    PRIMARY KEY (interest_id)
);

CREATE TABLE IF NOT EXISTS public.seeking
(
    seeking_id bigserial,
    seeking integer,
    PRIMARY KEY (seeking_id)
);

ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (prof_id)
    REFERENCES public.profession (prof_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (zip_code)
    REFERENCES public.zip_code (zip_code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (status_id)
    REFERENCES public.status (status_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_interest
    ADD FOREIGN KEY (contact_id)
    REFERENCES public.my_contacts (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_interest
    ADD FOREIGN KEY (interest_id)
    REFERENCES public.interests (interest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_seeking
    ADD FOREIGN KEY (contact_id)
    REFERENCES public.my_contacts (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_seeking
    ADD FOREIGN KEY (seeking_id)
    REFERENCES public.seeking (seeking_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;

--INSERT values in tables
INSERT INTO profession (profession)
VALUES
    ('Software Developer'),
    ('Advocate'),
    ('Lecturer'),
    ('Cashier'),
    ('Financial Advisor'),
    ('Architect'),
    ('Civil Engineer'),
    ('Administrator'),
    ('Researcher'),
    ('Clerk'),
    ('Actuary'),
    ('Chartered Accountant'),
    ('Internal Auditor'),
    ('Language Specialist'),
    ('Psychologist'),
    ('Medical Doctor');

INSERT INTO zip_code (zip_code, city, province)
VALUES
    (4000,'Durban','KwaZulu Natal'),
    (3200,'Pietermaritzburg','KwaZulu Natal'),
    (2196,'Johannesburg ','Gauteng'),
    (1157,'Pretoria','Gauteng'),
    (7925,'Cape Town','Western Cape'),
    (6530,'George','Western Cape'),
    (6003,'Gqeberha','Eastern Cape'),
    (5100,'Mthatha','Eastern Cape'),
    (8800,'Upington','Northern Cape'),
    (8301,'Kimberley','Northern Cape'),
    (2351,'Ermelo','Mpumalanga'),
    (1211,'Mbombela','Mpumalanga'),
    (2610,'Ottosdal','North West'),
    (2743,'Mahikeng','North West'),
    (9700,'Bethlehem ','Free State'),
    (9873,'Qwaqwa','Free State'),
    (1480,'Bela-Bela','Limpopo'),
    (9970,'Venda','Limpopo');
  

INSERT INTO status (status)
VALUES
    ('Single'),
    ('Dating'),
    ('Complicated');
	
ALTER TABLE interests
ALTER COLUMN interest TYPE varchar (50);

INSERT INTO interests (interest)
VALUES
    ('Reading'),
    ('Hiking'),
    ('Shark Diving'),
    ('Scuba Diving'),
    ('Swimming'),
    ('Dancing'),
    ('Water Polo'),
    ('Music'),
    ('Canoeing'),
    ('Zip Lining'),
    ('River Rafting'),
    ('Painting'),
    ('Yoga'),
    ('Gym'),
    ('Drawing');

ALTER TABLE seeking
ALTER COLUMN seeking TYPE varchar (50);

INSERT INTO seeking (seeking)
VALUES
    ('Companionship'),
    ('A best friend'),
    ('A lifetine friend'),
    ('Loyal spouse'),
    ('Marriage partner'),
    ('A partner in crime');

--rename columns
ALTER TABLE my_contacts
RENAME COLUMN status TO status_;


SELECT * FROM my_contacts
SELECT * FROM profession
SELECT * FROM zip_code
SELECT * FROM status
SELECT * FROM contact_interest
SELECT * FROM contact_seeking
SELECT * FROM interests
SELECT * FROM seeking

ALTER TABLE my_contacts
ALTER COLUMN seeking TYPE varchar (50);

INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, profession, city, province, interests, seeking )
VALUES
    ('Motladi', 'Seseko', 0785671234, 'seseko@abc.com', 'male', '01/08/1990', 'Advocate', 'Johannesburg', 'Gauteng', 'Swimming', 'Marriage Partner' );
	
	
INSERT INTO my_contacts (status_, prof_id, zip_code, status_id)
VALUES
    ('Single', 34, 2196, 4 );	
	
	
UPDATE my_contacts
SET status_ = 'Single', prof_id = 34, zip_code = 2196, status_id = 4
WHERE last_name = 'Motladi';

ALTER TABLE my_contacts
ALTER COLUMN phone TYPE varchar (50);

UPDATE my_contacts
SET phone = '0798672312'
WHERE last_name = 'Motladi';

SELECT * FROM my_contacts
SELECT * FROM profession
SELECT * FROM zip_code
SELECT * FROM status
SELECT * FROM contact_interest
SELECT * FROM contact_seeking
SELECT * FROM interests
SELECT * FROM seeking

UPDATE my_contacts
SET phone = last_name = 'Sally', first_name = 'Zulu', phone = '0828672311', email = 'seseko@abc.com', gender ='female', birthday = '20/09/1991', profession = 'Software Developer', city = 'Pretoria', province = 'Gauteng', status_ = 'Dating',  interests = 'Reading', seeking = 'Companionship', prof_id = 33, zip_code = 1157, status_id = 5
WHERE contact_id = 2;

