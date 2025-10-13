//
//  InfoViewController.swift
//  quiz0
//
//  Created by kinnwonjin on 11/7/25.
//

import Foundation
import UIKit

class P_InfoViewController: UIViewController {
    var infoText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGray5
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        label.text = infoText
        label.frame = CGRect(x: 50, y: 10, width: 300, height: 500)
        
        view.addSubview(label)
    }
    
    func setInfoText(s: String) {
        infoText = s
    }
}
