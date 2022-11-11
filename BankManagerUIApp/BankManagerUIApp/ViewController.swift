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
        static let waitingLabelText = "대기중"
        static let processingLableText = "업무중"
    }
    
    let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .center
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonStackView
    }()
    
    let lineLabelStackView: UIStackView = {
        let lineLabelStackView = UIStackView()
        lineLabelStackView.axis = .horizontal
        lineLabelStackView.distribution = .fillEqually
        lineLabelStackView.alignment = .center
        lineLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        return lineLabelStackView
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
    
    let waitingLabel: UILabel = {
        let waitingLabel = UILabel()
        waitingLabel.text = Constant.waitingLabelText
        waitingLabel.font = .preferredFont(forTextStyle: .title1)
        waitingLabel.textColor = .white
        waitingLabel.backgroundColor = .systemYellow
        waitingLabel.textAlignment = .center
        waitingLabel.translatesAutoresizingMaskIntoConstraints = false
        return waitingLabel
    }()
    
    let processingLabel: UILabel = {
        let processingLabel = UILabel()
        processingLabel.text = Constant.processingLableText
        processingLabel.font = .preferredFont(forTextStyle: .title1)
        processingLabel.textColor = .white
        processingLabel.backgroundColor = .systemRed
        processingLabel.textAlignment = .center
        processingLabel.translatesAutoresizingMaskIntoConstraints = false
        return processingLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupButtonConstraint()
        setupLineLabelConstraint()
    }
    
    func setupView() {
        view.addSubview(buttonStackView)
        view.addSubview(lineLabelStackView)
        buttonStackView.addArrangedSubview(customerAddButton)
        buttonStackView.addArrangedSubview(resetButton)
        lineLabelStackView.addArrangedSubview(waitingLabel)
        lineLabelStackView.addArrangedSubview(processingLabel)

    }

    func setupButtonConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            buttonStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    func setupLineLabelConstraint() {
        NSLayoutConstraint.activate([
            lineLabelStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            lineLabelStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            lineLabelStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

}

