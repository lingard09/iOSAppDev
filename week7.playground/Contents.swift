import UIKit

// dic [key:val] - unordered
var d0: Dictionary<Int, String> = [:]
var d1: [Int:String]
d1 = [:]
var d2:[Int:String] = [:]
var d3 = [Int:String]()
// .isEmpty -> true or false
// .count

d1 = [1:"home", 2:"school", 3:"church"]
d1.count // 3
d1[3] // church
d1[1] = "house"
d1[4] = "handong"

// updateValue()
var temp = d1.updateValue("home", forKey: 1)
d1
temp // temp is optional

var temp1 = d1.updateValue("lolol", forKey: 99)
d1
temp1 // temp1 is nil

// nil for the key
// removeValue()
// removeAll()  [:]
d1[99] = nil
print(d1)

d1[99] = nil
print(d1)

temp = d1.removeValue(forKey: 4)
d1
temp

d2 = d1
print(d2 == d1)
d2 = [:]

for e in d1 { // e is tuple
    print(e.0, e.1)
    print(e.key, e.value) // key == 0, 1 == value
}

for e in d1.enumerated() {
    print(e.0, e.1) // e.offset e.element
}

// getting array from a dic
var myKeys = d1.keys
var myValues = d1.values
print(type(of:myKeys), myKeys)
var keyArray:[Int] = [Int](myKeys)
print(type(of: keyArray), keyArray)

// Sets
// Set<ElementType>
// must declare type of sets

var s0:Set<Character>
s0 = []
var temp2 = s0.insert("A")
temp2 // return -> tuple(inserted: true, memberAfterInsert: "A")

var s1 = Set<Character>()
temp2 = s1.insert("A")
print(s0 == s1)

var s2:Set<Character> = ["A", "B", "C"]
s0 = []

var s3 = ["A", "B"]
var s4:Set = ["A", "B"]
var s5:Set<Character> = ["A", "B"]
var s6 = Set(["A", "B"])
var s7:Set<Character> = Set(["A", "B"])
// .count   .isEmpty
// removeAll() []
// remove()

var op_temp = s2.remove("X")
if let c = op_temp {
    print(c)
}

// contains() returns true/false
print(s2)
s2.insert("D")
s2.insert("X")
s2.insert("A")
print(s2)

for e in s2 {
    print(e) // e is character
}

for e in s2.enumerated() {
    print(e)
}

var sorted_s2 = s2.sorted()
print(sorted_s2, type(of: sorted_s2))

var temp3 = Array(s2)

// union    formUnion
// subtracting formSubtract
// intersection formIntersection
// symmetricDifference formSymmetricDifference
// form~ makes no copy, just update
print(s2)
s5 = ["B", "D", "X"]
s7 = s2.symmetricDifference(s5)
print(s7)
s2.formSymmetricDifference(s5)
print(s2)
print(s2 == s7)

// isSubset()
// isSuperset()
// isStricSubset()  isStricSuperset()
// isDisjoint()
