//
//  ViewController.swift
//  InterruptMe
//
//  Created by Release on 03/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    let timerViewController:TimerController! = TimerController()
    let settingsViewController:SettingsController! = SettingsController()

    
    let mainView: UIView = {
        let smallView:UIView = UIView()
        smallView.translatesAutoresizingMaskIntoConstraints = false
        smallView.backgroundColor = UIColor.orange
        //UIColor(red: 41/255, green:71/255, blue:131/255, alpha:1)
        
        return smallView
    }()
    
    
    let scView: UIView = {
        let smallView:UIView = UIView()
        smallView.backgroundColor = UIColor.orange
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
        
        self.addChildViewController(timerViewController)
        self.mainView.addSubview(timerViewController.view)
        timerViewController.view.frame = mainView.bounds
        timerViewController.didMove(toParentViewController: self)

    }
    
    
    private func setupLayout(){
        mainView.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant : -70).isActive = true
        mainView.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true

        scView.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        scView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        scView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
    }
    
    private func setupSCLayout(){
        pageControl.centerXAnchor.constraint(equalTo:scView.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: scView.bottomAnchor, constant:-20).isActive = true
        pageControl.topAnchor.constraint(equalTo:scView.topAnchor).isActive = true
        pageControl.widthAnchor.constraint(equalTo: scView.widthAnchor).isActive = true
    }
   
    
    @objc func changePage(){
        switch pageControl.selectedSegmentIndex{
        case 0:
            print("0 selected")
            remove(asChildViewController: settingsViewController)
            add(asChildViewController: timerViewController)
            
        case 1:
            print("1 selected")
            remove(asChildViewController: timerViewController)
            add(asChildViewController: settingsViewController)

        default: ()
        }
        
    }
    
    private func add(asChildViewController viewController: UIViewController){
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = mainView.bounds
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController){
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

