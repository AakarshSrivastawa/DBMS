create database alphab_et;
use alphab_et;

create table PEOPLE (
id integer ,
name CHAR,
primary key (id)
);

create table ADDRESS(
id integer primary key not null,
address varchar(100),
Updatedate date
);
Insert Into PEOPLE Values(22 , "P");
Insert Into PEOPLE Values(24 , "Q");
Insert Into PEOPLE Values(26 , "R");
Insert Into PEOPLE Values(31 , "W");

Insert Into  ADDRESS Values( 343 , "Address-111-123" , "2014-06-22");
Insert Into  ADDRESS Values( 22 , "Address-112-234" , "2015-08-11");
Insert Into  ADDRESS Values( 26 , "Address-113-345" , "2018-09-04");
Insert Into  ADDRESS Values( 98 , "Address-114-456" , "2022-01-14");
Insert Into  ADDRESS Values( 24 , "Address-115-567" , "2010-04-17");
Insert Into  ADDRESS Values( 22 , "Address-116-678" , "2001-05-30");
Insert Into  ADDRESS Values( 200 , "Address-117-789" , "2004-05-26");
Insert Into  ADDRESS Values( 990 , "Address-118-890" , "2031-06-09");
Insert Into  ADDRESS Values( 301 , "Address-119-901" , "2026-08-29");

select people.id , people.name , temp.address From people LEFT JOIN(SELECT id , MAX(address) as address FROM ADDRESS GROUP BY id)
AS temp ON people.id=temp.id; 

select distinct * from  people left join Address on people.id = Address.id;

