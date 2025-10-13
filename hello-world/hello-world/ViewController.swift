//
//  ViewController.swift
//  hello-world
//
//  Created by kinnwonjin on 9/19/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: properites
    
    @IBOutlet weak var myLabel:
    UILabel!
    
    @IBOutlet weak var myImage: UIImageView!

    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // MARK: functions
    
    @IBAction func update(_sender: UIButton) {
        
        myLabel.text = "From Korea"
        myLabel.adjustsFontSizeToFitWidth = true
        
        myImage.image = UIImage( systemName:  "paperplane.fill")
        //myImage.image = UIImage(name: "Wifi")
        
        myButton.setTitle("Clicked!", for: .normal)
        
        //sender.currentTitle
        //sender.setTitle("mmm", for: .normal)
    }


}

