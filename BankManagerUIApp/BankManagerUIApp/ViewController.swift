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
        static let workingTimeLabelText = "업무시간 - "
        static let timerStartingTimeText = "00:00:000"
    }
    
    var timer = Timer()
    var (minutes, seconds, milliseconds) = (0, 0, 0)
    var bankManager = BankManager()
    
    var timeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight.medium)
        label.text = Constant.timerStartingTimeText
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
        customerAddButton.addTarget(self, action: #selector(customerAddButtonPressed), for: .touchUpInside)
        return customerAddButton
    }()
    
    let resetButton: UIButton = {
        let resetButton = UIButton()
        resetButton.setTitle(Constant.resetButtonText, for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
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
    
    let scrollStackView: UIStackView = {
        let scrollStackView = UIStackView()
        scrollStackView.axis = .horizontal
        scrollStackView.distribution = .fillEqually
        scrollStackView.translatesAutoresizingMaskIntoConstraints = false
        return scrollStackView
    }()
    
    private let waitingScrollView: UIScrollView = {
        let waitingScrollView = UIScrollView()
        waitingScrollView.translatesAutoresizingMaskIntoConstraints = false
        waitingScrollView.backgroundColor = .white
        waitingScrollView.showsVerticalScrollIndicator = false
        
        return waitingScrollView
    }()
    
    private let processingScrollView: UIScrollView = {
        let processingScrollView = UIScrollView()
        processingScrollView.translatesAutoresizingMaskIntoConstraints = false
        processingScrollView.backgroundColor = .white
        processingScrollView.showsVerticalScrollIndicator = false
        
        return processingScrollView
    }()
    
    private let waitingStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .vertical
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let processingStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .vertical
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bankManager.delegate = self
        setupNotificationCenter()
        setupView()
        setupButtonConstraint()
        setUpTimeConstraint()
        setupLineLabelConstraint()
        setUpScrollViewConstraint()
    }
    
    func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(stopTimer),
                                               name: NSNotification.Name("WorkEnded"),
                                               object: nil)
    }
    
    func setupView() {
        view.addSubview(buttonStackView)
        view.addSubview(timeLabel)
        view.addSubview(lineLabelStackView)
        view.addSubview(scrollStackView)
        
        buttonStackView.addArrangedSubview(customerAddButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        lineLabelStackView.addArrangedSubview(waitingLabel)
        lineLabelStackView.addArrangedSubview(processingLabel)
        
        scrollStackView.addArrangedSubview(waitingScrollView)
        scrollStackView.addArrangedSubview(processingScrollView)
        
        waitingScrollView.addSubview(waitingStackView)
        processingScrollView.addSubview(processingStackView)
        
        /*
         contentView.addSubView(customerLabel)
         */
    }
    
    func setupButtonConstraint() {
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            buttonStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpTimeConstraint() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            timeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            timeLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupLineLabelConstraint() {
        NSLayoutConstraint.activate([
            lineLabelStackView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            lineLabelStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            lineLabelStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            lineLabelStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpScrollViewConstraint() {
        NSLayoutConstraint.activate([
            scrollStackView.topAnchor.constraint(equalTo: lineLabelStackView.bottomAnchor),
            scrollStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor),
            waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.leadingAnchor),
            waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.trailingAnchor),
            waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor),
            waitingStackView.widthAnchor.constraint(equalTo: waitingScrollView.widthAnchor),
            
            processingStackView.topAnchor.constraint(equalTo: processingStackView.topAnchor),
            processingStackView.leadingAnchor.constraint(equalTo: processingStackView.leadingAnchor),
            processingStackView.trailingAnchor.constraint(equalTo: processingStackView.trailingAnchor),
            processingStackView.bottomAnchor.constraint(equalTo: processingStackView.bottomAnchor),
            processingStackView.widthAnchor.constraint(equalTo: processingScrollView.widthAnchor)
        ])
    }

    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.keepTimer), userInfo: nil, repeats: true)
    }
    
    @objc func keepTimer() {
        milliseconds += 1
        seconds = (milliseconds/1000)%60
        minutes = seconds/60
        
        let minuteStr = String(format:"%2.2d", minutes)
        let secondStr = String(format:"%2.2d", seconds)
        let millisecondsStr = String(format:"%3.3d", milliseconds%1000)
        
        timeLabel.text = Constant.workingTimeLabelText + minuteStr + ":" + secondStr + ":" + millisecondsStr
    }
    
    @objc func resetButtonPressed() {
        resetTimer()
        bankManager.reset()
    }
    
    func resetTimer() {
        timer.invalidate()
        (minutes, seconds, milliseconds) = (0, 0, 0)
        timeLabel.text = Constant.workingTimeLabelText + Constant.timerStartingTimeText
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func customerAddButtonPressed() {
        if !timer.isValid {
            startTimer()
        }
        
        bankManager.start()
    }
}

extension ViewController: CustomerQueueDelegate {
    func addVC(of customer: Customer) {
        let customerLabel = CustomerLabel(customer)
        
        NSLayoutConstraint.activate([
            customerLabel.heightAnchor.constraint(equalToConstant: 20),
            customerLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        waitingStackView.addArrangedSubview(customerLabel)
    }
}

