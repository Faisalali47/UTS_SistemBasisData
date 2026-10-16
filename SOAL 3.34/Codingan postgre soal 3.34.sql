--- M. Faisal Ali Hafidz ---
--- 1251420086 ---
--- UTS_SistemBasisData ---

CREATE TABLE Author 
    ( 
     Email      VARCHAR(255)  NOT NULL , 
     firstName  VARCHAR(255)  NOT NULL , 
     lastName   VARCHAR(255)  
    ) 
;

ALTER TABLE Author 
    ADD CONSTRAINT Author_PK PRIMARY KEY ( Email ) ;

CREATE TABLE Paper 
    ( 
     Paper_ID                  INTEGER  NOT NULL , 
     Title                     VARCHAR(255)  NOT NULL , 
     Abstract                  TEXT  NOT NULL , 
     fileName                  VARCHAR(255)  NOT NULL , 
     contactEmail              VARCHAR(255) , 
     Author_Email2             VARCHAR(255)  NOT NULL , 
     Paper_author_Author_email VARCHAR(255)  NOT NULL , 
     Paper_author_Paper_id     INTEGER  NOT NULL , 
     Review_Paper_ID           INTEGER  NOT NULL , 
     Review_Reviewer_email     VARCHAR(255)  NOT NULL 
    ) 
;

ALTER TABLE Paper 
    ADD CONSTRAINT Paper_PK PRIMARY KEY ( Paper_ID ) ;

CREATE TABLE Paper_author 
    ( 
     Author_email  VARCHAR(255)  NOT NULL , 
     Paper_id      INTEGER  NOT NULL , 
     Author_Email2 VARCHAR(255)  NOT NULL 
    ) 
;

ALTER TABLE Paper_author 
    ADD CONSTRAINT Paper_author_PK PRIMARY KEY ( Author_email, Paper_id ) ;

CREATE TABLE Review 
    ( 
     Paper_ID               INTEGER  NOT NULL , 
     Reviewer_email         VARCHAR(255)  NOT NULL , 
     Technical_menit        INTEGER  NOT NULL , 
     Readability            INTEGER  NOT NULL , 
     originallity           INTEGER , 
     Relevance              INTEGER  NOT NULL , 
     overall_Recomenndation VARCHAR(255)  NOT NULL , 
     Comments_commitee      TEXT  NOT NULL , 
     Comments_author        TEXT  NOT NULL 
    ) 
;

ALTER TABLE Review 
    ADD CONSTRAINT Review_PK PRIMARY KEY ( Paper_ID, Reviewer_email ) ;

CREATE TABLE Reviewer 
    ( 
     Email                         VARCHAR(255)  NOT NULL , 
     FirstName                     VARCHAR(255)  NOT NULL , 
     Last_Name                     VARCHAR(255)  NOT NULL , 
     Phone                         VARCHAR(50)  NOT NULL , 
     Affiliation                   VARCHAR(255)  NOT NULL , 
     Review_Paper_ID               INTEGER  NOT NULL , 
     Review_Reviewer_email         VARCHAR(255)  NOT NULL , 
     Reviewer_Topic_Reviewer_email VARCHAR(255)  NOT NULL , 
     Reviewer_Topic_Topic          VARCHAR(255)  NOT NULL 
    ) 
;

ALTER TABLE Reviewer 
    ADD CONSTRAINT Reviewer_PK PRIMARY KEY ( Email ) ;

CREATE TABLE Reviewer_Topic 
    ( 
     Reviewer_email VARCHAR(255)  NOT NULL , 
     Topic          VARCHAR(255)  NOT NULL 
    ) 
;

ALTER TABLE Reviewer_Topic 
    ADD CONSTRAINT Reviewer_Topic_PK PRIMARY KEY ( Reviewer_email, Topic ) ;

ALTER TABLE Paper_author 
    ADD CONSTRAINT Paper_author_Author_FK FOREIGN KEY 
    ( 
     Author_Email2
    ) 
    REFERENCES Author 
    ( 
     Email
    ) 
;

ALTER TABLE Paper 
    ADD CONSTRAINT Paper_Author_FK FOREIGN KEY 
    ( 
     Author_Email2
    ) 
    REFERENCES Author 
    ( 
     Email
    ) 
;

ALTER TABLE Paper 
    ADD CONSTRAINT Paper_Paper_author_FK FOREIGN KEY 
    ( 
     Paper_author_Author_email,
     Paper_author_Paper_id
    ) 
    REFERENCES Paper_author 
    ( 
     Author_email,
     Paper_id
    ) 
;

ALTER TABLE Paper 
    ADD CONSTRAINT Paper_Review_FK FOREIGN KEY 
    ( 
     Review_Paper_ID,
     Review_Reviewer_email
    ) 
    REFERENCES Review 
    ( 
     Paper_ID,
     Reviewer_email
    ) 
;

ALTER TABLE Reviewer 
    ADD CONSTRAINT Reviewer_Review_FK FOREIGN KEY 
    ( 
     Review_Paper_ID,
     Review_Reviewer_email
    ) 
    REFERENCES Review 
    ( 
     Paper_ID,
     Reviewer_email
    ) 
;

ALTER TABLE Reviewer 
    ADD CONSTRAINT Reviewer_Reviewer_Topic_FK FOREIGN KEY 
    ( 
     Reviewer_Topic_Reviewer_email,
     Reviewer_Topic_Topic
    ) 
    REFERENCES Reviewer_Topic 
    ( 
     Reviewer_email,
     Topic
    ) 
;