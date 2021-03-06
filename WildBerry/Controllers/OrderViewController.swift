//
//  OrderViewController.swift
//  WildBerry
//
//  Created by Denis on 20/8/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    lazy var chosenImage = UIImage()
    var imageView = UIImageView()
    var priceLabel = UILabel()
    var acceptButton = UIButton()
    var declineButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        self.view.addSubview(Labels.instance.labelCreation(text: "Nice choice!"))
        
        self.imageView = ImageView.instance.imageViewCreation()
        self.imageView.image = self.chosenImage
        self.view.addSubview(self.imageView)
        
        priceLabelCreation()
        acceptButtonCreation()
        declineButtonCreation()
        
        
    }
    
}

//MARK: - Methods
extension OrderViewController {
    
    func priceLabelCreation() {
        
        self.priceLabel.frame = CGRect(x: 142, y: 427, width: 90, height: 43)
        self.priceLabel.textColor = .red
        self.priceLabel.font = UIFont(name: "Thonburi", size: 20)
        self.priceLabel.textAlignment = .center
        
        switch self.chosenImage {
        case UIImage(named: "Sneaker1"):
            self.priceLabel.text = "700 $"
        case UIImage(named: "Sneaker2"):
            self.priceLabel.text = "900 $"
        case UIImage(named: "Sneaker3"):
            self.priceLabel.text = "800 $"
        default:
            break
        }
        
        self.view.addSubview(self.priceLabel)
    }
    
    func acceptButtonCreation() {
        self.acceptButton.frame = CGRect(x: 39, y: 478, width: 297, height: 69)
        self.acceptButton.setTitle("YES! YES! YES! GIVE IT TO ME!", for: .normal)
        self.acceptButton.backgroundColor = .red
        self.acceptButton.layer.cornerRadius = self.acceptButton.frame.size.width / 10
        self.acceptButton.setTitleColor(.white, for: .normal)
        
        self.acceptButton.addTarget(self, action: #selector(presentAlert), for: .touchUpInside)
        
        self.acceptButton.setTitle("Share with everybody!".uppercased(), for: .normal)
        self.acceptButton.removeTarget(self, action: #selector(presentAlert), for: .touchUpInside)
        self.acceptButton.addTarget(self, action: #selector(handlerShare), for: .touchUpInside)
        
        
        
        self.view.addSubview(self.acceptButton)
    }
    
    func declineButtonCreation() {
        
        self.declineButton.frame = CGRect(x: 71, y: 572, width: 233, height: 29)
        self.declineButton.setTitle("Oh, I want to think more", for: .normal)
        self.declineButton.layer.cornerRadius = self.declineButton.frame.size.width / 20
        self.declineButton.backgroundColor = .gray
        
        self.declineButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        self.view.addSubview(self.declineButton)
        
    }
    
    func share(info: Activity) {
        let activityViewController = UIActivityViewController(activityItems: [info.image, info.orderMessage], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [.airDrop]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

//MARK: - Actions

extension OrderViewController {
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func presentAlert() {
        let alertController = UIAlertController(title: "CONFIRMED", message: "We will call you soon!", preferredStyle: .alert)
        let action = UIAlertAction(title: "All right", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
        self.declineButton.setTitle("Back to menu", for: .normal)
        
    }
    
    @objc func handlerShare() {
        
        let obj = Activity()
        obj.image = self.imageView.image!
        self.share(info: obj)
    }
}

