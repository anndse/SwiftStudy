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


