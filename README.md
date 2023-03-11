# WeatherForecast


WeatherForecast - приложение прогноза погоды демонстрирующее адаптивную сложную верстку кодом на фреймворке 
UIKit без использования сторибордов, с возможностью автоопределения местоположения юзера и кэшированием информации в CoreData 


### Использованные библиотеки
UIKit, CoreData, CoreLocation 


### Архитектура, методология 
MVC + Coordinator + Assembly 

### Слои 
AppLayer, ServiceLayer, PresentationLayer, ViewModelLayer, ModelLayer


## Прeимущества проекта:

1. Удобное информативное меню основного экрана показывает время восхода и заката солнца, 
текущую, максимальную и минимальную температуру, облачность, скорость ветра, влажность. 
Также присутствует красивый скрол с подробной дневной температурой.

https://user-images.githubusercontent.com/103641721/224261303-0f888f0b-cd94-43d0-81dd-d4ea4e4cf11d.mp4


2. Реализованы настройки измерений температуры в градусах Цельсия или Фаренгейтах,
скорости ветра в милях или километрах, а также разный формат времени.

https://user-images.githubusercontent.com/103641721/224261924-8d0a7ea9-28e9-4061-b137-cf38e0c6ec86.mp4

3. В приложении очень информативный экран прогноза погоды на 24 часа с красивым кастомным графиком 

https://user-images.githubusercontent.com/103641721/224262429-5d0ecdf1-b1a2-4508-98c1-fcecafabb7e4.mp4

4. Есть возможность самому выбрать город без использования геолокации 

https://user-images.githubusercontent.com/103641721/224262815-746a421a-d90e-4dfc-b40b-046cd014b421.mp4

5.  Приложение адаптировано к смартфонам и планшетам с разными экранами 

https://user-images.githubusercontent.com/103641721/224263101-6ae2bd33-9db1-4a4b-ae9f-dd34824224d4.mp4


## Работа с сетью:

1. Данные из интернета берутся с помощью URLSession в бэкграунд потоке

https://user-images.githubusercontent.com/103641721/224263614-b38642c5-2584-40f6-b0d5-27bad3dffeb0.mp4

3. Сложный по своей структуре и количеству данных Json файл парсится с помощью протокола Codable 

4. Для быстрого отображения представлений при следующем входе информация кэшируется в CoreData

https://user-images.githubusercontent.com/103641721/224281315-525553b3-d196-4e49-87bf-808f3f177a3f.mp4

5. Для определения местоположения и названия города используется CoreLocation
6. Api для загрузки прогнозов погоды - https://api.openweathermap.org
