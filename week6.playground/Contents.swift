import UIKit

enum Dice:Int, CaseIterable {
    case one = 1
    case two
    case three
    case four
    case five
}

for i in Dice.allCases {
    print(i, i.rawValue)
}

var temp = Dice.five
switch temp {
case .one, .two, .three, .four, .five: print(temp.rawValue) //can same task for everyone
}

enum Product {
    case book(String, Int)
    case song(String, String)
    case journal(String, String, Int)
}

var pro1 = Product.book("Swift 6.0", 2024)
var pro2 = Product.song("Your Song", "J. Smith")
var pro3: Product
pro3 = .journal("Learn programming", "CS-HD", 2025)

switch pro2 { //can replace 'pro3'
case .book:
    print("Book")
case .song(let song_title, var singer):
    singer = "*"+singer+"*"
    print("The Song, \(song_title) by \(singer)")
case let .journal(j_title, pub, year):
    print("The journal was published by \(pub)")
//default: //Default nerver exe
//    print("default")
@unknown default: print("for future use") // method to terminate error message
}

for num in 1...10 where num.isMultiple(of: 2) || num.isMultiple(of: 3) {
    print(num)
}

let t1 = ("Paul", 90)
switch t1 {
case ("Paul", let score) where score > 60:
    print("Paul scored \(score) on the test")
    fallthrough // next case can exe
case (_, 90...100):
    print("\(t1.0) received an A for the grade")
    // fallthrough // cannot use fallthrough here
case let (name, score) where score > 70:
    print("Student \(name) scored \(score) on the test")
default:
    print("default")
}
