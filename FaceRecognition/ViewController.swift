//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Nigar Alaskarova on 19.05.24.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signedInClicked(_ sender: Any) {
        let authContext = LAContext()
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                }
            }
        }
    }
}

