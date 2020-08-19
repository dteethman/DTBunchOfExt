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



TODO: Describe all methods
TODO: Tests
