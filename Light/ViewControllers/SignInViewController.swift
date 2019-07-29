//
//  SignInViewController.swift
//  Light
//
//  Created by Kemar Galloway on 7/16/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "signInToTabbarVC", sender: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signUpButtonTapped(_ sender: Any) {
        print("sign up")
        
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier:
            "RegisterUserViewController") as! RegisterUserViewController
        
        self.present(registerViewController, animated: true)
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
        print("sign in")
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            self.performSegue(withIdentifier: "signInToTabbarVC", sender: nil)
        })
    }
}
