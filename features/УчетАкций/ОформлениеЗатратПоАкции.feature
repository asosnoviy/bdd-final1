﻿#encoding: utf-8
#language: ru
@tree

Функционал: Учет затрат по акции
	Как Маркетолог
	Я хочу фиксировать расходы на привлечение клиентов  
	Чтобы анализировать эффиктивность акций 
	
Контекст:

	Дано есть 1с
		Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я еще не вел учет акций	
		И еще нет ни одного элемента в справочнике "Акции"
	
Сценарий: Я фиксирую расход по акции 
	Когда Я создаю новую акцию с названием "ПерваяАкция" и датой начала "23.09.2016"
	И Я создаю новую акцию с названием "ВтораяАкция" и датой начала "29.09.2016" 
	И я Оформляю документ Покупка для Акции "ПерваяАкция" с Суммой "1000"
		Когда В панели разделов я выбираю "Главное"
		Когда В панели разделов я выбираю "Закупки"
		И     Я нажимаю кнопку командного интерфейса "Документы покупки"
		Тогда открылось окно "Документы покупки"
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Документ Покупка *"
		И     я перехожу к закладке "Акции"
		И     я перехожу к закладке "Группа товары акции"
		И     в ТЧ "Акции" я нажимаю на кнопку "Добавить"
		И     в ТЧ "Акции" я выбираю значение реквизита "Акция" из формы списка
		Тогда открылось окно "Акции"
		И     В форме "Акции" в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'ПерваяАкция'  |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Документ Покупка *"
		И     в ТЧ "Акции" я активизирую поле "Сумма"
		И     В форме "Покупка * от *" в ТЧ "Акции" я выбираю текущую строку
		И     в ТЧ "Акции" в поле "Сумма" я ввожу текст "1 000,00"
		И     В форме "Документ Покупка *" в ТЧ "Акции" я завершаю редактирование строки
		И     я нажимаю на кнопку "Провести и закрыть"

