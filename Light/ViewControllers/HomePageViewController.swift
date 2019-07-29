//
//  HomePageViewController.swift
//  Light
//
//  Created by Kemar Galloway on 7/16/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var userFullNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func signoutButtonTapped(_ sender: Any) {
        print("sign out")
    }
    @IBAction func loadMemberProfileButtonTapped(_ sender: Any) {
        print("load Member Profile Button Tapped")
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
