//
//  ViewController.swift
//  InterruptMe
//
//  Created by Release on 03/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    var timer = Timer()
    var isTimerRunning = false
    var counter = 5*60
    
    let timerPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = UIDatePicker.Mode.countDownTimer
        picker.minuteInterval = 5
        picker.countDownDuration = 60*5
        picker.backgroundColor = .white
        return picker
    }()
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewTitle: UITextView = {
        let titleView = UITextView()
        titleView.text = "Set the timer"
        titleView.font = UIFont.boldSystemFont(ofSize: 25)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = UIColor(red: 41/255, green:71/255, blue:131/255, alpha:1)
        titleView.textColor = .white
        titleView.textAlignment = .center
        return titleView
    }()
    
    let oneButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)

        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(_:)), for:.touchUpInside)
        return button
    }()
    
    let pageControl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Timer", "Setting"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.white
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(changePage), for: .valueChanged)
        return sc
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 41/255, green:71/255, blue:131/255, alpha:1)
        self.view.addSubview(timerPicker)
        self.view.addSubview(viewTitle)
        self.view.addSubview(oneButton)
        self.view.addSubview(timerLabel)
        self.view.addSubview(pageControl)

        setupLayout()
        timerPicker.addTarget(self, action: #selector(timerPicked(_:)), for: .valueChanged)
    }
    
    
    private func setupLayout(){
        timerPicker.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        timerPicker.topAnchor.constraint(equalTo:view.topAnchor, constant:view.frame.height*0.3).isActive = true
        timerPicker.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        timerPicker.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        viewTitle.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        viewTitle.topAnchor.constraint(equalTo:view.topAnchor, constant:view.frame.height*0.15).isActive = true
        viewTitle.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        viewTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        oneButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        oneButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        oneButton.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        oneButton.topAnchor.constraint(equalTo:timerPicker.bottomAnchor, constant:100).isActive = true
        
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo:view.topAnchor, constant:view.frame.height*0.3).isActive = true
        timerLabel.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        pageControl.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant : -40).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageControl.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    
    @objc private func timerPicked(_ sender:UIDatePicker){
        let duration = timerPicker.countDownDuration
        counter = Int(duration)
        print(counter)
    }

    @objc private func buttonTapped(_ sender:UIButton){
        if(!isTimerRunning){
            calculateTime()
            oneButton.setTitle("Stop", for:.normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer) , userInfo: nil, repeats: true)
            viewTitle.text = "Time is running!"
        }
        else {
            oneButton.setTitle("Start", for: .normal)
            timer.invalidate()
            viewTitle.text = "Set the timer"
        }
        
        isTimerRunning = !isTimerRunning
    
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.timerPicker.isHidden = !self.timerPicker.isHidden
            self.timerLabel.isHidden = !self.timerLabel.isHidden
        })
    }
    
    @objc private func runTimer(_ sender:Timer){
        counter-=1
        calculateTime()
        
    }
    
    private func calculateTime(){
            
        let hour = counter/3600
        let minute = (counter % 3600) / 60
        let second = (counter % 3600) % 60
        
        var hourString = "\(hour)"
        var minuteString = "\(minute)"
        var secondString = "\(second)"
        
        if(hour<10){
            hourString = "0\(hour)"
        }
        
        if(minute<10){
            minuteString = "0\(minute)"
        }
        
        if(second<10){
            secondString = "0\(second)"
        }
        
        timerLabel.text = "\(hourString):\(minuteString):\(secondString)"
        
    }
    
    @objc func changePage(){
        //change the page to the setting page
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

