//
//  ViewController.swift
//  Device Orientation
//
//  Created by Jeffrey  on 4/3/20.
//  Copyright © 2020 BMCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orientationLabel: UILabel!
    
    
    @IBOutlet weak var orientationButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orientationChanged()
        
        NotificationCenter.default.addObserver(
        self,
        selector: #selector(orientationFrames),
        name: UIDevice.orientationDidChangeNotification,
        object: nil
        );
        
        view.backgroundColor = .green
        
        orientationLabel.backgroundColor = .green
        orientationLabel.textColor = .white
        orientationLabel.font = .systemFont(ofSize: 18)
        
        orientationButtonOutlet.backgroundColor = .white
        orientationButtonOutlet.setTitleColor(.green, for: .normal)
        orientationButtonOutlet.setTitle("What's my orientation?", for: .normal)
        orientationButtonOutlet.layer.cornerRadius = 6
       
    }
    
    func orientationChanged() {
       
        let orientation: UIDeviceOrientation = UIDevice.current.orientation;

        switch orientation {
        case .unknown:
            print("unknown");
            orientationLabel.text! = "My orientation is unknown";
        case .portrait:
            print("portrait");           //home button at bottom
            orientationLabel.text! = "My orientation is portrait";
        case .portraitUpsideDown:
            print("portraitUpsideDown"); //home button at top
            orientationLabel.text! = "My orientation is portraitUpsideDown";
            
        case .landscapeLeft:
            print("landscapeLeft");      //home button on right
            orientationLabel.text! = "My orientation is landscapeLeft";
           
        case .landscapeRight:
            print("landscapeRight");     //home button on left
            orientationLabel.text! = "My orientation is landscapeRight";
        case .faceUp:
            print("faceUp");             //screen facing upwards
            orientationLabel.text! = "My orientation is faceUp";
        case .faceDown:
            print("faceDown");           //screen facing downwards
            orientationLabel.text! = "My orientation is faceDown";
        default:
            print("illegal orientation \(orientation)"); //none of the above
            orientationLabel.text! = "illegal orientation \(orientation)";
        }
    }
    
    @objc func orientationFrames(_ notification: NSNotification) {
    
        let orientation: UIDeviceOrientation = UIDevice.current.orientation;

        switch orientation {
        case .unknown:
            print("unknown");
          
        case .portrait:
            print("portrait");
            //home button at bottom
            
            orientationLabel.frame = CGRect(x: 20, y: 313, width: 367, height: 58)
            orientationButtonOutlet.frame = CGRect(x: 20, y: 413, width: 367, height: 58)
        case .portraitUpsideDown:
            print("portraitUpsideDown");
            //home button at top
            
            orientationLabel.frame = CGRect(x: 313, y: 20, width: 367, height: 58)
            orientationButtonOutlet.frame = CGRect(x: 313, y: 90, width: 367, height: 58)
           
        case .landscapeLeft:
            print("landscapeLeft");
            //home button on right
            
            orientationLabel.frame = CGRect(x: 313, y: 20, width: 367, height: 58)
            orientationButtonOutlet.frame = CGRect(x: 313, y: 100, width: 367, height: 58)
          
        case .landscapeRight:
            print("landscapeRight");
            //home button on left
            
            orientationLabel.frame = CGRect(x: 313, y: 20, width: 367, height: 58)
            orientationButtonOutlet.frame = CGRect(x: 313, y: 100, width: 367, height: 58)
           
        case .faceUp:
            print("faceUp");
            //screen facing upwards
            
        case .faceDown:
            print("faceDown");
            //screen facing downwards
         
        default:
            print("illegal orientation \(orientation)"); //none of the above
        
        }
    }

    
    @IBAction func orientationButton(_ sender: Any) {
       orientationChanged()
    }
    
    

}

