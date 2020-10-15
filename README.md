# DT Bunch of Extensions

This is my package with useful extensions to standard Swift classes and some tricky things.
Here I collect things that I use in my projects and which for some reason are not in the standard implementation. Feel free to use it as well as add your own methods. I am a novice developer, so some things can be done not very cleverly, so I will be glad to receive any feedback, comments, fixes and improvements.

## Extensions
### Int
#### getNoun

```swift
public func getNoun(_ root: String, singleEnd: String, dualEnd: String, multipleEnd: String) -> String
```
This function returns a word from its root and end depending on the number to which it is applied. It is useful for the Russian language.

##### Example

```swift
let one = 1
let two = 2
let five = 5
let twelve = 12

let root = "коти"
let singleEnd = "к"
let dualEnd = "ка"
let multipleEnd = "ков"

print("\(one) \(one.getNoun(root, singleEnd: singleEnd, dualEnd: dualEnd, multipleEnd: multipleEnd) )")
print("\(two) \(two.getNoun(root, singleEnd: singleEnd, dualEnd: dualEnd, multipleEnd: multipleEnd) )")
print("\(five) \(five.getNoun(root, singleEnd: singleEnd, dualEnd: dualEnd, multipleEnd: multipleEnd) )")
print("\(twelve) \(twelve.getNoun(root, singleEnd: singleEnd, dualEnd: dualEnd, multipleEnd: multipleEnd) )")

// 1 котик
// 2 котика
// 5 котиков
// 12 котиков
```



### String
#### calculateTextFieldHeight

```swift
public func calculateTextFieldHeight(width: CGFloat, font: UIFont) -> CGFloat
```
This function returns the text size in height with the specified width and font. It can be used to set the size of UITextView when the text size is not known.

##### Example

```swift
let text = """
Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.
"""

let font = UIFont.systemFont(ofSize: 17, weight: .medium)
let height = text.calculateTextFieldHeight(width: 250, font: font)
//result: 163
```



### TimeInterval
#### timeString

```swift
public var timeString: String
```
Computed value that returns a string in HH:MM:SS format. Useful for displaying time in timers.
**Note**: HH will be without first 0 when hours less than 10

##### Example

```swift
let interval: TimeInterval = 7891
print(interval.timeString)
//2:11:31
```



### Date
#### yesterday

```swift
static public var yesterday: Date
```
Computed value that returns the Date object of the previous day of system date where time is noon.

##### Example

```swift
let date = Date()
print(date)
// 2020-08-19 14:33:16 +0000
let yesterday = Date.yesterday
print(yesterday)
// 2020-08-18 09:00:00 +0000
```
#### tomorrow

```swift
static public var tomorrow: Date
```
Computed value that returns the Date object of the next day of system date where time is noon.

##### Example

```swift
let date = Date()
print(date)
// 2020-08-19 14:33:16 +0000
let tomorrow = Date.tomorrow
print(tomorrow)
// 2020-08-20 09:00:00 +0000
```

#### dayBefore

```swift
public var dayBefore: Date
```
Computed value that returns the Date object of the previous day to applied Date where time is noon.

##### Example

```swift
var dateComponents = DateComponents()
dateComponents.year = 2020
dateComponents.month = 01
dateComponents.day = 10
dateComponents.timeZone = Calendar.current.timeZone
dateComponents.hour = 12
dateComponents.minute = 28

if let date = Calendar.current.date(from: dateComponents) {
    print(date)
    print(date.dayBefore)
}
// 2020-01-10 09:28:00 +0000
// 2020-01-09 09:00:00 +0000
```
#### dayAfter

```swift
public var dayAfter: Date
```
Computed value that returns the Date object of the next day to applied Date where time is noon.

##### Example

```swift
var dateComponents = DateComponents()
dateComponents.year = 2020
dateComponents.month = 01
dateComponents.day = 10
dateComponents.timeZone = Calendar.current.timeZone
dateComponents.hour = 12
dateComponents.minute = 28

if let date = Calendar.current.date(from: dateComponents) {
    print(date)
    print(date.dayAfter)
}
// 2020-01-10 09:28:00 +0000
// 2020-01-11 09:00:00 +0000
```

#### noon

```swift
public var noon: Date
```
Computed value that returns the Date object of applied Date where time is noon.

##### Example

```swift
var dateComponents = DateComponents()
dateComponents.year = 2020
dateComponents.month = 01
dateComponents.day = 10
dateComponents.timeZone = Calendar.current.timeZone
dateComponents.hour = 12
dateComponents.minute = 28

if let date = Calendar.current.date(from: dateComponents) {
    print(date)
    print(date.noon)
}
// 2020-01-10 09:28:00 +0000
// 2020-01-10 09:00:00 +0000
```

#### isLastDayOfMonth

```swift
public var isLastDayOfMonth: Bool
```
Computed value that returns `true` when applied Date is last day of month, `false` otherwise.

##### Example

```swift
var dateComponents = DateComponents()
dateComponents.year = 2020
dateComponents.month = 01
dateComponents.day = 31
dateComponents.timeZone = Calendar.current.timeZone
dateComponents.hour = 12
dateComponents.minute = 28

if let date = Calendar.current.date(from: dateComponents) {
    print(date)
    print(date.isLastDayOfMonth)
}
// 2020-01-31 09:28:00 +0000
// true
```



### CGPoint
#### init(center: CGPoint, radius: CGFloat, angle: CGFloat)

```swift
public init(center: CGPoint, radius: CGFloat, angle: CGFloat)
```
Initializer that accepts input parameters center, radius and angle. Useful for work with circles and circular UI elements.

##### Example

```swift
import UIKit

let center = CGPoint(x: 100, y: 100)
let radius: CGFloat = 50
let angle = CGFloat.pi

let pointOnCircle = CGPoint(center: center, radius: radius, angle: angle)
print(pointOnCircle)
// (50.0, 100.0)
```



### UIColor
#### rgba

```swift
public var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
```
Computed value that returns the tuple of color values in the RGB system.

##### Example

```swift
print(UIColor.systemPink.rgba)
// (red: 1.0, green: 0.17647058823529413, blue: 0.3333333333333333, alpha: 1.0)
```
#### getGradientColor

```swift
open func getGradientColor(at percent: CGFloat, with color: UIColor) -> UIColor
```
Function that returns UIColor for a linear gradient between two colors at specific points from 0 to 1.

##### Example

```swift
let black = UIColor.black
let red = UIColor.red
let halfGrColor = black.getGradientColor(at: 0.5, with: red)
print(halfGrColor.rgba)
// (red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0)
```
TODO: Describe all methods
TODO: Tests
