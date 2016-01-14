//
//  GLRTableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Ivan Chau on 12/29/15.
//  Copyright © 2015 Ivan Chau. All rights reserved.
//

import UIKit
import Parse
import Foundation


class GLRTableViewController: UITableViewController {
    let socket = SocketIOClient(socketURL: "http://goalr.herokuapp.com", options: [.ForcePolling(true)])
    var userData = NSDictionary()
    var goalArray = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true;
        self.addHandlers()
        self.getGoals()
        self.socket.connect()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getGoals(){
        
        let headers = [
            "cache-control": "no-cache",
            "content-type": "application/x-www-form-urlencoded"
        ]
        
        let postData = NSMutableData(data: "username=AYYLMAO".dataUsingEncoding(NSUTF8StringEncoding)!)
        postData.appendData("&password=AYYLMAO".dataUsingEncoding(NSUTF8StringEncoding)!)
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://goalr.herokuapp.com/login")!,
            cachePolicy: .UseProtocolCachePolicy,
            timeoutInterval: 10.0)
        request.HTTPMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.HTTPBody = postData
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? NSHTTPURLResponse
                print(httpResponse)
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSArray
                    self.userData = NSMutableDictionary(dictionary: json[0] as! NSDictionary)
                    self.goalArray = self.userData.objectForKey("goalName")as! NSArray
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                    // use anyObj here
                } catch {
                    print("json error: \(error)")
                }
            }
        })
        
        dataTask.resume()
    }
    func addHandlers() {
        // Our socket handlers go here
        socket.on("connect") {data, ack in
            print("socket connected")
        }
    }
    func handleString(data: String){
        NSLog(data)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.goalArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GoalCell", forIndexPath: indexPath) as! GLRTableViewCell
        cell.subGoalArray = []
        let dictionary = self.goalArray[indexPath.row] as! NSDictionary
        cell.subGoalArray = dictionary.valueForKey("subgoals") as! NSArray;
        print(cell.subGoalArray)
        cell.subGoalView?.reloadData()
        cell.goalLabel!.text = dictionary.valueForKey("goal") as? String
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSz";
        let dateDue = dateFormatter.dateFromString(dictionary.valueForKey("dateDue") as! String)
        let grandFormat = NSDateFormatter()
        grandFormat.dateFormat = "d.MM.yy"
        cell.dateLabel!.text = grandFormat.stringFromDate(dateDue!)


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
