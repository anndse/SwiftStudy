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


//for study Classes and structures
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//use it as:
let someResolution = Resolution()
let someVideoMode = VideoMode()
println("The width of resolution is \(someResolution.width)")
println("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
println("The width of someVideoMode is now \(someVideoMode.resolution.width)")

//To init its
//“Structures and Enumerations Are Value Types”
let vga = Resolution(width: 640, height: 480)
println("vga: \(vga.width) * \(vga.height)")
let hd  = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
println("width of hd is \(hd.width), and width of cinema is \(cinema.width)")


//Classes are Reference Types
let teneighty = VideoMode()
teneighty.resolution = hd
teneighty.interlaced = true
teneighty.name = "1080i"
teneighty.frameRate = 25.0

let alsoTeneighty = teneighty
alsoTeneighty.frameRate = 30.0
println("frame of tenEighty is \(teneighty.frameRate), frame of alsoTeneighty is \(alsoTeneighty.frameRate)")

//Identity operator === and !==
//identical to(===), Not identical to(!==)
if(teneighty === alsoTeneighty){
    println("teneighty and alsoTeneighty refer to the same VideoMode instance")
}

//Stored Properties
struct FixedLengthRange {
    var firstValue: Int
    let length:Int
}
var rangeOfThreeItems =  FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
//cannot assign to length, it's const
//rangeOfThreeItems.length = 4

//Computed Properties
struct Point{
    var x = 0.0, y = 0.0
}
struct Size {
    var width =  0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point{
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        //set (newCenter) { //also can write as this:
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
    
    func area()->Double{
        return size.height * size.width
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
println("The center of square is (\(square.center.x), \(square.center.y))")
println("And the area of square is \(square.area())")
square.center = Point(x: 20.0, y: 20.0)
println("square.origin is (\(square.origin.x), \(square.origin.y))")

//Property Observers
//willSet and didSet
class StepCounter{
    var totalsetps: Int = 0 {
        willSet {
            println("About to set totalsteps to \(newValue)")
        }
        didSet {
            if totalsetps > oldValue {
                println("Add \(totalsetps - oldValue) steps")
            }
        }
    }
}
//test it
let stepCounter = StepCounter()
stepCounter.totalsetps = 100
stepCounter.totalsetps =  50


//modifying value types from  within instance methods
//keyword mutating
//eg:
struct NewPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(dx:Double, dy:Double){
        self = NewPoint(x: x+dx, y: y+dy)
    }
}
var newpoint = NewPoint(x: 5.0, y: 1.0)
newpoint.moveBy(1.0, dy: 5.0)
println("After call moveBy: (\(newpoint.x), \(newpoint.y))")


//Subscript Options
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsValid(row: Int, column: Int)->Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsValid(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
//test it
var matrix = Matrix(rows: 5, columns: 5)
matrix[2,3] = 50
println(matrix[2,3])


