---- Muhammad Faisal Ali Hafidz ----
---- 1251420086 ----
---- UTS_SistemBasisData ----

CREATE TABLE state (
    "namestate" VARCHAR(100) NOT NULL,
    "region" VARCHAR(100) NOT NULL,
    CONSTRAINT state_pk PRIMARY KEY ("namestate")
);

CREATE TABLE congress_person (
    "congress_id" NUMERIC NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "district" NUMERIC NOT NULL,
    "startdate" DATE NOT NULL,
    "party" VARCHAR(100) NOT NULL,
    "statename" VARCHAR(100) NOT NULL,
    "state_namestate" VARCHAR(100) NOT NULL,
    CONSTRAINT congress_person_pk
        PRIMARY KEY ("congress_id"),
    CONSTRAINT congress_person_state_fk
        FOREIGN KEY ("state_namestate")
        REFERENCES state ("namestate")
);

CREATE TABLE sponsor (
    "congress_id" NUMERIC NOT NULL,
    "bill_id" NUMERIC NOT NULL,
    "congress_person_congress_id" NUMERIC NOT NULL,
    CONSTRAINT sponsor_pk
        PRIMARY KEY ("congress_id", "bill_id"),
    CONSTRAINT sponsor_congress_person_fk
        FOREIGN KEY ("congress_person_congress_id")
        REFERENCES congress_person ("congress_id")
);

CREATE TABLE vote (
    "congress_id" NUMERIC NOT NULL,
    "bill_id" NUMERIC NOT NULL,
    "vote" VARCHAR(100),
    "congress_person_congress_id" NUMERIC NOT NULL,
    CONSTRAINT vote_pk
        PRIMARY KEY ("congress_id", "bill_id"),
    CONSTRAINT vote_congress_person_fk
        FOREIGN KEY ("congress_person_congress_id")
        REFERENCES congress_person ("congress_id")
);

CREATE TABLE bill (
    "bill_id" NUMERIC NOT NULL,
    "billname" VARCHAR(100) NOT NULL,
    "date_of_vote" DATE NOT NULL,
    "passedorfailed" VARCHAR(100) NOT NULL,
    "vote_congress_id" NUMERIC NOT NULL,
    "vote_bill_id" NUMERIC NOT NULL,
    "sponsor_congress_id" NUMERIC NOT NULL,
    "sponsor_bill_id" NUMERIC NOT NULL,
    CONSTRAINT bill_pk
        PRIMARY KEY ("bill_id"),
    CONSTRAINT bill_sponsor_fk
        FOREIGN KEY ("sponsor_congress_id", "sponsor_bill_id")
        REFERENCES sponsor ("congress_id", "bill_id"),
    CONSTRAINT bill_vote_fk
        FOREIGN KEY ("vote_congress_id", "vote_bill_id")
        REFERENCES vote ("congress_id", "bill_id")
);
