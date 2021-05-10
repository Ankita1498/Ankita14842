create table characters(characterID INT NOT NULL AUTO_INCREMENT,
movieID INT NULL,ACTORID INT NULL,CharacterName VARCHAR(100)NULL,
PRIMARY KEY(characterID));

insert into characters values(1,1,1,'ABC');
insert into characters values(2,1,1,'CDE');
insert into characters values(3,1,1,'EFG');
insert into characters values(4,1,1,'FGH');
insert into characters values(5,1,1,'CVK');

create table movie(movieID INT NOT NULL AUTO_INCREMENT, Director VARCHAR(50) NULL,year INT NULL,
PRIMARY KEY(movieID));

insert into movie values (1,'ankita',2000);
insert into movie values (2,'rush',2009);
insert into movie values (3,'riy',2008);
insert into movie values (4,'anki',2007);
insert into movie values (5,'prasad',2005);
insert into movie values (6,'sree',2002);

