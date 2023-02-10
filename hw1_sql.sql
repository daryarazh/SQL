-- 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
select model, speed, hd from PC
where price < 500

-- 2. Найдите производителей принтеров. Вывести: maker
select distinct maker from product
where type = 'printer'

-- 3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
select model, ram, screen from laptop
where price > 1000

-- 4. Найдите все записи таблицы Printer для цветных принтеров.
select * from printer
where color = 'y'

-- 5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол
select model, speed, hd from pc
where cd in ('12x', '24x') and price < 600

-- 6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость
select distinct product.maker, laptop.speed from laptop
join product on product.model = laptop.model
where laptop.hd >= 10

-- 7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква)
select product.model, pc.price from pc
join product on product.model = pc.model
where product.maker = 'B'
union  
select product.model, laptop.price from laptop
join product on product.model = laptop.model
where product.maker = 'B'
union
select product.model, printer.price from printer
join product on product.model = printer.model
where product.maker = 'B'

-- 8. Найдите производителя, выпускающего ПК, но не ПК-блокноты
select maker from product
where type = 'pc'
except select maker from product
where type = 'laptop'

-- 9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
select distinct maker from product
join pc on product.model = pc.model
where pc.speed >= 450

-- 10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
select model, price from printer
where price = (select max(price) from printer)

-- 11. Найдите среднюю скорость ПК
select avg(speed) from pc

-- 12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
select avg(speed) from laptop
where price > 1000

-- 13. Найдите среднюю скорость ПК, выпущенных производителем A.
select avg(speed) from pc
join product on product.model = pc.model
where product.maker = 'A'

-- 14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
select ships.class, name, classes.country from ships
join classes on classes.class = ships.class
where classes.numGuns >= 10

-- 15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
select hd from pc
group by hd
having count(hd) > 1

-- 16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
select distinct p1.model, p2.model, p1.speed, p1.ram from pc p1
join pc p2 on p1.speed = p2.speed and p1.ram = p2.ram and p1.model > p2.model

-- 17. Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
select distinct product.type, laptop.model, laptop.speed from laptop
join product on product.model= laptop.model
where laptop.speed < all(select speed from pc)

-- 18. Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
select distinct maker, price from printer
join product on product.model = printer.model
where color = 'y'
and
price = (select min(price) from printer where color = 'y')

-- 19. Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.
Select maker, avg(screen) from laptop
join product on product.model = laptop.model
group by maker

-- 20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
select maker, count(model) from product
where type = 'pc'
group by maker
having count(model) >= 3

-- 21. Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
Select maker, max(price) from product
join pc on pc.model = product.model
group by maker

-- 22. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена
Select speed, avg(price) from pc
where speed > 600
group by speed

-- 23. Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
select distinct maker from product
join pc on pc.model = product.model
where speed >= 750 and maker in (select maker from product
join laptop on laptop.model = product.model
where speed >= 750)

-- 24. Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
select model from 
(select model, price from pc
union select model, price from printer
union select model, price from laptop) p1
where price = (select max(price) from (select price from pc
union select price from laptop
union select price from printer) p2)
