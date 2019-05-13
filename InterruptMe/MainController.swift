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
        picker.backgroundColor = UIColor.white
        
        return picker
    }()

    let viewTitle: UITextView = {
        let titleView = UITextView()
        titleView.text = "Set the timer"
        titleView.font = UIFont.boldSystemFont(ofSize: 25)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.textAlignment = .center
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Timer"
        
        view.backgroundColor = UIColor.blue
        
        self.view.addSubview(timerPicker)
        self.view.addSubview(viewTitle)
        setupLayout()
        
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
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

