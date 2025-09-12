import UIKit

var greeting = "Hello, playground"

// protocol
// s[String.Index] ~= s[0]

var s = "   What is this?   "
var t = "   What is this? \n\n  "
// "   What \n is \n this? " : 공백의 시퀀스 안에 \n이 위치해서 제대로 개행문자가 제거되지 않을 것
var u = s.trimmingCharacters(in: .whitespaces)
var o = t.trimmingCharacters(in: .whitespacesAndNewlines)
print("*", u, "*", separator: "")
print("*", o, "*", separator: "")

// String.Index
// #1. startIndex endIndex return String.Index
    // ex. s="hi"; s[s.startIndex] return "h"; s[s.endIndex] return error(endIndex는 마지막 글자 다음껄 반환하기 때문에 out of bound 에러 발생)
// #2. index() return String.Index
    // index(_:offsetBy) - _:String.Index, offsetBy:Int
        // ex. offset=-1 means last one
    // index(after:)
    // index(before:)
// #3. s[String.Index] return Character

var str = "halo"
var i1 = str.startIndex
var i2 = str.endIndex
print(type(of: i1), i1, i2, separator:" | ")
// print(str[i1], str[i2]) -> out of bound
// print(str[i1], str[i2-1]) -> type miss matching

var c = str.index(before: i2)
print(str[c])
c = str.index(i2, offsetBy: -1)
print(str[c])

var s1 = ""
print(s1.startIndex, s1.endIndex)
print(s1.index(s1.startIndex, offsetBy: 0)) // 문자열이 비어있어도 정상작동을 한다

let x:Character = "x"
// str[c] = x -> ERROR(we can use str[?] only get-only)


// insert(contentsOf:at:) - contentsOf:String
// remove(at) - at:Index
var s2 = "college"
var ixe = s2.endIndex
var ix1 = s2.index(before: ixe)
s2.insert(contentsOf: "EOL", at: ixe) // append
print(s2, s2.count, s2[ixe], s2[ix1], separator: " | ")

// String.Index after updating string

var ixe2 = s2.index(after: ixe)
print(s2[ixe2]) // endIndex의 after이므로 college에서 2글자 뒤인 O 출력
var c1 = s2.remove(at: ixe2)
print(s2, s2.count, c1, separator: " | ")
c1 = s2.remove(at: ixe2)
print(s2, s2.count, c1, separator: " | ")

// firstIndex(of:) lastIndex(of:)
let s3 = "college"
let ix3 = s3.firstIndex(of: "l")
let ix4 = s3.lastIndex(of: "x")
let ix5 = s3.lastIndex(of: "l")
//print(ix3!, ix4!, ix5!, separator:" | ")

print(s3[ix3!])
//print(s3[ix4!]) -> cannot unwrap nil value
print(s3[ix5!])

// Optional binding
// if-let
// guard-let
// switch

let str1 = "College"
let ix6 = str1.firstIndex(of: "c")
let ix7 = str1.lastIndex(of: "C")
print(type(of: ix6), type(of: ix7))

ix6 == nil ? print("nil") : print("not nil")

if ix7 != nil {
    print(str1[ix7!])
}

if let i1 = ix6 { // ix6는 nil이므로 이 조건문 건너뜀
    print(str[i1])
}

var n1: Int?
var n2: Int? = 10
if var temp = n2 {
    print("not nil")
    temp += 9
    print(temp)
} else {
    print("nil")
}

//
// Substring type
//
var s4 = "abcdef"
var subS = "bcd"
var ixs = subS.startIndex
var ixe3 = subS.endIndex
subS[ixs]
// subS[ixe3] -> Error (not defined)
s4[ixe3] // ixe3 = 4니까 s4의 4번째 글자인 d 반환

// dropFirst() dropLast()
// prefix(Int) suffix(Int)
var s5 = "college"
var s6 = s5.dropFirst()
let ixs1 = s5.startIndex

var s7 = ""
print(type(of: s6), s6, separator: " | ")

let sub0 = s5.prefix(0)
let sub1 = s5.prefix(10) // not Error

let s8 = s5.prefix(3)
var ix8 = s8.startIndex
var ix9 = s8.endIndex
print(s8, s5[ix8], s5[ix9], separator: " | ") // s5[ix9]의 'l'은 'college'의 두번째 'l'
// print(s8[ix9]) Error(out of bound)

//
// String's Index range in [ ] -> Substring
//
var s0 = ""
let s9 = "abcdefg"
let ix10 = s9.startIndex
let ix11 = s9.endIndex
let ix12 = s9.index(ix10, offsetBy: 2) // c

let s10 = s9[s9.index(after: ix10)...ix12] // bc
let s11 = s9[ix10..<ix12] //ab
let s12 = s9[..<ix12] //ab
let s13 = s9[ix12...] //cdefg

// String methods taking ranges
// replaceSubrange(_:with:)
// removeSubrange()

