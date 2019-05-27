//
//  SettingsController.swift
//  InterruptMe
//
//  Created by Release on 20/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit

class SettingsController: UIViewController,UITextFieldDelegate{

    let notificationIntervalLabel:UILabel = {
        let label = UILabel()
        label.text = "Enter interval for notification"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let notificationIntervalInput:UITextField = {
        let input = UITextField()
        input.text = "5"
        input.textColor = UIColor.white
        input.font = UIFont.boldSystemFont(ofSize: 18)
        input.textAlignment = .center
        input.translatesAutoresizingMaskIntoConstraints = false
        
        input.keyboardType = .numberPad
        
        return input
    }()
    
    let notificationIntervalUnitLabel:UILabel = {
        let label = UILabel()
        label.text = "mins"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let notificationIntervalUnderbar:UIView = {
        let underbar = UIView()
        underbar.backgroundColor = UIColor.white
        underbar.translatesAutoresizingMaskIntoConstraints = false
        return underbar
    }()
    
    
    let notificationSentenceLabel:UILabel = {
        let label = UILabel()
        label.text = "Enter notification sentence"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let notificationSentenceInput:UITextField = {
        let input = UITextField()
        input.backgroundColor = UIColor.white
        input.textColor = UIColor.black
        input.font = UIFont.boldSystemFont(ofSize: 18)
        input.textAlignment = .left
        input.translatesAutoresizingMaskIntoConstraints = false
        
        input.keyboardType = .default
        
        return input
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange

        let Tap = UITapGestureRecognizer(target: self, action:#selector(DismissKeyboard))
        notificationSentenceInput.delegate = self
        self.view.addSubview(notificationIntervalLabel)
        self.view.addSubview(notificationIntervalInput)
        self.view.addSubview(notificationIntervalUnderbar)
        self.view.addSubview(notificationIntervalUnitLabel)
        self.view.addSubview(notificationSentenceLabel)
        self.view.addSubview(notificationSentenceInput)
        self.view.addGestureRecognizer(Tap)
        
        setupIntervalLayout()
        notificationSentenceLabel.topAnchor.constraint(equalTo: notificationIntervalLabel.bottomAnchor, constant: 100).isActive = true
        notificationSentenceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        
        let ud = UserDefaults.standard
        
        if let interval = ud.string(forKey: "interval"){
            notificationIntervalInput.text = interval
        }
        if let sentence = ud.string(forKey: "sentence"){
            notificationSentenceInput.text = sentence
        }
    }
    
    private func setupIntervalLayout(){
        
        notificationIntervalLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        notificationIntervalLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        
        notificationIntervalInput.topAnchor.constraint(equalTo: notificationIntervalLabel.topAnchor).isActive = true
        notificationIntervalInput.leftAnchor.constraint(equalTo: notificationSentenceLabel.rightAnchor, constant: 40).isActive = true
        notificationIntervalInput.widthAnchor.constraint(equalToConstant: 30).isActive = true
        notificationIntervalInput.heightAnchor.constraint(equalTo: notificationSentenceLabel.heightAnchor).isActive = true
        
        notificationIntervalUnderbar.leftAnchor.constraint(equalTo:notificationIntervalInput.leftAnchor).isActive = true
        notificationIntervalUnderbar.bottomAnchor.constraint(equalTo:notificationIntervalInput.bottomAnchor, constant:2).isActive = true
        notificationIntervalUnderbar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        notificationIntervalUnderbar.widthAnchor.constraint(equalTo:notificationIntervalInput.widthAnchor).isActive = true
        
        notificationIntervalUnitLabel.leftAnchor.constraint(equalTo:notificationIntervalInput.rightAnchor).isActive = true
        notificationIntervalUnitLabel.topAnchor.constraint(equalTo:notificationIntervalInput.topAnchor).isActive = true
        notificationIntervalUnitLabel.heightAnchor.constraint(equalTo: notificationIntervalInput.heightAnchor).isActive = true
        
        notificationSentenceInput.leftAnchor.constraint(equalTo:notificationSentenceLabel.leftAnchor).isActive = true
        notificationSentenceInput.topAnchor.constraint(equalTo:notificationSentenceLabel.bottomAnchor).isActive = true
        notificationSentenceInput.heightAnchor.constraint(equalTo:notificationSentenceLabel.heightAnchor).isActive = true
        notificationSentenceInput.rightAnchor.constraint(equalTo:self.view.rightAnchor, constant: -40).isActive = true
    }
    
    @objc func DismissKeyboard(){
        let ud = UserDefaults.standard
        
        view.endEditing(true)
        ud.set(notificationIntervalInput.text, forKey:"interval")
        ud.set(notificationSentenceInput.text, forKey:"sentence")
    }

    func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        let ud = UserDefaults.standard
        ud.set(notificationSentenceInput.text, forKey:"sentence")
        notificationSentenceInput.resignFirstResponder()
        return true
    }
    
}

