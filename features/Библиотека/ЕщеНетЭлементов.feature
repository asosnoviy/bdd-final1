﻿#encoding: utf-8
#language: ru
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Очистка регистров справочников и документов
    Как программист
    Я хочу быстро очищать регистры справочники и документы
    Чтобы быстро готовить контекст

Сценарий: еще нет записей в регистре сведений "ИмяРегистра" 
    Когда я использую этот шаг  
    Тогда Удаляются все записи регистра сведений "ИмяРегистра" 

