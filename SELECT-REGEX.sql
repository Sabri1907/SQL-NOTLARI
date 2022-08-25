-- SELECT - SIMILAR TO - REGEX (REGULAR EXPRESSIONS)
/*
SIMILAR TO : Daha karmasik pattern (kalip) ile sorgulama islemi icin kullanilabilir.
			 Sadece PostgreSQL'de kullanilabilir.
			 Buyuk/kucuk harf onemlidir.
			 
REGEX :	Herhangi bir kod, metin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini 
		saglayan kendine ait soz dizimi olan bir yapidir. 
		MySQ'de (REGEXP_LIKE) olarak kullanilir. 
		PostgreSQL'de "~" karakteri ile kullanilir. "~*" buyuk/kucuk harf fark etmeden arar.
		
OR (VEYA) : | isareti kullanilir.		
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1005, 'hct', 3);
INSERT INTO kelimeler VALUES (1006, 'adem', 4);
INSERT INTO kelimeler VALUES (1007, 'selim', 5);
INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hip', 3);
INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
select * from kelimeler;   

--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz

--similar to ile cozumu
select * from kelimeler where kelime similar to '%(at|ot|Ot|oT|At|aT|OT|AT)%' 
-- ilike gibi olmadigi icin buyuk kucuk harf ihtimallerinin hepsini veya ile belirtmek zorunda kaldik.

--like ile Cozumu
select * from kelimeler where kelime ilike '%at%' or kelime ilike '%ot%';
select * from kelimeler where kelime ~~* '%at%' or kelime ~~* '%ot%';

--regex ile cozumu
select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at';

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz

-- similar to ile
select * from kelimeler where kelime similar to 'ho%|hi%';

--like ile cozumu
select * from kelimeler where kelime ~~* 'ho%' or kelime ~~* 'hi%';

--regex ile cozumu
select * from kelimeler where kelime ~* 'h[oi](.*)'
/*
Regex'de ".(nokta)" bir karakteri temsil eder.
Regex'de ikinci karakter icin koseli parantez kullanilir. "*"" hepsi anlaminda kullanilir.
*/

-- Sonu 't' ile veya 'm' ile bitenleri listeleyin.

--similar to ile cozumu
select * from kelimeler where kelime similar to '%t|%m';

--regex ile cozumu
select * from kelimeler where kelime ~* '(.*)[tm]$';
-- "$" karakteri bitisi isaret eder. Yani bu kodda  't' veya 'm' haricinde baska bir 
-- karakterle biterse listelemez.

-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz

--similar to cozumu
select * from kelimeler where kelime similar to 'h_t'; 
-- Buyuk kucuk harf duyarli calisti
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';
-- Buyuk/kucuk harf dikkate almadan calisti

--like ile cozumu
select * from kelimeler where kelime ~~* 'h_t';

--regex ile cozumu
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t';
select * from kelimeler where kelime ~* 'h_t';
-- 'h_t' komutu regex'de tabloyu bos getirdi.

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan
--“kelime" değerlerini çağırın.

-- similar to ile cozumu
select * from kelimeler where kelime similar to 'h[a-e]%t';

-- regex to ile cozumu
select * from kelimeler where kelime ~* 'h[a-e](.*)t';


--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.

--regex ile cozumu
select * from kelimeler where kelime ~* '^[say].(.*)'

-- similar to ile cozumu
select * from kelimeler where kelime similar to '(s|a|y)%'


--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.

-- similar to ile cozumu
select * from kelimeler where kelime similar to '%(m|a|f)'

-- regex to ile cozumu
select * from kelimeler where kelime ~* '(.*)[maf]$';


--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.

--similar to ile cozumu
select * from kelimeler where kelime similar to 'h[a|i]t';

--regex to ile cozumu
select * from kelimeler where kelime ~* 'h(a|i)t';
select * from kelimeler where kelime ~* '^h(a|i)t$';
select * from kelimeler where kelime ~* '^h[a|i]t$';
select * from kelimeler where kelime ~* '^h(ai)t$'; -- Bos getirdi
select * from kelimeler where kelime ~* '^h[ai]t$';


--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.

-- similar to ile cozumu
select * from kelimeler where kelime similar to '[b-s]_l%';

-- regex ile ile cozumu
select * from kelimeler where kelime ~* '^[b-s].l(.*)';


--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.

-- similar to ile cozumu
select * from kelimeler where kelime similar to '%[o][o]%';
-- 2. Yontem
select * from kelimeler where kelime similar to '%[o]{2}%';
/*
=> Koseli parantez [] icine aradigimiz karakteri, 
=> Suslu parantez{} icine aradigimiz karakterin kac adet olmasi gerektigi yazilir.
*/

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o]{4}%';


--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.

-- similar to ile cozumu
select * from kelimeler where kelime similar to '(a|s|y)%(m|f)';

-- regex ile cozumu
select * from kelimeler where kelime ~* '^[a|s|y](.*)[m|f]$';







