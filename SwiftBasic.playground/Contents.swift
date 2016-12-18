////: Playground - noun: a place where people can play
//
//import UIKit
//import Foundation
//
//let numbers: [Int] = [9, 29, 19, 79]
//
////Imprerative example
//var tripledNumbers: [Int] = []
//for number in numbers {
//    tripledNumbers.append(number * 3)
//}
//print(tripledNumbers)
//
////Declarative example
//let tripledIntNumbers = numbers.map({ (number) in 3 * number })
//print(tripledNumbers)
//
//let oneToFour = [1,2,3,4]
//let firstNumber = oneToFour.lazy.map({$0 * 4}).first
//print(firstNumber!)
//
////Optional value either contains a value or contains nil
//var optionalStrings: String? = "A String literal"
////optionalStrings = nil
//print(optionalStrings!) //if optionalStrings is nil. The code have a error
//
//let nilName: String? = nil
//if let familyName = nilName {
//    let greetingFamilyName = "Hello, Mr. \(familyName)"
//} else {
//    print("optional does not have value")
//}
//
//print(nilName ?? "")
//
////String
//let anEmptyString = ""
//if anEmptyString.isEmpty {
//    print("This is a empty string")
//}
//
//let string1 = "Hello"
//let string2 = " Mr"
//var welcome = string1 + string2
//
//var instruction = "Follow us please"
//instruction += string2
//
//let exclamationMark: Character = "!"
//welcome.append(exclamationMark)
//
////Arrays and Dictionaries
//var cheeses = ["Brie", "Tete de Moine", "Cambozola", "Camembert"]
//cheeses[2] = "Requefort"
//var cheeseWinePairs = [
//    "Brie": "Chardonnay",
//    "Camembert": "Champagne",
//    "Gruyere": "Sauvignon Blanc"
//]
//
//cheeseWinePairs["Cheddar"] = "Cabarnet Sauvignon"
////To create an empty array or dictionary
//let emptyArray = [String]()
//let emptyDictionary = Dictionary<String, Float>()
////cheeses = []
////cheeseWinePairs = [:]
//
////Control Flow
////for loops
//let scores = [65, 75, 92, 87, 68]
//var teamScore = 0
//
//for score in scores {
//    if score > 70 {
//        teamScore = teamScore + 3
//    } else {
//        teamScore = teamScore + 1
//    }
//}
//
//for (cheese, wine) in cheeseWinePairs {
//    print("\(cheese) : \(wine)")
//}
//
//var count = 0
//for i in 0 ..< 3 {
//    count += i
//}
//
//print(count)
//
//var n = 2
//while n < 100 {
//    n = n * 2
//}
//
//var m = 2
//repeat {
//    m = m * 2
//} while m < 100
//
//let fourToTwo = Array(stride(from: 4, to: 1, by: -1))
//let fourToOne = Array(stride(from: 4, through: 1, by: -1))
//
//func greet(name: String, day: String) -> (String, String) {
//    return (name, day)
//}
//
//greet(name: "Hello Thuan", day: "Today is Sunday")
//
//// Variable number of arguments in functions - Variadic Parameters
//func sumOf(numbers:Int...) -> (Int, Int) {
//    var sum = 0
//    var counter = 0
//    for number in numbers {
//        sum += number
//        counter += 1
//    }
//    return (sum, counter)
//}
//
//sumOf()
//sumOf(numbers: 7, 9, 45)
//
//func swapTwoInts(a: inout Int, b: inout Int) {
//    let temporayA = a
//    a = b
//    b = temporayA
//}
//
//func makeIncrementer() -> ((Int) -> Int) {
//    func addOne(number: Int) -> Int {
//        return 1 + number
//    }
//    return addOne
//}
//
//var increment = makeIncrementer()
//increment(9)

/*1. map()*/
//way 1: use normal programming
let numbers = [10, 20, 91, 50, 100, 39, 74]
var formattedNumbers: [String] = []
for number in numbers {
    let formattedNumber = "\(number)$"
    formattedNumbers.append(formattedNumber)
}
print(formattedNumbers)

//way 2: use functional programming
let mappedNumbers = numbers.map {"\($0)$"}
print(mappedNumbers)

/*2. Filter()*/
let someEventNumbers = numbers.filter { $0 % 2 == 0 }
print(someEventNumbers)

/*3. Reduce()*/
let total = numbers.reduce(0) { $0 + $1 }
print(total)