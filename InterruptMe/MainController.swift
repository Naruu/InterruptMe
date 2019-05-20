//
//  ViewController.swift
//  InterruptMe
//
//  Created by Release on 03/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    let mainView: UIView = {
        let smallView:UIView = UIView()
        smallView.backgroundColor = UIColor.orange
        //UIColor(red: 41/255, green:71/255, blue:131/255, alpha:1)
        smallView.translatesAutoresizingMaskIntoConstraints = false
        
        return smallView
    }()
    
    let scView: UIView = {
        let smallView:UIView = UIView()
        smallView.backgroundColor = UIColor.blue
        smallView.translatesAutoresizingMaskIntoConstraints = false

        return smallView
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
        
        self.view.addSubview(mainView)
        self.view.addSubview(scView)
        scView.addSubview(pageControl)
        setupLayout()
        setupSCLayout()
              
    }
    
    
    private func setupLayout(){
        mainView.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo:self.view.heightAnchor, constant: -50).isActive = true
        mainView.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        
        scView.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        scView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
    }
    
    private func setupSCLayout(){
        pageControl.centerXAnchor.constraint(equalTo:scView.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: scView.bottomAnchor).isActive = true
        pageControl.topAnchor.constraint(equalTo:scView.topAnchor).isActive = true
        pageControl.widthAnchor.constraint(equalTo: scView.widthAnchor).isActive = true
    }
   
    
    @objc func changePage(){
        switch pageControl.selectedSegmentIndex{
        case 0:
            print("0 selected")
            let timerViewController:UIViewController = TimerController()
            present(timerViewController, animated:false, completion:nil)
        case 1:
            print("1 selectec")
            //let settingsViewController: UIViewController = SettingsController()
            //present(settingsViewController, animated:false, completion:nil)
        default: ()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

