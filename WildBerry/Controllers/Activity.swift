//
//  Activity.swift
//  WildBerry
//
//  Created by Denis on 23/8/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class Activity: NSObject, UIActivityItemSource {
    
    let orderMessage = "Look what I have ordered!!!"
    
    var image = UIImage()
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return orderMessage
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        if activityType == UIActivity.ActivityType.postToFacebook ||
            activityType == UIActivity.ActivityType.postToTwitter {
            return [image, orderMessage]
        } else {
            if activityType == UIActivity.ActivityType.saveToCameraRoll {
                return image
            } else {
                return orderMessage
            }
        }
    }
}

