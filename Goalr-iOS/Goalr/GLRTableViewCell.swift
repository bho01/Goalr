//
//  GLRTableViewCell.swift
//  ParseStarterProject-Swift
//
//  Created by Ivan Chau on 12/30/15.
//  Copyright © 2015 Ivan Chau. All rights reserved.
//

import UIKit

class GLRTableViewCell: UITableViewCell, UITableViewDataSource {
    @IBOutlet weak var goalLabel : UILabel?
    @IBOutlet weak var dateLabel : UILabel?
    @IBOutlet weak var subGoalView : UITableView?
    var subGoalArray = NSArray()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.subGoalView?.dataSource = self;
        // Initialization code
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SubgoalCell", forIndexPath: indexPath) as! GLRSubTableViewCell
        if(indexPath.row < self.subGoalArray.count-1 || indexPath.row == self.subGoalArray.count - 2){
        print (self.subGoalArray.count)
        print (indexPath.row)
        let dictionary = self.subGoalArray[indexPath.row + 1] as! NSDictionary
        let information = dictionary.valueForKey("goal") as? NSArray
        cell.subGoal!.text = information![0] as? String
        print(information![0] as? String)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSz";
        let dateDue = dateFormatter.dateFromString(dictionary.valueForKey("date") as! String)
        print (dateDue?.description)
        let grandFormat = NSDateFormatter()
        grandFormat.dateFormat = "d.MM.yy"
        cell.datez!.text = grandFormat.stringFromDate(dateDue!)
        return cell

        }else{
            return UITableViewCell()
        }
        
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subGoalArray.count - 1
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
