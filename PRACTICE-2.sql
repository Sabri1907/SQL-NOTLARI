CREATE TABLE workers
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);

INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

select * from workers;

-- 1)Tabloya company_industry isminde sütun ekleyiniz
alter table workers add company_industry varchar(30);

--2) Tabloya worker_address sutunu ve default olarak da 'Miami, Fl, USA' adresini giriniz.
alter table workers add worker_address varchar (100) default 'Miami, Fl, USA';

-- 3)tablodaki worker_address sütununu siliniz
alter table workers drop column worker_address;

-- 4) Tabvlodaki company_industry sutununu, company_profession olarak degistiriniz
alter table workers rename company_industry to company_profession;

-- 5) Tablonun ismini employees olarak degistiriniz
alter table workers rename to employees;
select * from employees;

-- 6) Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
alter table employees alter title type varchar(50);

-- 7) Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
alter table employees add constraint title unique (title);

INSERT INTO employees VALUES(4, 'Ali Kemal', 'CEO', 5);
-- Title unique oldugu icin CEO zaten oldugundan ust satirdaki bilgileri eklemedi.

