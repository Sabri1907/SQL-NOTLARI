-- sql_practise 1                                                                             
create table personel                                                                         
(                                                                                             
id serial primary key  , 
-- Serial id'yi auto increment gibi otomatik arttirir.
isim varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                             
);                                                                                            
																							 
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                
insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

-- SORU 1) Tablo bilgilerini listeleyiniz.
select * from personel;

-- SORU 2) isim, yaş ve maaş bilgilerini listeleyiniz
select isim, yas, maas from personel;

-- SORU 3) id'si 8 olan personel bilgilerini listeleyiniz
select * from personel where id=8;

--SORU 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
select isim, yas, email from personel where id=5; 
--id'yi gormek icin id'yi de eklemek gerekir
select id, isim, yas, email from personel where id=5;

-- SORU 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
select * from personel where yas>30;

-- SORU 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from personel where maas<>21000;
select * from personel where maas is not 21000;

-- SORU 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
select * from personel where isim ilike 'A%';

-- SORU 8: ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from personel where isim ilike '%n';

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from personel where email ilike '%@gmail.com';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
select * from personel where email not ilike '%gmail.com';
-- % ile arama yaptigimiz icin null gelmez.

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from personel where id in(3,5,7,9);
-- in parantezi icine ayti data tipinde degerleri yazarak hepsini tek komutla listeleyebiliriz.
-- "not in" dersek o sarti saglamayanlar listelenir.

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel where yas not in (39,48,54);

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from personel where yas between 30 and 40;

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
select * from personel where yas not between 30 and 40;

-- 15 email null olan personel bilgilerini listeleyiniz
select * from personel where email is null;

-- 16) personel bilgilerini yaşa göre sıralayınız.
select * from personel order by yas;
-- Bir sart yazmazsak natural order (Kucukten buyuge) siralar.
-- ..... order by yas asc komutu ile ayni.

-- 17) Personel bilgilerini maasa gore siralayiniz.
select * from personel order by maas;

-- 18) Personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by yas desc;
-- desc: descending azalan (buyukten kucuge) siralar.

-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by maas desc;

-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel order by maas desc limit 3;

-- 21) En dusuk maaş alan ilk 3 personel bilgilerini sıralayınız
select * from personel order by maas limit 3;



