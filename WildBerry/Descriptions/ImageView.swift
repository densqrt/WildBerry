//
//  ImageView.swift
//  WildBerry
//
//  Created by Denis on 21/8/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class ImageView: UIViewController {

    static let instance = ImageView()
    
    func imageViewCreation() -> UIImageView {
        
        let imageView = UIImageView()
        
        imageView.frame = CGRect(x: 62, y: 156, width: 250, height: 250)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
        
    }
   

}
