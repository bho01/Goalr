//
//  ViewController.swift
//  Goalr
//
//  Created by Brendon Duan Ho on 12/14/15.
//  Copyright © 2015 SwiftlyDoIt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var addGoal: UIButton!
    @IBOutlet weak var name: UILabel!
    
    var nameImput = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameImput = String()
        name.text = "\(nameImput)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addGoalAction(sender: AnyObject) {
        
        
    }


}

