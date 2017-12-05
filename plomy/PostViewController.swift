//
//  PostViewController.swift
//  plomy
//
//  Created by ren on 2017/08/22.
//  Copyright © 2017年 ren. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore

class PostViewController: UIViewController {
    var ref = Database.database().reference()
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var icon: CircleImageView!
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var postButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    @IBAction func post(_ sender: Any) {
        create()
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    func create(){
        guard let text = message.text else{return}
    self.ref.child((AccessToken.current?.userId)!).childByAutoId().setValue(["user": (AccessToken.current?.userId)!, "content": text, "date": ServerValue.timestamp()])
    }
}
