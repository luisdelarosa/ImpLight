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
//            println("aColor:\(aColor)")
            self.color = aColor
        }
    }

    @IBOutlet weak var colorPickerPlaceholderView: NKOColorPickerView!
    
    @IBAction func changeLightButtonTapped(sender: AnyObject) {
        let colorHexString = colorToHexString(color)
//        println("color:\(colorHexString)")
        let electricImpClient = AFNetworkingClient()
        electricImpClient.sendHttpRequestToElectricImp(color:colorHexString)
    }
    
    func colorToHexString(aColor: UIColor?) -> String {
        if let someColor = aColor {
            var rgba = [CGFloat](count: 4, repeatedValue: 0.0)
            
            someColor.getRed(&rgba[0], green: &rgba[1], blue: &rgba[2], alpha: &rgba[3])
            let r = Int(255.0 * rgba[0]), g = Int(255.0 * rgba[1]), b = Int(255.0 * rgba[2])
            return NSString(format: rgbHexFormat, r, g, b)

//            println("red:\(rgba[0])")
//            println("green:\(rgba[1])")
//            println("blue:\(rgba[2])")
//            let r = Int(255.0 * rgba[0])
//            let g = Int(255.0 * rgba[1])
//            let b = Int(255.0 * rgba[2])
//            let a = Int(255.0 * rgba[3])
//            println("red:\(r)")
//            println("green:\(g)")
//            println("blue:\(b)")
            
        } else {
            return defaultColorHexString
        }
    }
}

