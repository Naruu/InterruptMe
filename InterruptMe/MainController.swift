//
//  ViewController.swift
//  InterruptMe
//
//  Created by Release on 03/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    let timerPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = UIDatePicker.Mode.countDownTimer
        picker.minuteInterval = 10
        picker.countDownDuration = 24*60
        picker.backgroundColor = .white
        
        return picker
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
        button.addTarget(self, action: #selector(buttonTapped), for:.touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Timer"
        
        view.backgroundColor = UIColor(red: 41/255, green:71/255, blue:131/255, alpha:1)
        
        self.view.addSubview(timerPicker)
        self.view.addSubview(viewTitle)
        self.view.addSubview(oneButton)
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
        oneButton.topAnchor.constraint(equalTo:timerPicker.bottomAnchor, constant:100).isActive = true
        //oneButton.layer.cornerRadius = oneButton.widthAnchor * 0.5
        //oneButton.frame = CGRect(x:self.view.bounds.width/2, y:self.view.bounds.height/2+50,width:100, height:100)
        
    }
    
    @objc private func changed(_ sender:UIDatePicker){
        let duration = timerPicker.countDownDuration
    }

    @objc private func buttonTapped(){
        /*if(!oneButton.clicked){
            oneButton.clicked = true
            oneButton.setTitle("Stop", for:.normal)
        }
        else {
            oneButton.clicked = false
            oneButton.setTitle("Start", for: .normal)
        }*/
        print("Button Tapped")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

