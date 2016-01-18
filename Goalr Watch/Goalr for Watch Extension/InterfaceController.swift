//
//  InterfaceController.swift
//  Goalr for Watch Extension
//
//  Created by Brendon Ho on 1/15/16.
//  Copyright © 2016 Goalr. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet var imageView: WKInterfaceImage!
    @IBOutlet var editBtn: WKInterfaceButton!
 
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
        
        //Progress bar animation
        imageView.setImageNamed("singulararc")
        imageView.startAnimatingWithImagesInRange(NSMakeRange(0, 101), duration: 1.5, repeatCount: 1)
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
