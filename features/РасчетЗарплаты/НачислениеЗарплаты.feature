﻿#encoding: utf-8
#language: ru
@tree
#@ExportScenarios
#@IgnoreOnCIMainBuild

Функционал: Начисление зарплаты
	Как Бухгалтер
	Я хочу расчитывать зарплату
	Что бы не считать ее вручную

Контекст:
	Дано есть 1с
		Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И еще не созданы сотрудники
		И еще нет ни одного элемента в справочнике "Сотрудники"
	И еще нет ни одного документа "РасчетЗарплаты"		
	
Сценарий: Я начисляю зарплату
	Когда Я создаю сотрудника с именем "Бухгалтер" Окладом "10000" датой приема "21.09.2015"
	И Я создаю сотрудника с именем "Оператор" Окладом "5000" датой приема "21.01.2016"
	И Я создаю сотрудника с именем "Продавец" Окладом "6000" датой приема "24.10.2016"
	И Создаю документ начисления зарплаты
		Когда В панели разделов я выбираю "Главное" 
		И     В панели разделов я выбираю "Финансы"
		И     Я нажимаю кнопку командного интерфейса "Сотрудники"
		Тогда открылось окно "Сотрудники"
		И     Я нажимаю кнопку командного интерфейса "Расчет зарплаты"
		Тогда открылось окно "Расчет зарплаты"
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Расчет зарплаты (создание)"
		И     в ТЧ "Начисления" я нажимаю на кнопку "Заполнить"
		И Пауза 3
		И     В форме "Расчет зарплаты (создание)" в таблице "Начисления" я перехожу к строке:
		| 'Отработано' | 'Начисленно' | 'Сотрудник' | 'Оклад'    |
		| '21'         | '5 000,00'   | 'Оператор'  | '5 000,00' |
		И     я нажимаю на кнопку "Записать"
	Тогда он правильно расчитывается
		И     таблица формы с именем "Начисления" стала равной:
		| 'Отработано' | 'Начисленно' | 'Сотрудник' | 'Оклад'     |
		| '21'         | '10 000,00'  | 'Бухгалтер' | '10 000,00' |
		| '21'         | '5 000,00'   | 'Оператор'  | '5 000,00'  |
	Когда я ставлю отработано больше чем дней в месяце  
		И     в ТЧ "Начисления" я активизирую поле "Отработано"
		И     В форме "Расчет зарплаты *" в таблице "Начисления" я перехожу к строке:
		| 'Сотрудник' |
		| 'Оператор'  |
		И     В форме "Расчет зарплаты *" в ТЧ "Начисления" я выбираю текущую строку
		И     в ТЧ "Начисления" в поле "Отработано" я ввожу текст "51"
		И     В форме "Расчет зарплаты *" в ТЧ "Начисления" я завершаю редактирование строки
	Тогда устанавливается максимальное количество дней в месяце
		Тогда    таблица формы с именем "Начисления" стала равной:
		| 'Отработано' | 'Начисленно' | 'Сотрудник' | 'Оклад'     |
		| '21'         | '10 000,00'  | 'Бухгалтер' | '10 000,00' |
		| '30'         | '7 142,86'   | 'Оператор'  | '5 000,00'  |
	И я нажимаю на кнопку "Записать"	
	И я закрываю окно "Расчет зарплаты *"	
