# DT Bunch of Extensions

This is my package with useful extensions to standard Swift classes and some tricky things.
Here I collect things that I use in my projects and which for some reason are not in the standard implementation. Feel free to use it as well as add your own methods. I am a novice developer, so some things can be done not very cleverly, so I will be glad to receive any feedback, comments, fixes and improvements.


## Int
### getNoun

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
let dualEnd = "а"
let multipleEnd = "ков"

print("\(one) \(one.getNoun(root, singleEnd: singleEnd, dualEnd: dualEnd, multipleEnd: multipleEnd) )")
print("\(two) \(two.getNoun(root, singleEnd: singleEnd, dualEnd: dualEnd, multipleEnd: multipleEnd) )")
print("\(five) \(five.getNoun(root, singleEnd: singleEnd, dualEnd: dualEnd, multipleEnd: multipleEnd) )")
print("\(twelve) \(twelve.getNoun(root, singleEnd: singleEnd, dualEnd: dualEnd, multipleEnd: multipleEnd) )")

// 1 котик
// 2 котиа
// 5 котиков
// 12 котиков
```


TODO: Describe all methods
TODO: Tests
