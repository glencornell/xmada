Версия 0.3 (XXXX-XX-XX)
-----------------------

В связку с Xlib добавлены:
   подпрограмма XCirculateSubwindowsDown
   подпрограмма XCirculateSubwindowsUp
   подпрограмма XInitThreads
   подпрограмма XLowerWindow
   подпрограмма XRaiseWindow
   подпрограмма XSync
   расширена реализация событий X

В связку с Xt добавлены:
   подпрограмма XtAddWorkProc
   подпрограмма XtAppAddWorkProc
   подпрограмма XtConvertAndStore
   подпрограмма XtRemoveWorkProc
   подпрограмма XtTranslateCoords

В связку с Xm добавлены:
   подпрограмма XmSpinBoxValidatePosition
   подпрограмма Xt_Set_Arg для типа Xm_Include_Status
   подпрограмма XmeSetWMShellTitle

В связку с Microline добавлены:
   подпрограмма XmLGridRowColumnToXY
   подпрограмма XmLGridXYToRowColumn

Пакеты связки Xlib отвечающие за расширения вынесены в отдельные библиотеки для
исключения необходимости сборки конечной программы со всеми этими библиотеками.

В состав дистрибутива включён прототип дизайнера графических интерфейсов
пользователя. Дизайнер обеспечивает визуальное создание интерфейса,
редактирование ресурсов, генерацию файлов ресурсов приложения и Ada кода
создания и установки ресурсов виджетов интерфейса.
