import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: properites
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myName: UITextField!

    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myName.delegate = self
        // Do any additional setup after loading the view.
    }
    // MARK: functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myName.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        guard let name = myName.text else {
            print("nil")
            return false
        }
        let temp = name == "" ? false : true
        return temp
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    @IBAction func update(_ sender: UIButton){
        guard let name = myName.text else {
            return
        }
        
        switch name {
        case "":
            myLabel.text = "From Unknown"
        default:
            myLabel.text = "From \(name)"
        }
        
        myLabel.adjustsFontSizeToFitWidth = true
        
        myImage.image = UIImage( systemName:  "paperplane.fill")
        
        myButton.setTitle("Clicked!", for: .normal)
    }
}

