//
//  ViewController.swift
//  ImpLight
//
//  Created by de la Rosa, Luis on 8/22/14.
//  
//

import UIKit

class ViewController: UIViewController {
    
    let defaultColor = UIColor.blueColor()
    let defaultColorHexString = "0000ff"
    let rgbHexFormat = "%02x%02x%02x"
    
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        color = defaultColor
        
        colorPickerPlaceholderView.color = color
        colorPickerPlaceholderView.didChangeColorBlock = { (aColor: UIColor!) in
            self.color = aColor
        }
    }

    @IBOutlet weak var colorPickerPlaceholderView: NKOColorPickerView!
    
    @IBAction func changeLightButtonTapped(sender: AnyObject) {
        let colorHexString = colorToHexString(color)
        let electricImpClient = AFNetworkingClient()
        electricImpClient.sendHttpRequestToElectricImp(color:colorHexString)
    }
    
    func colorToHexString(aColor: UIColor?) -> String {
        if let someColor = aColor {
            var rgba = [CGFloat](count: 4, repeatedValue: 0.0)
            someColor.getRed(&rgba[0], green: &rgba[1], blue: &rgba[2], alpha: &rgba[3])
            let r = Int(255.0 * rgba[0]), g = Int(255.0 * rgba[1]), b = Int(255.0 * rgba[2])
            return NSString(format: rgbHexFormat, r, g, b)
        } else {
            return defaultColorHexString
        }
    }
}

