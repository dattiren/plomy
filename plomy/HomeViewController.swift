//
//  HomeViewController.swift
//  plomy
//
//  Created by Atsuo Yonehara on 2017/09/20.
//  Copyright © 2017年 ren. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIApplicationDelegate{

    var articles: [String] = []
    var ref: DatabaseReference!
    var snap: DataSnapshot!
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var contents: [String] = []
        //realtime Databaseの初期化
        ref = Database.database().reference()
        ref.child((AccessToken.current?.userId)!).observe(.value, with: {(snapshot) in
            if snapshot.childrenCount > 0{
                self.articles.removeAll()
                for article in snapshot.children.allObjects as! [DataSnapshot]{
                    let articleObject = article.value as? [String: AnyObject]
                    //let userID = articleObject?["user"]
                    let content = articleObject?["content"] as! String
                    //let timestamp = articleObject?["date"]
                    self.articles.append(content)
                }
//                print(self.articles)
                self.homeTableView.reloadData()
            }
        })
        
        //viewControllerに貼り付けたtableViewをこのviewControllerのtableViewにするための処理
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.estimatedRowHeight = 200
        homeTableView.rowHeight = UITableViewAutomaticDimension
        self.homeTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "home_cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "home_cell", for: indexPath) as! TableViewCell
        cell.username.text = indexPath.row.description + "番目のcell"
        cell.message.text = articles[indexPath.row]
        cell.layoutIfNeeded()
        return cell
    }

}
