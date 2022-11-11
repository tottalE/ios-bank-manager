//
//  CustomerLabel.swift
//  BankManagerUIApp
//
//  Created by jin on 11/11/22.
//

import UIKit

class CustomerLabel: UILabel {
    var customer: Customer?
    
    init(_ customer: Customer) {
        super.init(frame: .zero)
        self.customer = customer
        self.text = "\(customer.number) - \(customer.serviceType.message)"
        self.textColor = customer.serviceType == .deposit ? .black : .purple
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        self.textAlignment = .center
        self.font = UIFont.preferredFont(forTextStyle: .body)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
