# musiclib
## Какие проблемы решает этот проект?
Данный проект решает одну специфическую проблему. Он предназначен для организации музыкальной библиотеки в формате flac.
Какая в этом проблема? Если скачивать музыкальные файлы с торент-трекеров, то файл не может быть отредактирован, файл не может быть переименован без нарушения раздачи.
Данный проект позволяет создать виртуальные файлы с замененной мета-информацией.
## Как работает данное приложение?
Приложение имеет web-интерфейс. После того как в директорию с оригинальными файлами добавились новые файлы, нужно пересканировать музыкальную библиотеку.

В перечне альбомов появятся новые альбомы в статусе DRAFT.

Пользователь должен проверить корректность инофрмации о альбоме и при необходимости внести изменения.

После перевода аьбома в статус ACTIVE, альбом появляется в виртуальной файловой системе музыкальной библиотеки.

Виртуальная файловая система на лету подменяет куски файлов с оригинальной метоинформацией, на метоинформацию из музыкальной библиотеки.
