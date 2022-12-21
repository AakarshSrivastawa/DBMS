create database alpha;
use alpha;
create table Scientists (
  SSN int,
  Name Char(30) not null,
  Primary Key (SSN)
);

Create table Projects (
  Code Char(4),
  Name Char(50) not null,
  Hours int,
  Primary Key (Code)
);
	
create table AssignedTo (
  Scientist int not null,
  Project char(4) not null,
  Primary Key (Scientist, Project),
  Foreign Key (Scientist) references Scientists (SSN),
  Foreign Key (Project) references Projects (Code)
);

INSERT INTO Scientists(SSN,Name) 
  VALUES(123234877,'Michael Rogers'),
    (152934485,'Anand Manikutty'),
    (222364883, 'Carol Smith'),
    (326587417,'Joe Stevens'),
    (332154719,'Mary-Anne Foster'),	
    (332569843,'George ODonnell'),
    (546523478,'John Doe'),
    (631231482,'David Smith'),
    (654873219,'Zacary Efron'),
    (745685214,'Eric Goldsmith'),
    (845657245,'Elizabeth Doe'),
    (845657246,'Kumar Swamy'),
    (1646132,'AMAN'),
    (1234646,'GERARD');

 INSERT INTO Projects ( Code,Name,Hours)
 VALUES ('AeH1','Winds: Studying Bernoullis Principle', 156),
       ('AeH2','Aerodynamics and Bridge Design',189),
       ('AeH3','Aerodynamics and Gas Mileage', 256),
       ('AeH4','Aerodynamics and Ice Hockey', 789),
       ('AeH5','NUCLEAR BOMB', 98),
       ('AeH6','Aerodynamics of Air Hockey',89),
       ('Ast1','A Matter of Time',112),
       ('Ast2','A Puzzling Parallax', 299),
       ('Ast3','Build Your Own Telescope', 6546),
       ('Bte1','Juicy: Extracting Apple Juice with Pectinase', 321),
       ('Bte2','A Magnetic Primer Designer', 9684),
       ('Bte3','Bacterial Transformation Efficiency', 321),
       ('Che1','Boston', 545),
       ('Che2','A Soluble Separation Solution', 778);

 INSERT INTO AssignedTo ( Scientist, Project)
   VALUES (123234877,'AeH1'),
    (152934485,'AeH3'),
    (222364883,'Ast3'),	   
    (326587417,'Ast3'),
    (332154719,'Bte1'),
    (546523478,'Che1'),
    (631231482,'Ast3'),
    (654873219,'Che1'),
    (745685214,'AeH3'),
    (845657245,'Ast1'),
    (845657246,'Ast2'),
    (332569843,'AeH4');
SELECT   S.Name, P.Name, P.Hours
FROM    Scientists S 
         INNER JOIN AssignedTo A ON S.SSN=A.Scientist
         INNER JOIN Projects P ON A.Project=P.Code
ORDER BY P.Name ASC, S.Name ASC;
SELECT Name 
FROM Projects
WHERE Code NOT In
(
SELECT Project 
         FROM AssignedTo
);
 INSERT INTO Scientists(SSN,Name) 
  VALUES(1321154,'Henry');
   select * from Scientists;
   INSERT INTO AssignedTo ( Scientist, Project)
   VALUES (1321154,'Bte3');
   select * from AssignedTo;

update projects
set hours=50
where name='Boston';
select *from projects where name="Boston";
 SELECT   S.Name,S.SSN
FROM     Scientists S 
         INNER JOIN AssignedTo A ON S.SSN=A.Scientist
         INNER JOIN Projects P ON A.Project=P.Code
         where p.hours<300;

         delete FROM PROJECTS WHERE NAME='NUCLEAR BOMB';
         SELECT *FROM PROJECTS;
     update projects
     set hours=hours-2;
     select *from projects; 
SELECT SUM(Hours) FROM Scientists INNER JOIN AssignedTo 
ON Scientists.SSN = AssignedTo.scientist AND scientists.Name = 'GERARD'
INNER JOIN Projects ON AssignedTo.Project = Projects.Code GROUP BY scientists.Name;
 select * from AssignedTo;
SELECT * FROM Scientists INNER JOIN AssignedTo 
ON Scientists.SSN = AssignedTo.scientist
INNER JOIN Projects ON AssignedTo.Project = Projects.Code WHERE Scientists.SSN = 
(SELECT Scientist FROM AssignedTo GROUP BY Scientist ORDER BY COUNT(Scientist) DESC LIMIT 1);
SELECT * FROM Scientists;