//
//  CustomImageView.swift
//  Marvel Universe
//
//  Created by Omar  on 17/05/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    let appServerClient = AppServerClient()
    

    
    
    convenience init() {
        let frame:CGRect = CGRect.zero
        self.init(frame: frame)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
