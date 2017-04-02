//: Playground - noun: a place where people can play

import UIKit
import Foundation


//ARC: Automatic Reference Counting -> ki thuat quyet dinh xem vung nho nao se dc ton tai va lay di.
//Memory leak -> vung nho khong duoc giai phong sau khi huy bien.
class User {
    var name: String
    
    //Reference to Phone object
    private(set) var phones: [Phone] = []
    
    //
    var subscriptions: [CarrierSubscription] = []
    
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
    
    //
    var carrierSubscription: CarrierSubscription?
    
    func provision(carrierSubscription: CarrierSubscription) {
        self.carrierSubscription = carrierSubscription
    }

    func decommission() {
        self.carrierSubscription = nil
    }
    
    init(model: String) {
        self.model = model
        print("Phone \(model) is initialized")
    }
    
    deinit {
        print("Phone \(model) is being dealocated")
    }
}

//Unowner References
class CarrierSubscription {
    let name: String
    let countryCode: String
    let number: String
    unowned let user: User
    
    lazy var completePhoneNumber: () -> String = { [unowned self] in
        
        self.countryCode + " " + self.number
        
    }
    
    init(name: String, countryCode: String, number: String, user: User) {
        self.name = name
        self.countryCode = countryCode
        self.number = number
        self.user = user
        
        user.subscriptions.append(self)
        
        print("CarrierSubscription \(name) is initialized")
    }
    
    deinit {
        print("CarrierSubscription \(name) is being dealocated")
    }
}

//Usage
do {
    let user1 = User(name: "Thuan")
    
    let phone1 = Phone(model: "iPhone 6S Plus")
    
    user1.add(phone: phone1)
    
    let subscription1 = CarrierSubscription(name: "Telbel", countryCode: "0032", number: "32489234", user: user1)
    phone1.provision(carrierSubscription: subscription1)
    print(subscription1.completePhoneNumber())
    
}
