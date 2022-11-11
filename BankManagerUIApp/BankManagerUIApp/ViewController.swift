//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var (minutes, seconds, milliseconds) = (0, 0, 0)
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.keepTimer), userInfo: nil, repeats: true)
    }
    
    @objc func keepTimer() {
        milliseconds += 1
        seconds = (milliseconds/1000)%60
        minutes = seconds/60
        
        let minuteStr = String(format:"%02d", minutes)
        let secondStr = String(format:"%02d", seconds)
        let millisecondsStr = String(format:"%03d", milliseconds%1000)
        
        timeLabel.text = "업무시간 - " + minuteStr + ":" + secondStr + ":" + millisecondsStr
    }
    
    enum Constant {
        static let customerAddButtonText = "고객 10명 추가"
        static let resetButtonText = "초기화"
        static let waitingLabelText = "대기중"
        static let processingLableText = "업무중"
    }
    
    var timeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title2)
        label.text = "00:00:000"
        return label
    }()
    
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
        startTimer()
        setupButtonConstraint()
        setUpTimeConstraint()
        setupLineLabelConstraint()
    }
    
    func setupView() {
        view.addSubview(buttonStackView)
        view.addSubview(timeLabel)
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
    
    func setUpTimeConstraint() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            timeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            timeLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    func setupLineLabelConstraint() {
        NSLayoutConstraint.activate([
            lineLabelStackView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            lineLabelStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            lineLabelStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

