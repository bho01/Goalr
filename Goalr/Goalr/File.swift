//
//  File.swift
//  Goalr
//
//  Created by Brendon Duan Ho on 12/20/15.
//  Copyright © 2015 SwiftlyDoIt. All rights reserved.
//

import UIKit

class PageItemController: UIViewController{
    var itemIndex: Int = 0
    var imageName: String = ""{
        didSet{
            if let imageView = contentImageView{
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView?.image = UIImage(named: imageName)
    }
    
    @IBOutlet var contentImageView: UIImageView?
}