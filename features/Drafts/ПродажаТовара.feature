﻿#encoding: utf-8
#language: ru

Функционал: Продажа товара
	Как Продавец
	Я хочу Оформлять продажу в 1с
	Чтобы вести учет проданных товаров
	
Контекст:
	Дано есть 1с

Сценарий:
	Когда я создаю документ Покупка
	И выбираю продаваемые товары 
	Тогда данные о продаже сохраняются в 1с
	
