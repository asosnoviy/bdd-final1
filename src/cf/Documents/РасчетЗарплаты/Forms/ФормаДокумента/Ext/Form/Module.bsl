﻿
&НаКлиенте
Процедура Заполнить(Команда)
	ЗаполнитьНаСервере();
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьНаСервере()
	
	
	
	ТзНачислений = Объект.Начисления.Выгрузить();
	ТзНачислений.Очистить();
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	Сотрудники.Ссылка,
	               |	Сотрудники.Оклад
	               |ИЗ
	               |	Справочник.Сотрудники КАК Сотрудники
	               |ГДЕ
	               |	НЕ Сотрудники.Уволен
	               |	И Сотрудники.ДатаПриема < &ДатаДокумента"  ;
				   
	Запрос.УстановитьПараметр("ДатаДокумента",КонецМесяца(Объект.Дата));
	Выборка = Запрос.Выполнить().Выбрать();
	
	КоличествоДней = КоличествоРабочихДнейВМесяце();
	Пока Выборка.Следующий() Цикл 
		
		СтрокаНачисления = ТзНачислений.Добавить();
		СтрокаНачисления.Сотрудник 	= Выборка.Ссылка;
		СтрокаНачисления.Отработано = КоличествоРабочихДней;
		СтрокаНачисления.Начисленно = Выборка.Оклад;
		СтрокаНачисления.Оклад		= Выборка.Оклад;
		
	КонецЦикла;	
	
	Объект.Начисления.Загрузить(ТзНачислений);
	
 КонецПроцедуры
 
&НаСервере 
Функция КоличествоРабочихДнейВМесяце()
	
	//TODO Сосновый А.С.
	//Надо считать =)

	Возврат 21;	
КонецФункции	

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	КоличествоРабочихДней = КоличествоРабочихДнейВМесяце();

	
КонецПроцедуры

&НаКлиенте
Процедура НачисленияОтработаноПриИзменении(Элемент)
	ТекущаяСтрока = Элементы.Начисления.ТекущиеДанные;
	
	Если ТекущаяСтрока.Отработано > День(КонецМесяца(Объект.Дата)) тогда
		
		  ТекущаяСтрока.Отработано  = День(КонецМесяца(Объект.Дата));
		  
	КонецЕсли;
	
	ТекущаяСтрока.Начисленно =  ТекущаяСтрока.Отработано / КоличествоРабочихДней * ТекущаяСтрока.Оклад;
КонецПроцедуры
