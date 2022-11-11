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
    
    let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .center
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonStackView
    }()
    
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
        view.backgroundColor = .white
        setupView()
        setupButtonConstraint()
    }
    
    func setupView() {
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(customerAddButton)
        buttonStackView.addArrangedSubview(resetButton)
    }

    func setupButtonConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            buttonStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

}

