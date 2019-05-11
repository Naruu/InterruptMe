//
//  TimerController.swift
//  InterruptMe
//
//  Created by Release on 11/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import Foundation
import UIKit

class TimerController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"cellId")

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = UIColor.black
        return cell
    }
    
}

