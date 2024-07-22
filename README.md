<div align="center">

### _**WeatherEvents**_
_**Примеры реализации нативных анимаций для погодных явлений**_
 </div>


## 🌠 About WeatherEvents
> 📅 1-й спринт: 16.07.2024 - 22.07.2024

1. В верхней части экрана выводится горизонтальная коллекция погодных явлений (ясно/дождь/гроза/туман и т.д), которая будет служить селектором этих явлений. Каждое погодное явление имеет анимированную интерфейсную реализацию на всем экране
2. При старте приложения рандомно выбирается одно явление и отображается на экране
3. При выборе (нажатии на элемент коллекции) погодного явления происходит анимированная смена одного явления на другое
   <br>

## 🎈Road Map
> Coming soon...
<br>

## 🧑‍💻 Authors
>  Пока только я :(

| ![](https://tenor.com/ru/view/sad-pablo-lonely-alone-gif-12928789.gif)
|:--------------------------------------------------------------------------|
| [Все проекты](https://github.com/wonsarc?tab=projects)                    |
| iOS - Developer                                                           |
<br>

## ⚖️ Technology Stack
#### Development Stack

<img src="https://img.shields.io/badge/iOS-000000?style=flat-square&logo=iOS&logoColor=white" alt=""/> <img src="https://img.shields.io/badge/Swift-F05138?style=flat-square&logo=Swift&logoColor=white" alt=""/> <img src="https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=UIKit&logoColor=white" alt=""/>

#### Develop Environment

<img src="https://img.shields.io/badge/iOS-14.7-000000?style=flat-square&logo=iOS&logoColor=white" alt=""/> <img src="https://img.shields.io/badge/Xcode-15.4-147EFB?style=flat-square&logo=Xcode&logoColor=white" alt=""/> 

<br>

## ⚖️ Libraries
>  По условиям задания не использовал библиотеки

| Library | Version | Description |
|:-------:|:-------:|:-----------:|
|    -    |    -    |      -      |
<br>

## 📕 Code Convention
> Договоренности по Code Style
<details>
<summary> Договоренности </summary>
<div>

### Отступы
- Для отступов используем табуляцию
- При вводе двоеточия (`:`) оставляем пробел только справа от двоеточия
    ```
    let names: [String: String]?
    ```

### Разрыв строки
- Длинный вызов функции переносим по имени параметра

    ```
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    ```

### Пустые строки
- Все файлы заканчиваются пустой строкой
- Пустая строка до и после MARK

    ```
  final class WeatherEventService: WeatherEventServiceProtocol {

    // MARK: - Private Properties

    private lazy var events: [WeatherEvent] = {
        WeatherEventService.createEvents()
    }()
    ```

### Импорт
- Импортируемые модули сортируются в алфавитном порядке
- Сначала импортируем встроенный фреймворк, а затем сторонний, разделенный пустыми строками
- Импорт сводится к минимуму. Например, UIKit включает Foundation

```
import UIKit

import ProgressHUD
import YandexMobileMetrica
```

### Классы и структуры

- Используем верхний регистр для имен классов и структур
- Назвиние класса без префикса Prefix

**Пример:**

    ```swift
    class SomeClass {
      // class definition goes here
    }
    
    struct SomeStructure {
      // structure definition goes here
    }
    ```

### Функция

- Используем нижний регистр для имен функций
- Не ставим "get" перед именем функции

  **Пример:**

    ```swift
    func changeAnimation(to view: WeatherViewProtocol?)
    ```

### Переменные

- Используем нижний регистр для имен переменных

  **Пример:**

    ```
    var maximumNumberOfLines = 2
    ```

### Константы

- Используем нижний регистр для имен констант

  **Пример:**

    ```
    let maximumNumberOfLines = 3
    ```

### Перечисление
- Используем верхний регистр для названия **enum**
- Используем верхний регистр для названия **case**

  **Пример:**

    ```
    enum Type {
      case .snow
      case .sun
    }
    ```
## Комментарии

- Используем "/// ", чтобы оставлять комментарии для документации
    ```
    /// Weather Colors
    static let rainColor = UIColor(hex: 0xCBE1EE)
    static let sunColor = UIColor(hex: 0xFAC555)
    ```

- Используем // MARK: - для разделения кода в данном порядке:

    ```
  // MARK: - IB Outlets
  
  // MARK: - Public Properties
  
  // MARK: - Private Properties
  
  // MARK: - Initializers
  
  // MARK: - Overrides Methods
  
  // MARK: - IB Actions
  
  // MARK: - Public Methods
  
  // MARK: - Private Methods
    ```

- Классы, которые больше не наследуются, всегда объявляются с ключевым словом "**final**"
- При реализации протокола используем **extension**

  **Пример**:

    ```swift
    final class MyViewController: UIViewController {
      // ...
    }
    
    // MARK: - UITableViewDataSource
    
    extension MyViewController: UITableViewDataSource {
      // ...
    }
    
    // MARK: - UITableViewDelegate
    
    extension MyViewController: UITableViewDelegate {
      // ...
    }
    ```
</div>
</details>
<br>

## 🗂 Project Structure

```swift
WeatherCollection
├── DesignSystem
│   ├── Colors
│   ├── Animations
│   │   ├── WeatherAnimation
│   │   ├── SunAnimation
│   │   ├── CloudAnimation
│   │   ├── FogAnimation
│   │   ├── RainAnimation
│   │   ├── SnowAnimation
│   │   ├── LightningAnimation
│   │   ├── WindyAnimation
│   │   ├── RanbowAnimation
├── Services
│   ├── WeatherEventService
│   ├── AnimateWeatherService
├── Models
│   ├── WeatherEvent
│   ├── WeatherType
├── Scenes
│   ├── Weather
│   │   ├── WeatherCollectionPresenter
│   │   ├── WeatherCollectionViewController
│   │   ├── WeatherViewCell
│   │   ├── WeatherView
├── Resources
│   ├── LaunchScreen.storyboard
│   ├── Assets.xcassets
│   ├── InfoPlist.strings
│   │   ├── English
│   │   ├── Russian
│   ├── Localizable.strings
│   │   ├── English
│   │   ├── Russian
├── AppDelegate
└── Info.plist
```
<br>

## 🔀 Git Convention

### GitHub Flow
> Coming soon ...
