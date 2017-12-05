//
//  LoginViewController.swift
//  plomy
//
//  Created by ren on 2017/11/28.
//  Copyright © 2017年 ren. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class LoginViewController: UIViewController {
    
    
    override func viewDidLoad() {
        let loginButton = LoginButton(readPermissions: [.publicProfile])
        loginButton.center = view.center
        print("AccessToken is ")
        view.addSubview(loginButton)
        print(AccessToken.current)
        print(isLoggedInWithFacebook())
    }
    override func viewDidAppear(_ animated: Bool) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "homeView")
        if(isLoggedInWithFacebook()){
            present(nextView, animated: true, completion: nil)
            //self.performSegue(withIdentifier: "Tab Bar Controller", sender: self)
        }
    }
    func isLoggedInWithFacebook() -> Bool{
        let loggedIn = AccessToken.current != nil
        return loggedIn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
