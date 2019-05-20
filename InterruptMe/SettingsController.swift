//
//  SettingsController.swift
//  InterruptMe
//
//  Created by Release on 20/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let smallView = UIView()
        smallView.frame = CGRect(x:0,y:0,width:200,height:200)
        smallView.backgroundColor = UIColor.blue
        
        self.view.addSubview(smallView)
        
    }
}
