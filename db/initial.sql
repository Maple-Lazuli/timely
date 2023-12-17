DROP DATABASE IF EXISTS timely_db;    

CREATE DATABASE timely_db; 

\c timely_db;  


CREATE TABLE accounts (
        account_id serial PRIMARY KEY,
        role_id INT NOT NULL,
        first_name VARCHAR ( 50 ) NOT NULL,
        last_name VARCHAR ( 50 ) NOT NULL,
        created_on TIMESTAMP NOT NULL,
        username VARCHAR ( 50 ) UNIQUE NOT NULL,
        password VARCHAR ( 128 ) NOT NULL,
        salt INT NOT NULL 
);

CREATE TABLE tags (
	tag_id serial PRIMARY KEY,
	tag_name VARCHAR ( 60 ) NOT NULL,
	tag_description VARCHAR ( 255 ) NOT NULL
);

CREATE TABLE Events (
	project_id serial PRIMARY KEY,
	account_id int NOT NULL,
	tag_id int NOT NULL,
	event_name VARCHAR ( 60 ) NOT NULL,
	event_start TIMESTAMP not NULL,
	event_end  TIMESTAMP not NULL,
	FOREIGN KEY (account_id) REFERENCES accounts (account_id),
	FOREIGN KEY (tag_id) REFERENCES tags (tag_id)
);
