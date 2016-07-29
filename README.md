# Компонент по созданию форм для 1script

API очень похож на 1С

Пример:

<pre>
Процедура ПриНажатииКнопка1() Экспорт
	Сообщить("Нажали на кнопку");
	ТекстовоеПоле1.Значение = "По кнопке ...";
КонецПроцедуры

//# Создание страниц
Страницы = ЭлементыФормы.Добавить("Страницы1", "ГруппаФормы", Неопределено);
Страницы.Вид = ВидГруппыФормы.Страницы;
Страницы.Заголовок = "Страницы";

Страница1 = ЭлементыФормы.Добавить("Страница1", "ГруппаФормы", Страницы);
Страница1.Вид = ВидГруппыФормы.Страница;
Страница1.Заголовок = "Страница1";

ТекстовоеПоле3 = ЭлементыФормы.Добавить("ТекстовоеПоле3", "ПолеФормы", Страница1);
ТекстовоеПоле3.Заголовок = "Еще реквизит:";
ТекстовоеПоле3.Вид = ВидыПоляФормы.ПолеВвода;
ТекстовоеПоле3.Значение = "Какой-то текст ...";
ТекстовоеПоле3.ТолькоПросмотр = Истина;

Страница2 = ЭлементыФормы.Добавить("Страница2", "ГруппаФормы", Страницы);
Страница2.Вид = ВидГруппыФормы.Страница;
Страница2.Заголовок = "Страница2";

//# Создаем кнопку
Кнопка1 = ЭлементыФормы.Добавить("Кнопка1", "КнопкаФормы", Страница2);
Кнопка1.Заголовок = "Нажми меня";
Кнопка1.КнопкаНажатие(ЭтотОбъект,"ПриНажатииКнопка1");
</pre>

<img src="https://files.gitter.im/xDrivenDevelopment/1c-syntax/blob">

# Классы

## ПростойГУИ/SimpleGUI

### Свойства

- Версия/Version - Строка - Только чтение - Номер версии;

### Методы

- СоздатьФорму/CreateForm - Форма - Создать форму (близка к Управляемой форме) 

## Форма/Form

### Свойства

- ВидПоляФормы/FormFieldType - ВидПоляФормы  

- ВидГруппыФормы/FormGroupType

- ПоложениеЗаголовка/TitleLocation

- Заголовок/Caption

### Методы

- Показать/Show

- ПоказатьНеМодально/ПоказатьНеМодально

- Элементы/Items 

  - Возвращаемое значение

    - Коллекция с ПолеФормы, ГруппаФормы, КнопкаФормы

## Элементы/Items

### Свойства

### Методы

- Количество/Count - Число - Количество элементов

- Найти/Find - Найти элемент по имени элемента

  - Параметры

    - ИмяЭлемента - Строка

  - Возвращаемое значение

    - ПолеФормы, ГруппаФормы, КнопкаФормы, Неопределено

- Удалить - Удалить элемент
 
  - Параметры

    - ПолеФормы, ГруппаФормы, КнопкаФормы

- Переместить/Move - Переместить элемент

  - Параметры

    - Элемент - ПолеФормы, ГруппаФормы, КнопкаФормы  
  
    - Родитель - ГруппаФормы, УправляемаяФорма - Новый родитель элемента. Может совпадать со старым. 

    - МестоРасположения - ПолеФормы, ГруппаФормы, КнопкаФормы - Элемент, перед которым нужно разместить перемещаемый элемент. Если не задан, то перемещается в конец коллекции. 

- Добавить/Add - Добавить элемент на форму

  - Параметры

    - ИмяЭлемента - Строка - Уникальное имя элемента

	- ТипЭлемента - Строка - Тип элемента (ПолеФормы, ГруппаФормы, КнопкаФормы)
	
	- Родитель - ГруппаФормы, Неопределено - Родитель для добавляемого элемента. Если не указан, то добавляется на верхний уровень. 
  
## КнопкаФормы/FormButton

### Свойства

  - Родитель/Parent - ГруппаФормы, УправляемаяФорма - Только чтение - Содержит ссылку на родительский элемент.

  - Имя/Name - Строка - Имя кнопки

  - Видимость/Visible - Булево - Видимость кнопки

  - Доступность/Enabled - Булево - Доступность кнопки

  - Заголовок/Title - Строка - Надпись на кнопке

### Методы

- КнопкаНажатие/ButtonClick - deprecated - Обработчик нажатия на кнопку

  - Параметры
    - Скрипт - Объект -  ссылка на скрипт с обработиком события

	- ИмяМетода - Строка - Имя метода обработчика события

	<pre>
	Кнопка1 = ЭлементыФормы.Добавить("Кнопка1", "КнопкаФормы", Неопределено);
	Кнопка1.Заголовок = "Нажми меня";
	Кнопка1.КнопкаНажатие(ЭтотОбъект,"ПриНажатииКнопка1");
	</pre> 

- УстановитьДействие/SetAction - Устанавливает обработчик события.

  - Параметры
    - Скрипт - Объект - Ссылка на скрипт с обработчиком события

    - ИмяСобытия - Строка - Имя события. Для кнопки только "Нажатие"

    - ИмяМетода - Строка - Имя метода для обработчика

- ПолучитьДействие/GetAction - Получает имя установленного обработчика события.
  - Параметры

    - ИмяСобытия - Строка - Имя события. Для кнопки только "Нажатие"

## ПолеФормы/FormField

### Свойства

 - Значение/Value - Установка и получение значения. 
 - Вид/Type - ВидПоляФормы
 - Имя/Name - Строка
 - Видимость/Visible - Булево 
 - Доступность/Enabled - Булево
 - Заголовок/Title - Строка
 - ПоложениеЗаголовка/TitleLocation - ПоложениеЗаголовка
 - СписокВыбора/ChoiceList - Соответствие
 - Родитель/Parent - ГруппаФормы, УправляемаяФорма - Только чтение
 - ТолькоПросмотр/ReadOnly - Булево 

### Методы

- УстановитьДействие/SetAction - Устанавливает обработчик события.

  - Параметры
    - Скрипт - Объект - Ссылка на скрипт с обработчиком события

    - ИмяСобытия - Строка - Имя события. Для кнопки только "Нажатие"

    - ИмяМетода - Строка - Имя метода для обработчика

- ПолучитьДействие/GetAction - Получает имя установленного обработчика события.
  - Параметры

    - ИмяСобытия - Строка - Имя события. Для кнопки только "Нажатие"


## ВидПоляФормы/FormFieldType

- ПолеВвода/InputField

- ПолеИндикатора/ProgressBarField

- ПолеКалендаря/CalendarField

- ПолеНадписи/LabelField

- ПолеФлажка/CheckBoxField

- ПолеТекстовогоДокумента/TextDocumentField

- ПолеСоСписком/ComboBox


## ВидГруппыФормы/FormGroupType

- ОбычнаяГруппа/UsualGroup

- Страница/Page

- Страницы/Pages


## ПоложениеЗаголовка

- Авто/Auto

- Верх/Top

- Лево/Left

- Нет/None

- Низ/Bottom

- Право/Right