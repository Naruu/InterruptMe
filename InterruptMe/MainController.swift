//
//  ViewController.swift
//  InterruptMe
//
//  Created by Release on 03/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit

class MainController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        let timerPicker:UIDatePicker = UIDatePicker()
        timerPicker.frame = CGRect(x:10, y: 50, width: self.view.frame.width, height: 200)
        timerPicker.datePickerMode = UIDatePicker.Mode.countDownTimer
        timerPicker.minuteInterval = 10
        timerPicker.countDownDuration = 24*60
        timerPicker.backgroundColor = UIColor.white
        
        self.view.addSubview(timerPicker)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

