//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    enum Constant {
        static let customerAddButtonText = "고객 10명 추가"
        static let resetButtonText = "초기화"
    }
    
    let customerAddButton: UIButton = {
        let customerAddButton = UIButton()
        customerAddButton.setTitle(Constant.customerAddButtonText, for: .normal)
        customerAddButton.setTitleColor(.systemBlue, for: .normal)
        customerAddButton.translatesAutoresizingMaskIntoConstraints = false
        return customerAddButton
    }()
    
    let resetButton: UIButton = {
        let resetButton = UIButton()
        resetButton.setTitle(Constant.resetButtonText, for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        return resetButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(customerAddButton)
        view.addSubview(resetButton)
        setupButtonConstraint()
    }

    func setupButtonConstraint() {
        NSLayoutConstraint.activate([
            customerAddButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customerAddButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resetButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30)
        ])
    }

}

