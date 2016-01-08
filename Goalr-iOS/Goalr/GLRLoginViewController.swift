//
//  GLRLoginViewController.swift
//  Goalr
//
//  Created by Ivan Chau on 1/8/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Security

class GLRLoginViewController: UIViewController {
    let keychain = Keychain();

    @IBOutlet weak var usernameTextField : UITextField?
    @IBOutlet weak var passwordTextField : UITextField?
    @IBOutlet weak var goButton : UIButton?
    
    @IBAction func goNow(sender:UIButton){
        if (keychain.getPasscode("GoalrPassword")! != ""){
            print(keychain.getPasscode("GoalrPassword"))
            print(keychain.getPasscode("GoalrUsername"));
            let headers = [
                "cache-control": "no-cache",
                "content-type": "application/x-www-form-urlencoded"
            ]
            
            let usernameString = "username=" + (keychain.getPasscode("GoalrUsername") as? String)!
            let passwordString = "&password=" + (keychain.getPasscode("GoalrPassword")as? String)!;
            let postData = NSMutableData(data: usernameString.dataUsingEncoding(NSUTF8StringEncoding)!)
            postData.appendData(passwordString.dataUsingEncoding(NSUTF8StringEncoding)!)
            
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
                    
                    if (httpResponse?.statusCode == 200){
                        dispatch_async(dispatch_get_main_queue(), {
                            print("good")
                        })
                    }else{
                        print("error")
                    }
                    // use anyObj here
                    print("json error: \(error)")
                }
            })
            
            dataTask.resume()

        }else{
        print(self.usernameTextField?.text)
        print(self.passwordTextField?.text)
        if (self.usernameTextField?.text == "" || self.passwordTextField?.text == ""){
            if #available(iOS 8.0, *) {
                let alertView = UIAlertController(title: "UWOTM8", message: "Fam, what you tryna pull?", preferredStyle: .Alert)
                let OK = UIAlertAction(title: "Is it 2 l8 2 say sorry", style: .Default, handler: nil)
                alertView.addAction(OK)
                self.presentViewController(alertView, animated: true, completion: nil);
                return;
            } else {
                return;
            }
        }
        usernameTextField?.resignFirstResponder()
        passwordTextField?.resignFirstResponder()
        
        let headers = [
            "cache-control": "no-cache",
            "content-type": "application/x-www-form-urlencoded"
        ]
        
        let usernameString = "username=" + usernameTextField!.text!;
        let passwordString = "&password=" + passwordTextField!.text!;
        let postData = NSMutableData(data: usernameString.dataUsingEncoding(NSUTF8StringEncoding)!)
        postData.appendData(passwordString.dataUsingEncoding(NSUTF8StringEncoding)!)
        
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
                
                if (httpResponse?.statusCode == 200){
                    dispatch_async(dispatch_get_main_queue(), {
                        self.keychain.setPasscode("GoalrPassword", passcode : self.passwordTextField!.text!);
                        print(self.keychain.getPasscode("GoalrPassword"))
                        self.keychain.setPasscode("GoalrUsername", passcode: self.usernameTextField!.text!)
                        print(self.keychain.getPasscode("GoalrUsername"))
                    })
                }else{
                    print("error")
                }
                // use anyObj here
                print("json error: \(error)")
            }
        })
        
        dataTask.resume()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
