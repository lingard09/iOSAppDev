import UIKit

func func1(_ a: Int) -> Int {
    return a*100
}
print(func1(9))
_ = func1(9)

// default values for param
func func2(s1: String, s2:String = "John") {
    print(s1, s2)
}
func2(s1: "Mark", s2: "Peter")

// external param names
func func3(yourName s: String, yourGPA d: Double) {
    print(s, d)
}

// variadic param ...
func func4(g: String, n: String...) {
    print(type(of: n), n)
    for i in n { // n becomes string array
        print(i)
    }
}
func4(g: "Hi", n: "John", "Mark", "Peter")

// inout param(diff with java, swift cannot update parameter and variable)
func func5(s1: inout String, s2: inout String) {
    let temp = s2
    s2 = s1
    s1 = temp
}

var firstStr = "Hi"
var secondStr = "Hello"

// inout make possible to use variable outside of scope
func5(s1: &firstStr, s2: &secondStr)
print(firstStr, secondStr)

// implicit return
func oneLine(_ name: String) -> String {
    "Hi" + name // if there is no return and only one line, return that
}

// returning nil
func func6(n: Int) -> String? {
    switch n {
    case 0: return ""
    case 1...: return "positive"
    default: return nil
    }
}

// write code to call func6 and print the return value inside a func
for i in 0...10 {
    func6(n: i)
}

func func7(n: Int) -> (s: String, y: Int?)? {
    switch n {
    case 0: return ("zero", nil)
    case 1...: return ("positive", 2025)
    default: return nil
    }
}

// write code to print the contents of the tuple returned by func7
// when n < 10, it should print "nil has been returned"
for i in 0...20 {
    func7(n: i)
    if(i < 10) {
        print("nil has been returned")
    }
}
