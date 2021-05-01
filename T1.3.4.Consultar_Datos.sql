--- 1.	Hay 145 países que, en los datos alguno de sus atletas no registran Edad
select COUNT(distinct c.NOC) as CountryName
from Events e inner join Country c
     on e.IDCountry = c.IDCountry
where Age = 'NULL'
--- 2.	En el promedio de edades por país, el país que tiene los atletas más jóvenes es: MHL, con 20 años, el país que en promedio tiene los atletas más adultos es: MON, con 30 años
select round(avg(Age)) as AvgAge, c.NOC as CountryName
from Events e inner join Country c
     on e.IDCountry = c.IDCountry
where Age <> 'NULL'
group by c.NOC
order by round(avg(Age)) ASC
limit 1;
select round(avg(Age)) as AvgAge, c.NOC as CountryName
from Events e inner join Country c
     on e.IDCountry = c.IDCountry
where Age <> 'NULL'
group by c.NOC
order by round(avg(Age)) DESC
limit 1 
--- 3.	Los 3 países que más han ganado medallas en la historia 
select c.NOC CountryName, count(0) CountMedal
from Events e inner join Country c
		on e.IDCountry = c.IDCountry
	 inner join Medals m
		on m.IDMedal = e.IDMedal
	 inner join Athletes a
		on a.ID = e.ID
	 inner join EventType et
		on et.IDPpal = e.IDPpal
	 inner join Games g
		on g.IDGame = e.IDGame
where m.Medal <> 'NA'
group by c.NOC
order by count(0) desc
limit 3
--- 4.	Los 3 países que menos medallas han ganado son
select c.NOC CountryName, count(0) CountMedal
from Events e inner join Country c
		on e.IDCountry = c.IDCountry
	 inner join Medals m
		on m.IDMedal = e.IDMedal
	 inner join Athletes a
		on a.ID = e.ID
	 inner join EventType et
		on et.IDPpal = e.IDPpal
	 inner join Games g
		on g.IDGame = e.IDGame
where m.Medal <> 'NA'
group by c.NOC
order by count(0) asc
limit 3
--- 5.	Los 5 eventos que más han ganado medallas 
select et.Event, count(0) CountMedal
from Events e inner join Country c
		on e.IDCountry = c.IDCountry
	 inner join Medals m
		on m.IDMedal = e.IDMedal
	 inner join Athletes a
		on a.ID = e.ID
	 inner join EventType et
		on et.IDPpal = e.IDPpal
	 inner join Games g
		on g.IDGame = e.IDGame
where m.Medal <> 'NA'
group by et.Event
order by count(0) desc
limit 5 
--- 6.	Los 5 Atletas que más han ganado medallas 
select a.Name, count(0) CountMedal
from Events e inner join Country c
		on e.IDCountry = c.IDCountry
	 inner join Medals m
		on m.IDMedal = e.IDMedal
	 inner join Athletes a
		on a.ID = e.ID
	 inner join EventType et
		on et.IDPpal = e.IDPpal
	 inner join Games g
		on g.IDGame = e.IDGame
where m.Medal <> 'NA'
group by a.Name
order by count(0) desc
limit 5 
-- 7. Promedio de Edades por años
select round(avg(age)) AVGAge, g.year
from Events e inner join Games g
     on e.IDGame = g.IDGame
where e.age <> 'NULL'
group by g.Year
