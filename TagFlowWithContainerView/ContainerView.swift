//
//  AssignUserViewController.swift
//  JCH VCC
//
//  Created by mobioapp on 29/1/19.
//  Copyright © 2019 Sami. All rights reserved.
//

import UIKit

class ContainerView: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var existingUserView: UIView!
    @IBOutlet weak var newUserView: UIView!
    

    @IBAction func changedSegmentControl(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex {
            
        case 0:
            newUserView.isHidden = true
            existingUserView.isHidden = false
            break
        case 1:
            newUserView.isHidden = false
            existingUserView.isHidden = true
            break;
        default:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newUserView.isHidden = true
        existingUserView.isHidden = false
    }
}
