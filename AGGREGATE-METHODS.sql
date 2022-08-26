/*
AGGREGATE METHOD KULLANIMI
=> Aggregate Methodlari: Sum(Toplama), Count(Sayma), Min(En Kucuk), Max(En Buyuk), Avg(Ortalama)
=> Subquery icinde kullanilir ancak sorgu tek bir deger donduruyor olmalidir.
=> Syntex: sum() seklinde olmali sum () seklinde arada bosluk olmamalidir.
=>ALIAS (AS): Tabloya gecici sutun ekler. Kosuldan sonra "as sutun_ismi" yazilarak kullanilir.
*/

select * from calisanlar2;

-- Calisanlar2 tablosundaki en yuksek maas degerini listeleyiniz.
select max(maas) from calisanlar2;

-- Calisanlar2 tablosundaki maaslarin toplamini listeleyiniz
select sum(maas) from calisanlar2;

--Calisanlar2 tablosundaki maas ortalamalarini listeleyiniz
select avg(maas) from calisanlar2;

select round(avg(maas)) from calisanlar2
-- Kusurati kaldirmak icin round komutu kullanilir.

select round(avg(maas),2) from calisanlar2
-- Kusurati 2 haneli yapmak icin kullanilir.

--Calisanlar2 tablosundaki en dusuk maasi listeleyiniz
select min(maas) from calisanlar2;

--Calisanlar2 tablosundaki kac kisinin maas aldigini listeleyiniz
select count(maas) from calisanlar2;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maasini listeleyiniz
select * from markalar;
	
as toplam_maas from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini 
-- listeleyen bir Sorgu yaziniz.

select marka_isim, calisan_sayisi,
		(select max(maas) from calisanlar2 where marka_isim=isyeri) as max_maas,
		(select min(maas) from calisanlar2 where marka_isim=isyeri) as min_maas
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id, marka_isim, 
(select count(sehir) from calisanlar2 where marka_isim=isyeri) as sehir_sayisi
from markalar;

--INTERVIEW QUESTION: En yüksek ikinci maas değerini çağırın.
select max(maas) as enyuksek_ikinci_maas from calisanlar2
where maas<(select max(maas) from calisanlar2);

--INTERVIEW QUESTION: En dusuk ikinci maas değerini çağırın.
select min(maas) as endusuk_ikinci_maas from calisanlar2
where maas>(select min(maas) from calisanlar2);

-- En yuksek ucuncu maas degerini bulunuz
select max(maas) as enyuksek_ucuncu_maas from calisanlar2
where maas<(select max(maas) from calisanlar2 where maas<(select max(maas) from calisanlar2));

-- En dusuk ucuncu maas degerini bulunuz (ODEV)





