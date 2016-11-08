//
//  LoginViewController.swift
//  ReciBeeProject
//
//  Created by Chee Kok Ban on 7/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: AnyObject){
        

        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user, error) in
            
            if user != nil{
                self.performSegue(withIdentifier: "goToCreateRecipe", sender: nil)}
            
            }
        )
    }
}
