//
//  SettingsController.swift
//  InterruptMe
//
//  Created by Release on 20/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    let notificationIntervalLabel:UILabel = {
        let label = UILabel()
        label.text = "Enter interval for notification\n(in minutes)"
        label.numberOfLines = 2
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let notificationIntervalInput:UITextField = {
        let input = UITextField()
        input.text = "5"
        input.font = UIFont.boldSystemFont(ofSize: 16)
        input.backgroundColor = UIColor.white
        //input.layer.borderColor = UIColor.black.cgColor
        //input.layer.borderWidth = 1.0
        input.translatesAutoresizingMaskIntoConstraints = false
        
        return input
    }()
    
    let notificationIntervalUnderbar
    
    
    let notificationSentenceLabel:UILabel = {
        let label = UILabel()
        label.text = "Enter notification sentence"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange

        
        self.view.addSubview(notificationIntervalLabel)
        self.view.addSubview(notificationIntervalInput)
        self.view.addSubview(notificationSentenceLabel)
        
        notificationIntervalLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        notificationIntervalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true

        notificationIntervalInput.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        notificationIntervalInput.leadingAnchor.constraint(equalTo: notificationSentenceLabel.trailingAnchor, constant: 30).isActive = true
        notificationIntervalInput.widthAnchor.constraint(equalToConstant: 30).isActive = true
        notificationIntervalInput.heightAnchor.constraint(equalTo: notificationSentenceLabel.heightAnchor).isActive = true

        
        notificationSentenceLabel.topAnchor.constraint(equalTo: notificationIntervalLabel.bottomAnchor, constant: 100).isActive = true
        notificationSentenceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    }
}
