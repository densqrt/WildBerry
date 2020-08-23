//
//  Labels.swift
//  WildBerry
//
//  Created by Denis on 21/8/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class Labels: UIViewController {
    
    static let instance = Labels()
    
    func labelCreation(text: String) -> UILabel {
        
        let label = UILabel()
        
        label.frame = CGRect(x: 62, y: 68, width: 250, height: 55)
        label.textAlignment = .center
        label.textColor = .white
        label.text = text
        label.font = UIFont(name: "Thonburi", size: 35)
        
        return label
        
    }
}
