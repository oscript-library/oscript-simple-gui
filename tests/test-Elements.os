#Использовать asserts
#Использовать gui

Перем Форма;

Процедура Инициализация()
	
КонецПроцедуры

Функция ПолучитьСписокТестов(Тестирование) Экспорт

	// юТест = Тестирование;
	
	СписокТестов = Новый Массив;
	СписокТестов.Добавить("Тест_Должен_ВернутьКоличествоЭлементовНоль");
	СписокТестов.Добавить("Тест_Должен_ВернутьКоличествоЭлементовОдин");
	СписокТестов.Добавить("Тест_Должен_ВернутьСтрокуЭлементы");

	СписокТестов.Добавить("Тест_Должен_ВернутьЭлементФормы");
	СписокТестов.Добавить("Тест_Должен_ВернутьНеопределеноПриПоиске");

	СписокТестов.Добавить("Тест_Должен_УдалитьЭлемент");

	СписокТестов.Добавить("Тест_Должен_ПереместитьЭлементОдинРодитель");
	СписокТестов.Добавить("Тест_Должен_ПереместитьЭлементРазныеРодители");

	Возврат СписокТестов;

КонецФункции

//# Работа с событиями
Процедура ПриОткрытииФормы() Экспорт
	Форма.Закрыть();
КонецПроцедуры

Процедура ПолучитьФормуДляТеста()

	УправляемыйИнтерфейс = Новый УправляемыйИнтерфейс();
	Форма = УправляемыйИнтерфейс.СоздатьФорму();
	// Форма.УстановитьДействие(ЭтотОбъект, "ПриОткрытии", "ПриОткрытииФормы");
	// ВидыПоляФормы = Форма.ВидГруппыФормы;

КонецПроцедуры

Процедура Тест_Должен_ВернутьКоличествоЭлементовНоль() Экспорт

	ПолучитьФормуДляТеста();
	Форма.Показать();
	Ожидаем.Что(Форма.Элементы.Количество()).Равно(0);

КонецПроцедуры

Процедура Тест_Должен_ВернутьСтрокуЭлементы() Экспорт

	ПолучитьФормуДляТеста();
	ЭлементыФормыСтр = Строка(Форма.Элементы);
	Форма.Показать();

	Ожидаем.Что(ЭлементыФормыСтр).Равно("Элементы");

КонецПроцедуры

Процедура Тест_Должен_ВернутьКоличествоЭлементовОдин() Экспорт

	ПолучитьФормуДляТеста();
	ЭлементыФормы = Форма.Элементы;
	ЭлементыФормы.Добавить("ТекстовоеПоле1", "ПолеФормы", Неопределено);
	Форма.Показать();

	Ожидаем.Что(Форма.Элементы.Количество()).Равно(1);

КонецПроцедуры

Процедура Тест_Должен_ВернутьЭлементФормы() Экспорт

	ПолучитьФормуДляТеста();
	ЭлементыФормы = Форма.Элементы;
	ЭлементыФормы.Добавить("ТекстовоеПоле1", "ПолеФормы", Неопределено);
	НайденныйЭлемент = ЭлементыФормы.Найти("ТекстовоеПоле1");
	Форма.Показать();

	//юТест.ПроверитьНеРавенство(НайденныйЭлемент, Неопределено);
	Ожидаем.Что(НайденныйЭлемент).НеРавно(Неопределено);

КонецПроцедуры

Процедура Тест_Должен_ВернутьНеопределеноПриПоиске() Экспорт

	ПолучитьФормуДляТеста();
	ЭлементыФормы = Форма.Элементы;
	ЭлементыФормы.Добавить("ТекстовоеПоле1", "ПолеФормы", Неопределено);
	НайденныйЭлемент = ЭлементыФормы.Найти("ОшибочноеИмя");
	Форма.Показать();

	//юТест.ПроверитьРавенство(НайденныйЭлемент, Неопределено);
	Ожидаем.Что(НайденныйЭлемент).Равно(Неопределено);

КонецПроцедуры

Процедура Тест_Должен_УдалитьЭлемент() Экспорт

	ПолучитьФормуДляТеста();
	ЭлементыФормы = Форма.Элементы;
	Элемент = ЭлементыФормы.Добавить("ТекстовоеПоле1", "ПолеФормы", Неопределено);
	Элемент.Заголовок = "ТекстовоеПоле1";
	НайденныйЭлемент = ЭлементыФормы.Найти("ТекстовоеПоле1");
	ЭлементыФормы.Удалить(НайденныйЭлемент);
	Форма.Показать();

	//юТест.ПроверитьРавенство(ЭлементыФормы.Количество(), 0);
	Ожидаем.Что(ЭлементыФормы.Количество()).Равно(0);

КонецПроцедуры // ИмяПроцедуры()

Процедура Тест_Должен_ПереместитьЭлементОдинРодитель() Экспорт

	ПолучитьФормуДляТеста();
	ЭлементыФормы = Форма.Элементы;

	Элемент1 = ЭлементыФормы.Добавить("ТекстовоеПоле1", "ПолеФормы", Неопределено);
	Элемент1.Заголовок = "ТекстовоеПоле1";

	Элемент2 = ЭлементыФормы.Добавить("ТекстовоеПоле2", "ПолеФормы", Неопределено);
	Элемент2.Заголовок = "ТекстовоеПоле2";

	Сообщить("Родитель: " + Элемент1.Родитель);

	ЭлементыФормы.Переместить(Элемент1, Элемент1.Родитель, Элемент2);
	
	Форма.Показать();

КонецПроцедуры

Процедура Тест_Должен_ПереместитьЭлементРазныеРодители() Экспорт

	ПолучитьФормуДляТеста();
	ЭлементыФормы = Форма.Элементы;
	ВидГруппыФормы = Форма.ВидГруппыФормы;
	ВидПоляФормы = Форма.ВидПоляФормы;

	Группа1 = ЭлементыФормы.Добавить("ОбычнаяГруппа1", "ГруппаФормы", Неопределено);
	Группа1.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа1.Заголовок = "Группа1";

	Элемент1 = ЭлементыФормы.Добавить("ТекстовоеПоле1", "ПолеФормы", Группа1);
	Элемент1.Вид = ВидПоляФормы.ПолеВвода;
	Элемент1.Заголовок = "ТекстовоеПоле1";

	Группа2 = ЭлементыФормы.Добавить("ОбычнаяГруппа2", "ГруппаФормы", Неопределено);
	Группа2.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа2.Заголовок = "Группа2";

	Элемент2 = ЭлементыФормы.Добавить("ТекстовоеПоле2", "ПолеФормы", Группа2);
	Элемент2.Вид = ВидПоляФормы.ПолеВвода;
	Элемент2.Заголовок = "ТекстовоеПоле2";

	Элемент3 = ЭлементыФормы.Добавить("ТекстовоеПоле3", "ПолеФормы", Группа2);
	Элемент3.Вид = ВидПоляФормы.ПолеВвода;
	Элемент3.Заголовок = "ТекстовоеПоле3";

	Кнопка1 = ЭлементыФормы.Добавить("Кнопка1", "КнопкаФормы", Группа2);
	Кнопка1.Заголовок = "Кнопка1";

	Группа3 = ЭлементыФормы.Добавить("ОбычнаяГруппа3", "ГруппаФормы", Неопределено);
	Группа3.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа3.Заголовок = "Группа3";

	ЭлементыФормы.Переместить(Элемент1, Элемент3.Родитель, Элемент3);
	ЭлементыФормы.Переместить(Кнопка1, Элемент3.Родитель, Элемент1);
	ЭлементыФормы.Переместить(Группа3, Группа1, Неопределено);
	ЭлементыФормы.Переместить(Элемент1, Группа3, Неопределено);
	ЭлементыФормы.Переместить(Кнопка1, Группа1.Родитель, Неопределено);
	
	Форма.Показать();

	// юТест.ПроверитьРавенство(Элемент1.Родитель, Группа3);
	// юТест.ПроверитьРавенство(Кнопка1.Родитель, Форма);
	// юТест.ПроверитьРавенство(Группа3.Родитель, Группа1);
	
	Ожидаем.Что(Элемент1.Родитель).Равно(Группа3);
	Ожидаем.Что(Кнопка1.Родитель).Равно(Форма);
	Ожидаем.Что(Группа3.Родитель).Равно(Группа1);

КонецПроцедуры
//////////////////////////////////////////////////////////////////////////////////////
// Инициализация

//Инициализация();

