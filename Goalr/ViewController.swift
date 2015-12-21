//
//  ViewController.swift
//  Goalr
//
//  Created by Brendon Ho on 12/14/15.
//  Copyright © 2015 SwiftlyDoIt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var remove: UIButton!
    @IBOutlet weak var bottomContainer: UIView!

    @IBOutlet weak var topContain: UIView!
 
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var goalCount : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let goalCell = tableView.dequeueReusableCellWithIdentifier("GoalCell")
        return goalCell!;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 

    @IBAction func addTouched(sender: AnyObject) {
        //For Tommorow. Add what button does to life
    }

  



}
