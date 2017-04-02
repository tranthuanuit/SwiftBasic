//: Playground - noun: a place where people can play

import UIKit
import Foundation


//ARC: Automatic Reference Counting -> ki thuat quyet dinh xem vung nho nao se dc ton tai va lay di.
//Memory leak -> vung nho khong duoc giai phong sau khi huy bien.
class User {
    var name: String
    
    private(set) var phones: [Phone] = []
    
    func add(phone: Phone) {
        phones.append(phone)
        phone.owner = self
    }
    
    init(name: String) {
        self.name = name
        print("User \(name) is initialized")
    }
    
    deinit {
        print("User \(name) is being deallocated")
    }
}

class Phone {
    let model: String
    weak var owner: User? //them tu khoa weak de khi huy bien owner thi object cua User se tu dong nil
    
    init(model: String) {
        self.model = model
        print("Phone \(model) is initialized")
    }
    
    deinit {
        print("Phone \(model) is being dealocated")
    }
}

do {
    let user1 = User(name: "Thuan")
    let phone1 = Phone(model: "iPhone 6S Plus")
    
    user1.add(phone: phone1)
}