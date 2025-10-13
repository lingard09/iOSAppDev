//
//  main.swift
//  property
//
//  Created by kinnwonjin on 11/14/25.
//

import foundation

var temp1 = Temperature(fah: -20)
print("Cel: ", temp1.getCelTemp(), "\tFah: ", temp1.getFahTemp())

temp1.setFahTemp(temp: 32)
print("Cel: ", temp1.getCelTemp(), "\tFah: ", temp1.getFahTemp())

var temp2 = Temperature(fTemp: 32, cTemp: 32)
print("Cel: ", temp2.getCelTemp(), "\tFah: ", temp1.getFahTemp())
print("===")
temp2.setCelTemp(temp: 0)
print("Cel: ", temp2.getCelTemp(), "\tFah: ", temp1.getFahTemp())

var temp3 = TemperatureTwo(temp: 95.0)
print("Cel: ", temp3.getCelTemp(), "\tFah: ", temp3.getFahTemp())
print("===")

temp3.setCelTemp(temp: 125.0)
print("Cel: ", temp3.getCelTemp(), "\tFah: ", temp3.getFahTemp())
print("===")

temp3.setFahTemp(temp: -30)
print("TempTwo min temp: ", TemperatureTwo.minTempFah)
print("===")

temp3.getNewTempByCel(temp: 50.0)
print("Cel: ", temp3.getCelTemp(), "\tFah: ", temp3.getFahTemp())
print("TempTwo min temp: ", TemperatureTwo.minTempFah)
print("===")
