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
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Timer"
        
        view.backgroundColor = UIColor(red: 41/255, green:71/255, blue:131/255, alpha:1)
        
        self.view.addSubview(timerPicker)
        self.view.addSubview(viewTitle)
        self.view.addSubview(oneButton)
        self.view.addSubview(timerLabel)

        setupLayout()
        timerPicker.addTarget(self, action: #selector(self.changed(_:)), for: .valueChanged)
    
        // Do any additional setup after loading the view, typically from a nib.
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
        oneButton.topAnchor.constraint(equalTo:timerPicker.bottomAnchor, constant:200).isActive = true
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo:view.topAnchor, constant:view.frame.height*0.3).isActive = true
        timerLabel.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        //oneButton.layer.cornerRadius = oneButton.widthAnchor * 0.5
        //oneButton.frame = CGRect(x:self.view.bounds.width/2, y:self.view.bounds.height/2+50,width:100, height:100)
        
    }
    
    @objc private func changed(_ sender:UIDatePicker){
        let duration = timerPicker.countDownDuration
        counter = Int(duration)
        print(counter)
    }

    @objc private func buttonTapped(_ sender:UIButton){
        if(!isTimerRunning){
            isTimerRunning = true
            calculateTime()
            oneButton.setTitle("Stop", for:.normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer) , userInfo: nil, repeats: true)
            timerPicker.isHidden = true
            timerLabel.isHidden = false
            viewTitle.text = "Time is running!"
        }
        else {
            isTimerRunning = false
            oneButton.setTitle("Start", for: .normal)
            timer.invalidate()
            timerLabel.isHidden = true
            timerPicker.isHidden = false
            viewTitle.text = "Set the timer"
        }
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
    
    private func setupLayoutStop(){


        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo:view.topAnchor, constant:view.frame.height*0.3).isActive = true
        timerLabel.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
    }
    
    private func setupLayoutStart(){

        
        timerPicker.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        timerPicker.topAnchor.constraint(equalTo:view.topAnchor, constant:view.frame.height*0.3).isActive = true
        timerPicker.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        timerPicker.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

