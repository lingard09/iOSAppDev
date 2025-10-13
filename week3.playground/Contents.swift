import UIKit

// replaceSubrange()
// removeSubrange()
var s = "abcdefg"
var ix1 = s.startIndex

// index range
let r = s.index(ix1, offsetBy: 2)...s.index(ix1, offsetBy: 4)
print(s[r])

s.replaceSubrange(r, with: "x")
print(s)

s.replaceSubrange(r, with: "x") // xfg -> x
print(s)

//s.replaceSubrange(r, with: "x") // ERROR - out of bound
//print(s)

// Formatting
print(String(format: "%5.2f"+"!", 3.14)) // whole length is 5
print(String(format: "%-5.2f"+"!", 3.14)) // space insert before '!'
print(String(format: "%2.2f"+"!", 3.14)) // no problem
print(String(format: "%.2f"+"!", 3.142))
print(String(format: "%.2f"+"!", 3.146)) // round

// formatted() - iOS 15+; Swift 5.5+
var d = 12345.6789
print(d.formatted()+"!")
print(d.formatted(.number)+"!") // same
print(d.formatted(.percent)+"!") // same
print(d.formatted(.number.precision(.fractionLength(2)))+"!") // round
print(d.formatted(.number.precision(.fractionLength(5)))+"!")
print(d.formatted(.number.precision(.fractionLength(2)).grouping(.never))+"!")

print(d.formatted(.currency(code: "USD")))
print(d.formatted(.currency(code: "KRW")))
print(d.formatted(.currency(code: "EUR")))

// Extensions
extension Double {
    func format(p: String) -> String {
        return String(format: "%\(p)f", self) // self ~= this (use for itself)
    }
}

var d1 = 123.678987
var temp = d1.format(p: "10.4")
print("*"+temp)

// Task #1: Convert the returned string into corresponding Double value, and print it
//print(Double(format: "%.1f"+"!", 12.34))

// Task #2: Write a String extension that returns the chracter at a given index in Int
    // func charAt(i: Int) -> Character
extension String {
    func charAt(_ i: Int) -> Character {
        let ixs = self.startIndex
        let ix = self.index(ixs, offsetBy: i)
        return self[ix]
    }

    subscript (i: Int) -> Character {
        let ixs = self.startIndex
        let ix = self.index(ixs, offsetBy: i)
        return self[ix]
    }
}

var s1 = "abcdefg"
// print(s.charAt(i: 2))
print(s1.charAt(2)) // _ i can do this
print(s1[4]) // damn, it is revolution

// Tuples
var t:(Int, String)
t = (1, "two")

var s2 = (1, "two")
print(t == s2) // same

var u: (id: Int, name: String) = (1, "two")

let (ix, str) = t // can extract elements
print(ix, str)

print(t.0, t.1)
print(u.id, u.name)

t.0 = 10
u.name = "ten"
print(t, u)

// enumerated() works for String and Array
let str1 = "college"
for (i, c) in str1.enumerated() {
    print(i, c) // i: index, c: element
}

for e in str1.enumerated() {
    print(e, e.offset, e.element)
}

// in func definitions
// -> (Int, String)
// -> (id: Int, name: String)

// Arrays
// Array<Element>

// var a = [10, 20]
// var a: [Int] = []
// a.append(90)

var a: [Int]
a = [] // var a:[Int] = []

var b = [Int]()
print(a == b) // because both is empty

var a1: Array<Int> = []
var b1 = Array<Int>()
print(a1 == b1)

var cx: [Int] = Array<Int>()
var dx: [Int] = [Int]()

var a5 = [Int](repeating: 0, count: 10)
var a6 = Array<Int>(repeating: 9, count: 5)
var a7 = Array(repeating: 0, count: 8) // count=0 means empty array

a5 = Array(1...10)
var a8 = Array("college")

var a9:[[Int]] = [[Int]]() // 2D array
a9 = Array(repeating: Array(repeating: 9, count: 3), count: 5)
print(a9)
a9[1][0] = 90
print(a9)
print(a9[1])

// Task #1 Write a func that takes a 2D array of Int and prints it in a retanular table format
func printArray(a: [[Int]]) {
    for i in 0..<a.count {
        for j in 0..<a[i].count{
//            ..
        }
    }
}

func printArray2(a: [[Int]]) {
    for e in a {
        print(e)
    }
}

// Ragged Arrays
a9[1] = [99]
a9[4] = [0, 0, 0, 0]
print(a9)

for e in a9.enumerated() {
    print(e.offset, e.element)
}

// isEmpty
// first last return Optional
let subA1 = a9.first
if let i = subA1 {
    print(i)
}

a1 = [1, 2]
var a2 = [10, 20]
var a3 = a1 + a2
a3 += [99]
a3.append(0)
a3.append(contentsOf: [1, 2, 3])

// insert(at:)
// remove(at:)
// removeFirst() removeLast() removeAll()
// TRY THIS!!!!!!!


// updating array with a range
var a4 = [10, 20, 30, 40, 50]
a4[1...3] = [99]
print(a4)

a4[1...1] = [9, 9, 9]
print(a4)
//a4[0] = [7] -> ERROR(it will be work on 2D array)
//a4[3..<5] = 77 -> ERROR(when updating range, we should use array]
a4[3..<5] = [77]

// Basic DTs: Bool, Int, Float, Double, String, Character
// Range, String.Index, Tuple, Optional<T>
// Collection DTs: Array<>, Set<>, Dictionary<>
// User-defined DTs: Structure, Enumeration, Class, Protocol

enum Planets { //starts with uppercase
    case mercury //starts with lowercase
    case venus
    case earth
}

var ourPlanet: Planets // enum type
ourPlanet = .earth // can use without init

var yourPlanet = Planets.earth
print(ourPlanet == yourPlanet)

// Raw values - string, char, or int or double
// .rawValue

enum Devices:Int {
    case one = 1
    case two = 2
    case three = 3
}
print(Devices.two.rawValue)

enum DevicesAuto:Int {
    case one = 1
    case two
    case three
}
print(DevicesAuto.two.rawValue)
var tmp = DevicesAuto(rawValue: 3)
if let e = tmp {
    print(e)
}
tmp!.rawValue

var tmp1 = DevicesAuto(rawValue: 2)
if let e = tmp1 {
    print(e)
}

enum DevicesStr: String {
    case one, two, three
}
var tmp2 = DevicesStr(rawValue: "three")

enum DoubleEnum: String {
    case first = "a"
    case second
    case third

}
print(DoubleEnum.second.rawValue)
var tmp3 = DevicesStr(rawValue: "b")
if let e = tmp3 {
    print(e)
}

enum Test: Double {
    case one = 1.0
    case two = 2.0
    case three = 3.0
}

// associated values

enum Product {
    case book(String, Int) // looks like tuple, but not
    case song(String, String)
}

var myProduct = Product.book("Swift 6.0", 2024)
var yourProduct = Product.song("Your song", "John Smith")

myProduct = .book("Swift 5.0", 2019)

// CaseIterable - protocol
enum DevicesIter: CaseIterable {
    case zero
    case one
    case two
    case three
}
print(DevicesIter.allCases.count)

for e in DevicesIter.allCases {
    print(e, type(of: e))
}
