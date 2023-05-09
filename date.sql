SELECT TO_CHAR(TO_DATE('&&date_select', 'DD.MM.SYYYY','NLS_DATE_LANGUAGE=ENGLISH'), 'DD.MM.SYYYY','NLS_DATE_LANGUAGE=ENGLISH')
/*Приводим введенную дату к нужному формату*/ AS "Заданная дата",
TO_CHAR((CASE 
    WHEN MONTHS_BETWEEN(TO_DATE('&date_select', 'DD.MM.SYYYY','NLS_DATE_LANGUAGE=ENGLISH'),
    (NEXT_DAY((ADD_MONTHS(TRUNC( TO_DATE('&date_select', 'DD.MM.SYYYY','NLS_DATE_LANGUAGE=ENGLISH'),'YEAR')
    /*окургляем введенную дату по году*/
    ,7)-1
    /*получаем 1 августа*/
    ),1)
     /*отнимаем 1 день, чтобы избежать случая, когда 1 августа - понедельник*/
    /*получаем ближайший понедельник*/-42/*отнимаем 6 недель - 42 дня*/))<=0
    /*Проверяем больше ли полученная дата турнира введенной даты*/
    THEN NEXT_DAY((ADD_MONTHS(TRUNC( 
    TO_DATE('&date_select', 'DD.MM.SYYYY','NLS_DATE_LANGUAGE=ENGLISH'),'YEAR'),7)-1),1)-42
    ELSE NEXT_DAY((ADD_MONTHS(TRUNC( 
    TO_DATE('&date_select', 'DD.MM.SYYYY','NLS_DATE_LANGUAGE=ENGLISH'),'YEAR'),19)-1),1)-42
    /*если введенная дата больше, то к округленной по году введенной дате добавляем год и 7 месяцев*/
END), 'DD.MM.SYYYY','NLS_DATE_LANGUAGE=ENGLISH') AS "Дата начала турнира"
FROM dual;
UNDEFINE date_select
