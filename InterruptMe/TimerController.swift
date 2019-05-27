//
//  TimerController.swift
//  InterruptMe
//
//  Created by Release on 20/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import Foundation
import UIKit

class TimerController:UIViewController{

    var timer = Timer()
    var isTimerRunning = false
    var counter = 5*60
    var notiCounter = 0
    
    let timerPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = UIDatePickerMode.countDownTimer
        //picker.datePickerMode = UIDatePicker.Mode.countDownTimer
        picker.minuteInterval = 5
        picker.countDownDuration = 60*5
        picker.backgroundColor = .orange
        picker.setValue(UIColor.white, forKeyPath:"textColor")
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
    
    lazy var notiTimerLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "2343"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewTitle: UITextView = {
        let titleView = UITextView()
        titleView.text = "Set the timer"
        titleView.font = UIFont.boldSystemFont(ofSize: 25)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = UIColor.orange
            //UIColor(red: 41/255, green:71/255, blue:131/255, alpha:1)
        titleView.textColor = .white
        titleView.textAlignment = .center
        return titleView
    }()
    
    let oneButton: UIButton = {
        let button = UIButton()
        //let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(_:)), for:.touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
            //UIColor(red: 41/255, green:71/255, blue:131/255, alpha:1)
        self.view.addSubview(timerPicker)
        self.view.addSubview(viewTitle)
        self.view.addSubview(oneButton)
        self.view.addSubview(timerLabel)
        self.view.addSubview(notiTimerLabel)
        
        setupLayout()
        timerPicker.addTarget(self, action: #selector(timerPicked(_:)), for: .valueChanged)
        
        let ud = UserDefaults.standard
        if let notic = ud.value(forKey: "interval") as? String{
            notiCounter = Int(notic)! * 60
        }
        
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
        oneButton.topAnchor.constraint(equalTo:timerPicker.bottomAnchor).isActive = true
        
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo:view.topAnchor, constant:view.frame.height*0.35).isActive = true
        timerLabel.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        notiTimerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        notiTimerLabel.topAnchor.constraint(equalTo:timerLabel.bottomAnchor).isActive = true
        notiTimerLabel.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        notiTimerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
            registerDeviceLockNotification()
        }
        else {
            oneButton.setTitle("Start", for: .normal)
            timer.invalidate()
            viewTitle.text = "Set the timer"
            removeDeviceLockNotification()
        }
        
        isTimerRunning = !isTimerRunning
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.timerPicker.isHidden = !self.timerPicker.isHidden
            self.timerLabel.isHidden = !self.timerLabel.isHidden
            self.notiTimerLabel.isHidden = !self.notiTimerLabel.isHidden
        })
    }
    
    @objc private func runTimer(_ sender:Timer){
        counter-=1
        notiCounter-=1
        calculateTime()
        
    }
    
    private func calculateTime(){
        
        let hour = counter/3600
        let minute = (counter % 3600) / 60
        let second = (counter % 3600) % 60
        
        var hourString = "\(hour)"
        var minuteString = "\(minute)"
        var secondString = "\(second)"
        
        let notiMinute = notiCounter / 60
        let notiSecond = notiCounter % 60
        
        var notiMinuteString = "\(notiMinute)"
        var notiSecondString = "\(notiSecond)"
        
        if(hour<10){
            hourString = "0\(hour)"
        }
        
        if(minute<10){
            minuteString = "0\(minute)"
        }
        
        if(second<10){
            secondString = "0\(second)"
        }
        
        if(notiMinute<10){
            notiMinuteString = "0\(notiMinute)"
        }

        if(notiSecond<10){
            notiSecondString = "0\(notiSecond)"
        }
        
        timerLabel.text = "\(hourString):\(minuteString):\(secondString)"
        notiTimerLabel.text = "\(notiMinuteString):\(notiSecondString)"
    }
    
    func registerDeviceLockNotification() {
        
        /*
         CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
         nil,
         screenLockChanged,
         "com.apple.springboard.lockcomplete" as CFString,
         nil,     // object
         .deliverImmediately)
         
         */
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                        nil,
                                        screenLockChanged,
                                        "com.apple.springboard.lockstate" as CFString,
                                        nil,
                                        .deliverImmediately)
        
    }
    
    func removeDeviceLockNotification(){
        CFNotificationCenterRemoveObserver(CFNotificationCenterGetDarwinNotifyCenter(), nil, CFNotificationName("com.apple.springboard.lockstate" as CFString), nil)
    }
    
    let screenLockChanged: CFNotificationCallback = { center, observer, name, object, info in
        print("screen lock changed")
    }

    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        let ud = UserDefaults.standard
        
        if let interval = ud.string(forKey: "interval"){
            notiCounter = Int(interval)! * 60
        }
        
    }
}
