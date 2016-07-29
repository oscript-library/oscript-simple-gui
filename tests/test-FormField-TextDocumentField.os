#Использовать asserts

Перем юТест;
Перем ВидыПоляФормы;
Перем Форма;
Перем ТекстПроверки;
// Перем ПростойГУИ;

Процедура Инициализация()
	ПодключитьВнешнююКомпоненту("oscript-component/bin/Release/oscript-simple-gui.dll");
КонецПроцедуры

Функция ПолучитьСписокТестов(Тестирование) Экспорт

	юТест = Тестирование;

	СписокТестов = Новый Массив;
	СписокТестов.Добавить("Тест_Должен_СоздатьПоле");
	СписокТестов.Добавить("Тест_Должен_ПровестиРаботуСоЗначением");
	СписокТестов.Добавить("Тест_Должен_УстановитьИПроверитьДействиеПриИзмении");
	СписокТестов.Добавить("Тест_Должен_ПолучитьДействие");
	
	Возврат СписокТестов;

КонецФункции

//# Работа с событиями
Процедура ПриОткрытииФормы() Экспорт
	// Форма.Закрыть();
КонецПроцедуры

Функция ПолучитьФорму()

	ПростойГУИ = Новый ПростойГУИ();
	Форма = ПростойГУИ.СоздатьФорму();
	Форма.УстановитьДействие(ЭтотОбъект, "ПриОткрытии", "ПриОткрытииФормы");
	ВидыПоляФормы = Форма.ВидПоляФормы;

КонецФункции


Процедура Тест_Должен_СоздатьПоле() Экспорт

	ПолучитьФорму();

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеТекстовогоДокумента;

	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("Поле1"), Неопределено);

	Форма.Показать();

КонецПроцедуры

Процедура Тест_Должен_ПровестиРаботуСоЗначением() Экспорт

	ПолучитьФорму();
	
	НовоеЗначение = "Большой текст." + Символы.ВК + Символы.ПС + "Еще строка текста.";

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеТекстовогоДокумента;
	Поле1.Значение = НовоеЗначение;

	Форма.Показать();

	юТест.ПроверитьРавенство(Форма.Элементы.Найти("Поле1").Значение, НовоеЗначение);

КонецПроцедуры

//# Работа с событиями
Процедура ПриИзменииЗначения() Экспорт
	ТекстПроверки = "Новое значение: ";
КонецПроцедуры

Процедура Тест_Должен_УстановитьИПроверитьДействиеПриИзмении() Экспорт
	ПолучитьФорму();
	
	НовоеЗначение = "Большой текст." + Символы.ВК + Символы.ПС + "Еще строка текста.";

	ТекстПроверки = "Событие не отработало: ПриИзменииЗначения: ";
	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеТекстовогоДокумента;
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриИзменении", "ПриИзменииЗначения");
	Поле1.Значение = НовоеЗначение;
	Форма.Показать();

	юТест.ПроверитьРавенство(ТекстПроверки + Форма.Элементы.Найти("Поле1").Значение, "Новое значение: " + НовоеЗначение);

КонецПроцедуры

Процедура Тест_Должен_ПолучитьДействие() Экспорт
	ПолучитьФорму();

	Поле1 = Форма.Элементы.Добавить("Поле1", "ПолеФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.ПолеТекстовогоДокумента;
	Поле1.УстановитьДействие(ЭтотОбъект, "ПриИзменении", "ПриИзменииЗначения");

	юТест.ПроверитьНеРавенство(Форма.Элементы.Найти("Поле1").ПолучитьДействие("ПриИзменении"), "");

	Форма.Показать();

КонецПроцедуры

//////////////////////////////////////////////////////////////////////////////////////
// Инициализация

Инициализация();
