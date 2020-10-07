//
//  ViewController.swift
//  WildBerry
//
//  Created by Denis on 20/8/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var imageView = UIImageView()
    var confirmButton = UIButton()
    var menuArray = ["one", "two", "three"]
    var imageArray = [UIImage(named: "Sneaker1"),
                      UIImage(named: "Sneaker2"),
                      UIImage(named: "Sneaker3")]
    lazy var segmentedControl = UISegmentedControl(items: self.menuArray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .purple
        self.view.addSubview(Labels.instance.labelCreation(text: "Look at them!"))
        
        self.imageView = ImageView.instance.imageViewCreation()
        self.imageView.image = self.imageArray[0]
        self.view.addSubview(self.imageView)
        
        
        self.segmentedControlCreation()
        self.buttonCreation()
        
    }
}

//MARK: - Methods

extension MainViewController {
    
    func segmentedControlCreation() {
        self.segmentedControl.frame = CGRect(x: 62, y: 451, width: 250, height: 31)
        self.segmentedControl.addTarget(self, action: #selector(imageChange), for: .valueChanged)
        self.segmentedControl.selectedSegmentTintColor = .orange
        self.segmentedControl.backgroundColor = .white
        self.segmentedControl.selectedSegmentIndex = 0
        
        self.view.addSubview(self.segmentedControl)
    }
    
    func buttonCreation() {
        
        self.confirmButton.frame = CGRect(x: 109, y: 537, width: 157, height: 54)
        self.confirmButton.backgroundColor = .red
        
        self.confirmButton.setTitle("I want it!", for: .normal)
        self.confirmButton.setTitleColor(.black, for: .normal)
        
        self.confirmButton.layer.cornerRadius = self.confirmButton.frame.size.width / 10
        
        self.confirmButton.addTarget(self, action: #selector(infoShow), for: .touchUpInside)
        self.view.addSubview(self.confirmButton)
        
        
    }
}

//MARK: - Actions

extension MainViewController {
    @objc func imageChange(target: UISegmentedControl) {
        if target.isEqual(self.segmentedControl) {
            let index = target.selectedSegmentIndex
            self.imageView.image = self.imageArray[index]
        }
    }
    
    @objc func infoShow() {
        let vc = OrderViewController()
        vc.chosenImage = self.imageView.image!
        self.present(vc, animated: true, completion: nil)
    }
}
