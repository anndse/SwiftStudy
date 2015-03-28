//
//  main.swift
//  InitTest
//
//  Created by 王惠 on 15/3/28.
//  Copyright (c) 2015年 王惠. All rights reserved.
//

import Foundation

println("Hello, World!")

struct Fahrenheit {
    var temperature: Double
    
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
    
println("The default temperature is \(f.temperature)° fahrenheit")

//Type alias just same as typedef in the C language
typealias F = Fahrenheit
typealias Count = Int64

//for example to use it
var af = F()
println("The max of Count is \(Count.max) and the min of Count is \(Count.min)")


//closed range operator (a...b)
//how to use it, for example, with a for-in loop
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}

//halt-open range operator (a..<b)
let names = ["simon", "andy", "Alex", "Jack"]
for index in 0..<names.count {
    println("Person \(index+1) is called \(names[index])")
}

//switch of swift
// Range matching
let count = 3_00
let countedThings = "stars in the Milky Way"
var naturalCount: String
switch count {
case 0:
    naturalCount="0"
case 1...3:
    naturalCount="a few"
case 4...9:
    naturalCount="several"
case 10...99:
    naturalCount="tens of"
case 100...999:
    naturalCount="hundreds of"
case 1000...999_999:
    naturalCount="thousands of"
default:
    naturalCount="millions of millions of"
}
println("There are \(naturalCount) \(countedThings)")

//use tuples for switch
let somePoint=(9,-1)
switch somePoint {
case (0, 0):
    println("(0,0) is at the origin")
case (_, 0):
    println("\(somePoint) is on the x-axis")
case (0, _):
    println("\(somePoint) is on the  y-axis")
case (-2...2, -2...2):
    println("\(somePoint) is inside the box")
default:
    println("\(somePoint) is outside the box")
}

//use Value Bindings for switch
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    println("on the x-axis with an x value of \(x)")
case (0, let y):
    println("on the y-axis with a y value of \(y)")
case let (x, y):
    println("somewhere else at \(anotherPoint)")
}

//where case
let yetAnotherPoint=(1, 0)
switch yetAnotherPoint {
case let (x, y) where x == y :
    println("\(yetAnotherPoint) is on the line x == y")
case let (x, y) where x == -y:
    println("\(yetAnotherPoint) is on the line x == -y")
case let (x, y):
    println("\(yetAnotherPoint) is just some arbitrary point")
}

//use Funcations
func sayHello(personName:String)->String{
    return "Hello, \(personName)!"
}

println(sayHello("simon"))

//multiple return values
func findMinMax(a:[Int])->(min:Int, max:Int){
    var curMin = a[0]
    var curmax = a[0]
    
    for value in a[1..<a.count] {
        if(curmax < value){
            curmax = value
        }
        
        if(curMin > value){
            curMin = value
        }
    }
    
    return (curMin, curmax)
}
//test it
let a=[4,5,2,6,6,33,96,3,75]
println("The max value of array is \(findMinMax(a).max)")

//Enumerations
//case one
enum CompassPoint{
    case North
    case South
    case East
    case West
}

//case two
enum Planet{
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Nepture
}

var directionToHead = CompassPoint.East
//or
directionToHead = .East
println(directionToHead)

//“define Swift enumerations to store associated values”
//摘录来自: Apple Inc. “The Swift Programming Language”。 iBooks. https://itun.es/cn/jEUH0.l
enum Barcode{
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
func DisplayProuctBarcode(code:Barcode){
    switch code {
    case let .UPCA(numberSystem, manufacturer, product, check):
        println("UPC-A:\(numberSystem) \(manufacturer) \(product) \(check)")
    case let .QRCode(code):
        println("QRCode:\(code)")
    }
}

DisplayProuctBarcode(productBarcode)
productBarcode = Barcode.QRCode("ABCDEFGHIJKLMNOPQ")
DisplayProuctBarcode(productBarcode)

//Raw values for enum
enum ASCIIControlCharacter : Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum PlanetInt:Int{
    case Mercury=1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Nepture
}
print(PlanetInt.Earth.rawValue)
print(ASCIIControlCharacter.CarriageReturn.rawValue)


