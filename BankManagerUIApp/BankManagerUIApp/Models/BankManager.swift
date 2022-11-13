//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//


struct BankManager {
    
    var bank: Bank = Bank(clerkCount: 3, loanClerkCount: 1)
    var delegate: CustomerQueueDelegate?

    mutating func start() {
        setupTenCustomerQueue()
        bank.open()
    }

    mutating func setupRandomCustomerQueue() {
        let randomNumber = Int.random(in: 10...30)
        bank.customerCount = randomNumber
        Array(repeating: 0, count: randomNumber).enumerated().forEach { index, number in
            guard let serviceType = Service.allCases.randomElement() else {
                return
            }
            bank.customerQueue.enqueue(Customer(number: index+1, serviceType: serviceType))
        }
    }
    
    mutating func setupTenCustomerQueue() {
        let previousCustomerCount = bank.customerCount
        bank.customerCount += 10
        let currentCustomerCount = bank.customerCount
        
        (previousCustomerCount+1...currentCustomerCount).forEach { number in
            guard let serviceType = Service.allCases.randomElement() else {
                return
            }
            let customer = Customer(number: number, serviceType: serviceType)
            delegate?.addVC(of: customer)
            bank.customerQueue.enqueue(customer)
        }
    }
    
    mutating func reset() {
        bank = Bank(clerkCount: 3, loanClerkCount: 1)
    }
}
