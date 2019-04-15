# language: ru

Функционал: Выполнение операций по разборке на исходники с помощью хука pre-commit
    Как Пользователь
    Я хочу иметь возможность разбирать внешние файлы на исходники с помощью хука pre-commit
    Чтобы я не делал вручную разборку при commit'е

Контекст:
    Допустим я создаю временный каталог и сохраняю его в контекст
    И я сохраняю каталог проекта в контекст
    И я устанавливаю временный каталог как рабочий каталог
    И я установил рабочий каталог как текущий каталог
    И Я выполняю команду "git" с параметрами 'init'

Сценарий: Разборка изменений по журналу Git с вложенными каталогами
    Дано я устанавливаю Precommit в рабочий каталог с параметрами ""
    И я создаю каталог "1" в рабочем каталоге
    И я копирую файл "Fixture.epf" из каталога "tests" проекта в подкаталог "1" рабочего каталога
    И я создаю каталог "src" в рабочем каталоге
    И я выполняю команду "git" с параметрами "add -A ."
    Когда я выполняю команду "git" с параметрами 'commit -m "init commit"'
    Тогда в рабочем каталоге существует каталог "src/1/Fixture"
    И в подкаталоге "src/1/Fixture" рабочего каталога существует файл "renames.txt"
    И в подкаталоге "src/1/Fixture" рабочего каталога существует каталог "Form"
    И в подкаталоге "src/1/Fixture" рабочего каталога существует каталог "Макеты"
    И в подкаталоге "src/1/Fixture" рабочего каталога существует каталог "und"
    И вывод команды "git" содержит "create mode 100644 1/Fixture.epf"

Сценарий: Разборка изменений по журналу Git с вложенными каталогами с удалением бинарников из кэша
    Дано я устанавливаю Precommit в рабочий каталог с параметрами "--remove-orig-bin-files"
    И я создаю каталог "1" в рабочем каталоге
    И я копирую файл "Fixture.epf" из каталога "tests" проекта в подкаталог "1" рабочего каталога
    И я создаю каталог "src" в рабочем каталоге
    И я выполняю команду "git" с параметрами "add -A ."
    Когда я выполняю команду "git" с параметрами 'commit -m "init commit"'
    Тогда в рабочем каталоге существует каталог "src/1/Fixture"
    И в подкаталоге "src/1/Fixture" рабочего каталога существует файл "renames.txt"
    И в подкаталоге "src/1/Fixture" рабочего каталога существует каталог "Form"
    И в подкаталоге "src/1/Fixture" рабочего каталога существует каталог "Макеты"
    И в подкаталоге "src/1/Fixture" рабочего каталога существует каталог "und"
    И вывод команды "git" не содержит "create mode 100644 1/Fixture.epf"
