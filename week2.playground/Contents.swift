import UIKit

var greeting = "Hello, playground"

// protocol
// s[String.Index] ~= s[0]

var s = "   What is this?   "
var t = "   What is this? \n\n  "
// "   What \n is \n this? " -> 공백의 시퀀스 안에 \n이 위치해서 제대로 개행문자가 제거되지 않을 것
var u = s.trimmingCharacters(in: .whitespaces)
var o = t.trimmingCharacters(in: .whitespacesAndNewlines)
print("*", u, "*", separator: "")
print("*", o, "*", separator: "")
