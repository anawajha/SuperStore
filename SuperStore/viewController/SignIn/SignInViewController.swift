//
//  ViewController.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/12/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordTextInput: UITextField!
    @IBOutlet weak var usernameTextInput: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextInput.delegate = self
        passwordTextInput.delegate = self
    
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func login(_ sender: Any) {
        if (!(usernameTextInput.text?.isEmpty ?? false) && !(passwordTextInput.text?.isEmpty ?? false)){
            signIn(auth: Login.init(username: "\(usernameTextInput.text!)", password: "\(passwordTextInput.text!)"))
        }else {
            Constants.Helpers.showAlert(controller: self, title: "Invalid username or password", message: "UserName and password should not be empty")
            print("UserName and password should not be empty")
        }
    }
    
    private func signIn(auth:Login){
        let hud = JGProgressHUD()
        hud.textLabel.text = "Signing in..."
        hud.show(in: self.view, animated: true)
        self.btnLogin.isEnabled = false
        self.btnLogin.isSpringLoaded = true
        
        Operations.login(userLogin: auth) { response, error in
            if error == nil {
                guard let res = response else {return}
                print("User token : \(res)")
                UserDefaults.standard.set(true, forKey: "isLogin")
                
                let c = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
                self.navigationController?.pushViewController(c, animated: true)
                hud.dismiss()
            }else{
                hud.dismiss()
                self.btnLogin.isEnabled = true
                self.btnLogin.isSpringLoaded = false
                 UserDefaults.standard.set(false, forKey: "isLogin")
                Constants.Helpers.showAlert(controller: self, title: "Login Failed", message: "Your username or password incorrect")
                print(error!)
            }
        }
    }
    

}

