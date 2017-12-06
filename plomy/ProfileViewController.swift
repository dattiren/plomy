//
//  ProfileViewController.swift
//  plomy
//
//  Created by ren on 2017/08/22.
//  Copyright © 2017年 ren. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var followlabel: UILabel!
    @IBOutlet weak var followerlabel: UILabel!
    @IBOutlet weak var follow: UILabel!
    @IBOutlet weak var follower: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        followlabel.text = "フォロー"
        followerlabel.text = "フォロワー"
        // Do any additional setup after loading the view.
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
