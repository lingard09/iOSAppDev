import UIKit

func addInts(_ a: Int, _ b: Int) -> Int {
    a+b
}

func mulInts(_ a: Int, _ b: Int) -> Int {
    a*b
}

var mathFunc: (Int, Int) -> Int = addInts
print(mathFunc(2, 5))

mathFunc = mulInts
print(mathFunc(4, 5))

func printMathR(_ mathFunc:(Int, Int) -> Int, _ a: Int, _ b: Int) {
    print(mathFunc(a,b))
}

func chooseStep(backward: Bool) -> (Int) -> Int {
    func stepF(_ input: Int) -> Int {
        input + 1
    }

    func stepB(_ input: Int) -> Int {
        input - 1
    }
    
    return backward ? stepB : stepF
}

func nFunc(flag: Bool) -> () -> Int {
    func nfunc1() -> Int {
        return 100
    }
    func nfunc2() -> Int {
        return -100
    }
    if flag {
        return nfunc1
    } else {
        return nfunc2
    }
}

let getFunc = nFunc(flag: true)
print(getFunc)
print(getFunc())

// #selector(updateTimer)

// closures
// global funcs
// nested funcs
// closure expressions
// can remove return for a single-line body
// can infer the types of input and output
// can use shorthand argument names
// can use trailing closure syntax

func takeClosure(clo: (String, Int) -> String) {
    let s = "College"
    let n = 2
    print(clo(s, n))
}

takeClosure(clo: {(s: String, n: Int) -> String in
    var temp = ""
    for _ in 0..<n {
        temp += s
    }
    return temp
})

takeClosure(clo: {s, n in
    var temp = ""
    for _ in 0..<n {
        temp += s
    }
    return temp
})

takeClosure(){
    var temp = ""
    for _ in 0..<$1 {
        temp += $0
    }
    return temp
}

func takeArgs(s: String, n: Int, reverse: Bool, c:(String, Int) -> String) {
    var temp = ""
    if reverse {
        for c in s {
            temp = String(c) + temp
        }
        print(c(temp, n))
    } else {
        print(c(s, n))
    }
}
takeArgs(s: "abc", n: 2, reverse: true, c: {(s: String, n: Int) -> String in
    var temp = ""
    for _ in 0..<n {
        temp += s
    }
    return temp
})

func takeMultipleClosure (flag: Bool, c1:(String, Int) -> String, c2:() -> Void) {
    if flag {
        print(c1("xyz", 2))
    } else {
        print("noting")
    }
}

takeMultipleClosure(flag: true, c1: {(s: String, n: Int) -> String in
    var temp = ""
    for _ in 0..<n {
        temp += s
    }
    return temp}, c2: {print("noting")
    }
)

takeMultipleClosure(flag: true) {(s: String, n: Int) -> String in
    var temp = ""
    for _ in 0..<n {
        temp += s
    }
    return temp} c2: {print("noting")
    }

// sorted()
var a = [10, 20, 30]
//a.sort(by: (Int, Int) throws -> Bool)

func des(n: Int, m: Int) -> Bool {
    return m < n
}

var b = a.sorted(by: des(n:m:))
print(b)

b = a.sorted {
    $1 < $0
}

b = a.sorted(by: >) // <

// map
//a.map(transform: (Int) throws(Error) -> T)
func getEven(n: Int) -> Bool {
    n.isMultiple(of: 2)
}

var c = a.map(getEven(n:))
print(c)

c = a.map{
    $0.isMultiple(of: 2)
}

let s_arr = ["1", "2", "abc", "*"]
print(s_arr.compactMap{Int($0)})

// joined() - for strings
// reduce() - arrays

var temp = s_arr.joined
print(temp)

temp = s_arr.reduce("0"){$0+$1}
print(temp)

// exam'

