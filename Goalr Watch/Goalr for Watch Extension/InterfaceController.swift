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
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        //Progress bar animation
        imageView.setImageNamed("arc")
        imageView.startAnimatingWithImagesInRange(NSMakeRange(0, 100), duration: 2, repeatCount: 100)
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
