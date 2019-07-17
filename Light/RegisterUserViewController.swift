//
//  RegisterUserViewController.swift
//  Light
//
//  Created by Kemar Galloway on 7/16/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        print("cancelled")
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func signupButtonTapped(_ sender: Any) {
        print("sign up")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}