# Компонент по созданию форм для 1script

Внешняя компонента позволяет создавать формы на языке 1script. API работы с формами максимально приближен к синтаксису 1С.

Доступны основные элементы формы и события:

### Виды полей:

- ПолеВвода - Однострочное текстовое поле;
- ПолеИндикатора - Прогрессбар.
- ПолеКалендаря - Поле для ввода даты
- ПолеНадписи - Надпись (декорация в терминалогии 1С)
- ПолеФлажка - Флажок, имеет статусы: Включен/Выключен
- ПолеТекстовогоДокумента - Многострочный текст
- ПолеСоСписком - Поле со списком (ComboBox)
- ПолеСписка - Поле списка (ListBox)
- ОбычнаяГруппа - Контейнер для группы элементов
- Страница -  Страницы
- Кнопка

### Обрабатываемые события

- Форма: ПриОткрытии
- Кнопка: ПриНажатии
- ПолеФормы: ПриИзменении, ПриВыборе (нажат Enter)
  - ПолеСписка: ПриДвойномКлике

## Примеры

### Создание формы и вывод надписи

<img src="https://raw.githubusercontent.com/ret-Phoenix/oscript-simple-gui/master/docs/example-decoration.png" alt="Декорация">

<pre>
Перем Форма;

Процедура Инициализация()

    //# Загружаем внешнюю компоненту
    ПодключитьВнешнююКомпоненту(ОбъединитьПути(КаталогПрограммы(), "oscript-simple-gui.dll"));

    УправляемыйИнтерфейс = Новый УправляемыйИнтерфейс();
    Форма = УправляемыйИнтерфейс.СоздатьФорму();

    //# Устанавливаем обработку события ПриОткрытии
    Форма.УстановитьДействие(ЭтотОбъект, "ПриОткрытии", "ПриОткрытииФормы");
    Форма.Показать();

КонецПроцедуры

//# Обработка события первого открытия формы
Процедура ПриОткрытииФормы() Экспорт
    
    Декорация1 = Форма.Элементы.Добавить("Декорация1", "ПолеФормы", Неопределено);
    Декорация1.Вид = Форма.ВидПоляФормы.ПолеНадписи;
    Декорация1.Заголовок = "Это действительно работает!";
    
    Форма.Высота = 100;

КонецПроцедуры

Инициализация();
</pre>

### Создание формы с кнопкой и обработка события нажатия на кнопку

<img src="https://raw.githubusercontent.com/ret-Phoenix/oscript-simple-gui/master/docs/example-button-n-edit.gif" alt="Кнопка + обработка события нажатия на кнопку">

<pre>
Перем Форма;

Процедура Инициализация()

    //# Загружаем внешнюю компоненту
    ПодключитьВнешнююКомпоненту(ОбъединитьПути(КаталогПрограммы(), "oscript-simple-gui.dll"));

    УправляемыйИнтерфейс = Новый УправляемыйИнтерфейс();
    Форма = УправляемыйИнтерфейс.СоздатьФорму();

    //# Устанавливаем обработку события ПриОткрытии
    Форма.УстановитьДействие(ЭтотОбъект, "ПриОткрытии", "ПриОткрытииФормы");
    Форма.Показать();

КонецПроцедуры

//# Обработка события первого открытия формы
Процедура ПриОткрытииФормы() Экспорт
    
    ПолеВвода1 = Форма.Элементы.Добавить("ПолеВвода1", "ПолеФормы", Неопределено);
    ПолеВвода1.Вид = Форма.ВидПоляФормы.ПолеВвода;
    ПолеВвода1.Заголовок = "Поле ввода";
    ПолеВвода1.Значение = "Значение задано из скрипта";

    Кнопка1 = Форма.Элементы.Добавить("Кнопка1", "КнопкаФормы", Неопределено);
    Кнопка1.Заголовок = "Нажми меня";
    Кнопка1.УстановитьДействие(ЭтотОбъект, "Нажатие", "ПриНажатииНаКнопку1");

КонецПроцедуры

Процедура ПриНажатииНаКнопку1() Экспорт
    Форма.Элементы.Найти("ПолеВвода1").Значение = "Значение после нажатия на кнопку";
КонецПроцедуры

Инициализация();
</pre>

### Пример работы с выпадающим списком

<img src="https://raw.githubusercontent.com/ret-Phoenix/oscript-simple-gui/master/docs/example-combobox-change-event.png" alt="Поле со списком">

<pre>
Перем Форма;

Процедура Инициализация()

    //# Загружаем внешнюю компоненту
    ПодключитьВнешнююКомпоненту(ОбъединитьПути(КаталогПрограммы(), "oscript-simple-gui.dll"));

    УправляемыйИнтерфейс = Новый УправляемыйИнтерфейс();
    Форма = УправляемыйИнтерфейс.СоздатьФорму();

    //# Устанавливаем обработку события ПриОткрытии
    Форма.УстановитьДействие(ЭтотОбъект, "ПриОткрытии", "ПриОткрытииФормы");
    Форма.Показать();

КонецПроцедуры

//# Обработка события первого открытия формы
Процедура ПриОткрытииФормы() Экспорт
    
    Данные = Новый Соответствие;
    Данные.Вставить("Один", "1");
    Данные.Вставить("Два", "2");
    Данные.Вставить("Три", "3");

    ПолеСоСписком1 = Форма.Элементы.Добавить("ПолеСоСписком1", "ПолеФормы", Неопределено);
    ПолеСоСписком1.Заголовок = "Поле со списком";
    ПолеСоСписком1.Вид = Форма.ВидПоляФормы.ПолеСоСписком;
    ПолеСоСписком1.СписокВыбора = Данные;
    ПолеСоСписком1.Значение = "3";
    ПолеСоСписком1.УстановитьДействие(ЭтотОбъект, "ПриИзменении", "ПриИзменииЗначения");

    Форма.Высота = 80;

КонецПроцедуры

Процедура ПриИзменииЗначения() Экспорт
    Сообщить("Новое значение: " +  Форма.Элементы.Найти("ПолеСоСписком1").Значение);
КонецПроцедуры

Инициализация();
</pre>

# Примеры использования
- https://github.com/ret-Phoenix/oscript-simple-gui/tree/master/examples
- https://github.com/ret-Phoenix/oscript-simple-gui/tree/master/bin/src
- https://github.com/ret-Phoenix/oscript-simple-gui/tree/master/tests
- http://infostart.ru/public/540284/

