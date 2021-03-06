Перем Форма;
Перем ДанныеСписка;
Перем ПолеПоиска;
Перем СписокВариантов;
Перем СтрДанные;
Перем ВыбранноеЗначение;
Перем УправляемыйИнтерфейс;

Процедура ПриИзмененииПолеПоиска() Экспорт

    СтрПоиска = ПолеПоиска.Значение;
    СтрПоиска = СтрЗаменить(СтрПоиска, " ", ".*");

    РегВыражение = Новый РегулярноеВыражение("(.*)(" + СтрПоиска + ")(.*)");
    РегВыражение.ИгнорироватьРегистр = Истина;
    РегВыражение.Многострочный = Истина;
    Совпадения = РегВыражение.НайтиСовпадения(СтрДанные);

    ДанныеСписка.Очистить();
    Для каждого Сп Из Совпадения Цикл

        СпГр = Сп.Группы;
        Если СокрЛП(СпГр[1].Значение) <> "" Тогда
            ДанныеСписка.Вставить(СокрЛП(СпГр[0].Значение),СокрЛП(СпГр[1].Значение));
            СписокВариантов.СписокВыбора = ДанныеСписка;
        КонецЕсли;

    КонецЦикла;

КонецПроцедуры

Процедура ПриДвойномКликеСписокВыбора() Экспорт

	Тек = Форма.Элементы.Найти("СписокВариантов");
    ВыбранноеЗначение = Тек.Значение;

КонецПроцедуры


Функция ПолучитьЗначение() Экспорт
    
    Возврат ВыбранноеЗначение;

КонецФункции // ПолучитьЗначение() Экспорт

Процедура ПриОткрытииФормы() Экспорт

    ДанныеСписка = Новый Соответствие;

    ПолеПоиска = Форма.Элементы.Добавить("ПолеПоиска", "ПолеФормы", Неопределено);
    ПолеПоиска.Вид = Форма.ВидПоляФормы.ПолеВвода;
    ПолеПоиска.Заголовок = "";
    ПолеПоиска.Закрепление = УправляемыйИнтерфейс.СтильЗакрепления.Верх;
    ПолеПоиска.УстановитьДействие(ЭтотОбъект, "ПриИзменении", "ПриИзмененииПолеПоиска");

    СписокВариантов = Форма.Элементы.Добавить("СписокВариантов", "ПолеФормы", Неопределено);
    СписокВариантов.Вид = Форма.ВидПоляФормы.ПолеСписка;
    СписокВариантов.Закрепление = УправляемыйИнтерфейс.СтильЗакрепления.Заполнение;
    СписокВариантов.Заголовок = "";
    СписокВариантов.УстановитьДействие(ЭтотОбъект, "ПриВыборе", "ПриДвойномКликеСписокВыбора");
    СписокВариантов.УстановитьДействие(ЭтотОбъект, "ПриДвойномКлике", "ПриДвойномКликеСписокВыбора");

	Форма.ТекущийЭлемент = ПолеПоиска;

    ПриИзмененииПолеПоиска();

КонецПроцедуры

Процедура УстановитьЗначенияДляВыбора(ЗначенияДляВыбора) Экспорт

    Если ТипЗнч(ЗначенияДляВыбора) = Тип("Строка") Тогда
        СтрДанные = ЗначенияДляВыбора;
    Иначе
        ВызватьИсключение "Не верный тип данных для выбора из списка: " + ТипЗнч(ЗначенияДляВыбора);
    КонецЕсли;

КонецПроцедуры

Процедура Показать() Экспорт

    УправляемыйИнтерфейс = Новый УправляемыйИнтерфейс();
    Форма = УправляемыйИнтерфейс.СоздатьФорму();
    Форма.УстановитьДействие(ЭтотОбъект, "ПриОткрытии", "ПриОткрытииФормы");
    Форма.Показать();
    
КонецПроцедуры

Процедура Конструктор()

    ПодключитьВнешнююКомпоненту(КаталогПрограммы() + "\oscript-simple-gui.dll");

КонецПроцедуры

Конструктор();