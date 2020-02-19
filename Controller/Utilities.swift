//
//  Utilities.swift
//  onTheGo
//
//  Created by Norman Buruchara on 11/21/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    
    static func styleTextField (_ textField:UITextField) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        
//        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        bottomLine.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        
        textField.borderStyle = .none
        
        textField.layer.addSublayer(bottomLine)
    }
}
