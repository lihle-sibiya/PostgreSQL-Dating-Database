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
INSERT INTO public.zip_code (zip_code, city, province)
VALUES
    (1001, 'City1', 'Province1'),
    (2002, 'City2', 'Province2'),
    (3003, 'City3', 'Province3');