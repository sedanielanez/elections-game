CREATE DATABASE dev;

CREATE USER master with password 'password';
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
GRANT ALL PRIVILEGES ON DATABASE dev TO master;
#psql -U master dev
#\l show databases