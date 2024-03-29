

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	//Проверяем, заполнена ли таблица прав доступа?
	СписокРолей = Метаданные.Роли;
	Если Объект.ПраваДоступа.Количество() <> СписокРолей.Количество() Тогда
		Объект.ПраваДоступа.Очистить();
		Для Каждого Роль Из СписокРолей Цикл
			НоваяСтрока = Объект.ПраваДоступа.Добавить();
			НоваяСтрока.Роль = Роль.Синоним;
			НоваяСтрока.ИмяРоли = Роль.Имя;
		КонецЦикла;
	КонецЕсли;
	
	//Включаем уже включенные роли у пользователя	
	ТекущийПользователь = ПользователиИнформационнойБазы.НайтиПоИмени(Объект.Наименование);
	Для каждого РольПользователя Из ТекущийПользователь.Роли Цикл
		СтруктураОтбора = Новый Структура("ИмяРоли", РольПользователя.Имя);
		РольВСписке = Объект.ПраваДоступа.НайтиСтроки(СтруктураОтбора);
		Если РольВСписке.Количество() > 0 Тогда
			РольВСписке[0].Включена = Истина;
		КонецЕсли;
	КонецЦикла;
	
	
КонецПроцедуры
