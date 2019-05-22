//
//  SettingsController.swift
//  InterruptMe
//
//  Created by Release on 20/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    let timesetLabel:UILabel = {
        let label = UILabel()
        label.text = "Enter interval for notification"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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

        
        self.view.addSubview(timesetLabel)
        self.view.addSubview(notificationSentenceLabel)
        
        timesetLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        timesetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        
        notificationSentenceLabel.topAnchor.constraint(equalTo: timesetLabel.bottomAnchor, constant: 100).isActive = true
        notificationSentenceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
