import UIKit

//struct Class1: Equatable{
//    var prop1: Int
//    let prop2: String
//}
//
//var cl1 = Class1(prop1: 10, prop2: "hello")
//var cl2 = cl1
//cl1.prop1 = 99
//print(cl1, cl2)
//
//cl2.prop1 = 99
//print(cl1,cl2)
//
//print(cl1 == cl2)

class Class1{
    var prop1: Int = 0
    let prop2: String = "hi"
}

var c1 = Class1()
c1.prop1 = 99
print(c1)


var c2 = c1
print(c1 === c2)


c2.prop1 = 10
print(c1 === c2)
