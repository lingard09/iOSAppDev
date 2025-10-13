import UIKit

// repeat-while
var random: Int
repeat {
    random = Int.random(in: 0...10)
    print("inside repeat: \(random)")
} while random > 6
print(random)

var s1 = "Hi"
var s2: String?
s2 = s1

// guard-else
// return   break   continue    throw

func func1(_ n: Int) {
    guard n>5 else {
        print("n is less than or equal to 5")
        return
    }
    if n.isMultiple(of: 2) {
        print("even")
    } else {
        print("odd")
    }
}

let num1 = Int.random(in: 1...10)
func1(num1)

func func2(_ n: Int?) {
    guard let num = n else {
        print("the input is nil")
        return
    }
    if num.isMultiple(of: 2) {
        print("even")
    } else {
        print("odd")
    }
}

// switch
// use, for multiple values
var s: String = "hi"
switch s {
case "Hi":
    print("hi")
case "Hello":
    print("")
default:
    print("default")
}

var c: Character = "C"
switch c {
case "c", "C":
    print("C/c")
default:
    print()
}

var no = 18
switch no {
case 1...10:
    print("1...10")
case 10...20:
    print("10...20")
default:
    print()
}
