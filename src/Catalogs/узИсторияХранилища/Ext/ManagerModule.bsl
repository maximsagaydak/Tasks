﻿Функция ПолучитьПоследнююЗагруженнуюВерсию(Конфигурация) Экспорт
	Перем пВерсия;
	
	пВерсия = 0;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ ПЕРВЫЕ 1
	|	узИсторияХранилища.Версия КАК Версия
	|ИЗ
	|	Справочник.узИсторияХранилища КАК узИсторияХранилища
	|ГДЕ
	|	узИсторияХранилища.Владелец = &Конфигурация
	|
	|УПОРЯДОЧИТЬ ПО
	|	Версия УБЫВ";
	
	Запрос.УстановитьПараметр("Конфигурация",Конфигурация);
	РезультатЗапроса = Запрос.Выполнить();
	
	Если НЕ РезультатЗапроса.Пустой() Тогда
		Выборка = РезультатЗапроса.Выбрать();
		Выборка.Следующий();
		пВерсия = Выборка.Версия;
	Конецесли;	
	
	Возврат пВерсия;
КонецФункции 
