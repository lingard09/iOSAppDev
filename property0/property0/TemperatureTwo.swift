//
//  TemperatureTwo.swift
//  property0
//
//  Created by kinnwonjin on 11/14/25.
//

import foundation

struct TemperatureTwo {
    static let maxTempFah: Double = 120.0
    static let minTempFah: Double = -25.0

    private var fah: Double {
        willSet {
            print("Getting a new Fah temp..", newValue)
        }
        didSet {
            print("Previous temp in Fah: ", oldValue)
            print("Current temp in Fah", fah)
            let diff = abs(fah - oldValue)
            if diff > 30 {
                print("diff is larger than 30: ", diff)
            }
            
            if fah > TemperatureTwo.maxTempFah {
                print("set temp to max")
                fah = TemperatureTwo.maxTempFah = fah
            }
        }
    }
    private var cel: Double {
        get {
            print("getter")
            return (fah-32.0) * (5.0/9)
        }
//        set (newCel){
//            fah = (newCel * 9.0/5) + 32.0
//        }
        set {
            print("setter")
            fah = (newValue * 9.0/5) + 32.0
        }
    }
    init(fTemp: Double, cTemp: Double) {
        fah = fTemp
        cel = cTemp
    }
    func getFahTemp() -> Double {
        return fah
    }
    func getCelTemp() -> Double {
        return cel
    }
    mutating func setFahTemp(temp: Double) {
        self.fah = temp
    }
    mutating func setCelTemp(temp: Double) {
        self.cel = temp
    }
    mutating func getNewTempByCel(temp: Double) {
        self = s
    }
}

//Step 1: Add two inits - one for Fah, one for Fah and Cel
//StepTwo: Update struct for accessors and mutators
//Step 3: Create instance of temp and test func. Figure out when accessors and setter called
