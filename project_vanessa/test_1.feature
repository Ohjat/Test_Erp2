﻿#language: ru

@ExportScenarios

@tree

Функционал: Добавление документа в акупках

Как Администратор я хочу
Добавить документ закупок 
чтобы  его можно было оплатить

Контекст:

Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Добавление документа в акупках
*создание документа
 	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Заказы поставщикам'
	Тогда открылось окно 'Заказы поставщикам'
	И в таблице "Список" я активизирую поле с именем "СписокПриоритет"
	И в таблице "Список" я активизирую поле с именем "СписокДата"
	И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
	Тогда открылось окно 'Заказ поставщику (создание)'
*редактор основного
	И из выпадающего списка с именем "Партнер" я выбираю точное значение 'АВИКА'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'Зимний сад'
	И я нажимаю кнопку выбора у поля с именем "Склад"
	Тогда открылось окно 'Склады и магазины'
	И в таблице "Список" я разворачиваю строку:
		| 'Наименование' |
		| 'Склады'       |
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'            | 'Подразделение'       |
		| 'Склад готовой продукции' | 'Коммерческая служба' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ поставщику (создание) *'
*Редактор товара
	И я перехожу к закладке с именем "ГруппаТовары"
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатураПартнера"
	Тогда открылось окно 'Номенклатура поставщика'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ поставщику (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыНазначение"
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНазначение"
	Тогда открылось окно 'Выбор назначения (Номенклатура: Шарнир Т15, Ед. изм: шт)'
	И Я закрываю окно 'Выбор назначения (Номенклатура: Шарнир Т15, Ед. изм: шт)'
	Тогда открылось окно 'Заказ поставщику (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличествоУпаковок"
	И в таблице "Товары" в поле с именем 'ТоварыКоличествоУпаковок' я ввожу текст '2,000'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыУпаковка"
	И в таблице "Товары" я активизирую поле с именем "ТоварыВидЦеныПоставщика"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" из выпадающего списка с именем "ТоварыВидЦеныПоставщика" я выбираю точное значение 'цена'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыПроцентРучнойСкидки"
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыСуммаРучнойСкидки" 
*Проверка таблицы
	Тогда таблица "Товары" стала равной:
		| 'Цена'   |
		| '100,00' |			
	И я нажимаю на кнопку "Записать"
	
*номер документа
	И Я запоминаю значение поля  "Номер" Как "$Номер$"
	
*Окончания создания
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ поставщику (создание) *' в течение 20 секунд
*Проверка создания
И таблица "Список" содержит строки:
	| 'Номер' |
	| '$Номер$'               |

Сценарий: Просмотр данных с файла
 *Открытие системы 
	 И В командном интерфейсе я выбираю 'Главное' 'Номенклатура'
	 Тогда открылось окно 'Номенклатура'
	 И в таблице "ВидыНоменклатуры" я перехожу к строке:
	 	| 'Наименование' |
	 	| 'Производство' |
	 И в таблице "ВидыНоменклатуры" я перехожу к строке:
	 	| 'Наименование'      |
	 	| 'Изделия из дерева' |
	И таблица  "СписокРасширенныйПоискНоменклатура" содержит строки:
		| 'Наименование' |
		| 'Полка в прихожую'   |
	
	
		
		
	 	