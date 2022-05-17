create database VizeProje
Use VizeProje
go

create table OgrenciBilgi(
OgrenciNo int primary key,
Isim nvarchar (20),
Soyisim nvarchar (40),
Sinif int not null
)

create table OgrenciIletisim(
OgrenciNo int primary key,
Isim nvarchar (20),
Soyisim nvarchar (40),
Adres nvarchar (80),
TelefonNumarasi nvarchar (11)
)

create table MatematikNotlari(
OgrenciNo int primary key,
VizeNot int,
FinalNot int
)

create table Devamsizlik(
OgrenciNo int primary key,
MatematikDevamsizlik int check(MatematikDevamsizlik>=0),
FizikDevamsizlik int check(FizikDevamsizlik>=0),
KimyaDevamsizlik int check(KimyaDevamsizlik>=0)
)


insert into OgrenciBilgi values(101,'Ayfer','Y�ld�z',3)

insert into OgrenciIletisim values(101,'Ayfer','Y�ld�z','�stanbul Kartal','05556662277')

insert into MatematikNotlari values(101,50,78)

insert into Devamsizlik values (101,3,0,6)

select *from OgrenciBilgi ob 
inner join OgrenciIletisim oi on ob.OgrenciNo=oi.OgrenciNo
inner join MatematikNotlari mn on oi.OgrenciNo=mn.OgrenciNo
inner join Devamsizlik d on mn.OgrenciNo=d.OgrenciNo


select oi.OgrenciNo as ��renciNumaras� ,ob.Isim as Ad�,mn.FinalNot as MatematikFinalNotu,d.MatematikDevamsizlik as MatematikDevams�zl��� from OgrenciBilgi ob 
inner join OgrenciIletisim oi on ob.OgrenciNo=oi.OgrenciNo
inner join MatematikNotlari mn on oi.OgrenciNo=mn.OgrenciNo
inner join Devamsizlik d on mn.OgrenciNo=d.OgrenciNo


select count(ob.OgrenciNo) as  ��renciSay�s� , ob.Sinif  from OgrenciBilgi ob 
inner join OgrenciIletisim oi on ob.OgrenciNo=oi.OgrenciNo
inner join MatematikNotlari mn on oi.OgrenciNo=mn.OgrenciNo
inner join Devamsizlik d on mn.OgrenciNo=d.OgrenciNo
group by ob.Sinif



select ob.Isim,oi.Adres from OgrenciIletisim oi right join OgrenciBilgi ob on oi.OgrenciNo=ob.OgrenciNo

select ob.Isim,oi.Adres from OgrenciIletisim oi left join OgrenciBilgi ob on oi.OgrenciNo=ob.OgrenciNo


