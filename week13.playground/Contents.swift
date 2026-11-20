import UIKit

class Dog {
    var name: String
    
    init(n: String) {
        name = n
    }
    
    convenience init() {
        self.init(n: "No name")
        name = "Not-named"
    }
    
    
}

var d1 = Dog()
print(d1.name)

class BigDog: Dog {
    var weight: Double
    
    init(n: String, w: Double) {
        weight = w
        super.init(n: n)
//        self.name = "Big"
    }
    
    override init(n: String) {
        weight = 99
        super.init(n: n)
    }
    
    convenience init(w: Double) {
//        self.init(n: "Big", w: w)
        self.init()

    }
}

var d2 = BigDog(n: "small", w: 24.0)
print(d2.weight, d2.name)

d2 = BigDog(w: 50.2)
print(d2.weight, d2.name)

var d3 = BigDog(n: "nabi", w: 25.5)
print(d3.weight, d3.name)

var d4 = BigDog()
print(d4.weight, d4.name)

class NoisyDog: Dog {
    var license: Int = 0
}

var d5 = NoisyDog()
print(d5.license, d5.name)

d5 = NoisyDog(n: "noisy")
print(d5.license, d5.name)

