import UIKit

var greeting = "Hello, playground"
var bye = "good bye"
print(greeting)

var n = 1

while(n > 0){
    if n > 10 {
        print(bye)
        break
    }else{
        print(greeting)
    }
    n += 1
}

// Error examples
// there should be same space in var name and value
// var i= 0
// var j =0

var myCollege: String? // ? means it's okay whether string or not
//myCollege = "Handong University"
// MUST EXPLICT VALUE BEFORE USE
//print(myCollege)

// Int
// String
// Character
// Float
// Bool
// [, ]
// Set[, , ]
// Dictionary [k1:v1, k2:v2, k3, v3]

var red, blue, yellow: Double // more than 1 var can be declare in 1 line

var temp = ""
var c1: Character
// c1 is character, so cannot be string which is empty
//c1 = ""
c1 = "a"

//temp = temp + c1
// cannot plus ohter types
temp = temp + String(c1)

var x = 3.14
var y: Int
y = Int(x) // remove under point
print(x, y, "pi \(x)") // by using back slash, can print more than 1 var

print(Int.max)
print(Int8.max) // 8-bit max value
//print(10.isMultiple(of: <#T##Int#>))

var bi = 0b1111
var under = 1_000 // = 1000

var d: Float = 0.0
var d1 = 1.0

var b = true // not Boolean, yes Bool
b.toggle() // swap value
print(x, d, d1, b, separator: " | ")
print(x, d, d1, b, separator: "*", terminator: "??")

var c: Character = "a"
var s = "a"
if String(c) == s { // compare content
    print("same")
} else {
    print("not same")
}

let t = 3
let m = -t
// | && ||
// < > <== >== == !=
// === !==
// (a ? b : c)
// +== -= *=, NOT ++ --

// OVERLOAD : multiple method in same name

// %
print(-9 % 4) // -1
print(-9 % -4) // -1 : because ignore minus

// Type conversion
var i = 1
var j = 0.5
var h = "hi"
//print(i + j)
print(i + Int(j))
//print(i + h)
print(String(i) + h)

let tt: UInt16 = 2_000
let o: UInt8 = 1
//var r = t + UInt8(t)
//r = t + UInt16(t)
//o = o + UInt8(t)

//Type Coercion
let dd: Double = 10 //literal
print(d)
var ii = 10
//let d1: Double = i + 1
var nn: Int = 10/3
//ERROR
//nn = 10/3.0

// Range
// closed range: a...b
// half-open: a..<b
// one-sided: ...a a... ..<a

//Random
var r1 = Int.random(in: 1...100) // 1 ~ 100
var r2 = Int.random(in: 1..<100) // 1 ~ 99
var r3 = Double.random(in: 0.0...0.9)
var r4 = Bool.random() // do not need range
var r5 = ...9
print(r5.contains(5)) // return True or False

//for-in loop
for i in 1...5 { // i is int because range is int
    print(i)
}

var a = [1, 2, 3, 4, 5]
for i in a {
    print(i)
}

for i in 0..<a.count {
    print(i, a[i], separator: " ")
}

s = "college"
var ttt:String = ""

for c in s {
//    print(c)
    ttt = ttt + String(c)
}

print(ttt)
ttt.append("a")
print(ttt)
print(ttt>s) // compare UNICODE

for _ in 1...3 { // instead of i, can use underbar
    print(Int.random(in: 1...100))
}

/// \n \t \\ \\"

// print multi-line
let s1 = """
    he is good "man"
        hi
    """
print(s1)

// String methods
// lowercased() uppercased()
// contains() takes character as well as string
// hasPrefix() hasSuffix() takes String only
print(s1.uppercased())
print(s1.contains("good"))
print(s1.hasPrefix("he "))
print(s1.hasPrefix("h"))
print(s1.hasSuffix("man"))

// String properties
// String.count
// String.isEmpty
print(s1.count)
print(s1.isEmpty)

let s2 = "hello world"
let s_array = Array(s2) // String to Array
print(type(of: s_array)) //Array<Character>
print(s_array.count)
print(type(of: s_array), s_array.count, s_array[0])

let a2 = [10, 20, 30]
var b2: [Int]
b2 = [1]
print(a2, b2)
b2[0] = 90
print(a2, b2)
b2 = a2
print(a2, b2)
b2.append(99)
print(a2, b2)

// Functions
// param or not, return or not
func testFunc() {
    print("hi")
}
testFunc( )

func testFunc2(name: String) -> () { // '->' is return arrow, void func dont need '->'
    print("hi \(name)")
}
testFunc2(name: "sherlock")

func innerSum(a: Int, b: Int) -> Int {
    var temp = 0
    for i in a...b{
        temp += i
    }
    return temp
}
innerSum(a: 10, b: 20)

func minMax(array: [Int]) -> (min: Int, max: Int) { //tuple
    return(0, 99)
}
print(minMax(array: [1, 2, 3, 4, 5]))
let b3 = minMax(array: [1, 2, 3, 4, 5])
print(b3.min)
print(b3.max)

// condition ? a : b
var n1 = 10
var n2 = 20
n1 > n2 ? print("n1 is bigger") : print("n2 is bigger")
let comment: () = n1 > n2 ? print("n1 is bigger") : print("n2 is bigger")
print(comment)

// String property, first & last
var s3 = "Hello"
var c5 = s3.first
var c6 = s3.last
print(c5!, c6!, type(of: c5))
// NIL forced unwrap("!")
let c7: Character = c6!

var n3 = 123
var s4 = String(n3)
var n4 = Int("123")
var n5 = Int("Hi")
print(type(of: s4), s4)
print(type(of: n4), n4!)
//print(type(of: n5), n5!) //"Hi" cannot be Int

//n5 == nil ? print("nil") : print("not nil")
//print(n5!)

// Reversed() on Range and String
// 1...3
for i in 1...3 {
    print(i*10)
}

var r = 1...3
for i in r.reversed() {
    print(i*10)
}

//String.reversed()
var s6 = "college"
var s7 = s6.reversed()
print(type(of: s7), s7) //ReversedCollection<String>

var s8 = String(s7)
print(s8)
print(String("college".reversed()))

/**
USUALLY API EXPLATIONS
 - parameters,
     - a: integer
     - b: integer

 - Returns: sum of a and b
 */

// line commit

/**
 multi-lines commit
 */
