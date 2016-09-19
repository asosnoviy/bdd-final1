﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	
	// регистр Товары Расход
	Движения.Товары.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.Товары.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Товар = ТекСтрокаТовары.Товар;
		Движение.Количество = ТекСтрокаТовары.Количество;
		Движение.Стоимость = ТекСтрокаТовары.Сумма;
	КонецЦикла;
	
	Движения.Записать();
	
	КонтрольОтрицательныхДвижений(Отказ);


КонецПроцедуры

Процедура КонтрольОтрицательныхДвижений(Отказ)
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	ТоварыОстатки.Товар,
	               |	ТоварыОстатки.КоличествоОстаток
	               |ИЗ
	               |	РегистрНакопления.Товары.Остатки(&ДатаДокумента, Товар.Ссылка В (&МассивТоваров)) КАК ТоварыОстатки
	               |ГДЕ
	               |	ТоварыОстатки.КоличествоОстаток < 0";
				   
	Запрос.УстановитьПараметр("МассивТоваров",Товары.ВыгрузитьКолонку("Товар"));
	Запрос.УстановитьПараметр("ДатаДокумента",КонецДня(ТекущаяДата()));
	Результат = Запрос.Выполнить();			   
	Если Не Результат.Пустой() Тогда
		
		Отказ = Истина;
		
		Выборка = Результат.Выбрать();
		
		Пока Выборка.Следующий() Цикл
			
			Сообщить("Недостаточно товара " + Выборка.Товар + " не хватает " + Выборка.КоличествоОстаток * - 1);
		КонецЦикла;	
		
	КонецЕсли;	
	
КонецПроцедуры	