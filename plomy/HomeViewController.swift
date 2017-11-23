//
//  HomeViewController.swift
//  plomy
//
//  Created by Atsuo Yonehara on 2017/09/20.
//  Copyright © 2017年 ren. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var articles: [String] = []
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewControllerに貼り付けたtableViewをこのviewControllerのtableViewにするための処理
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.estimatedRowHeight = 200
        homeTableView.rowHeight = UITableViewAutomaticDimension
        
        self.homeTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "home_cell")
        articles = [
            "私わたくしはその人を常に先生と呼んでいた。だからここでもただ先生と書くだけで本名は打ち明けない。",
            "この書の世に出づるにいたりたるは、函館にある秦慶治氏、及び信濃にある神津猛氏のたまものなり。労作終るの日にあたりて、このものがたりを二人の恩人のまへにさゝぐ。",
            "散文に二種あると考へてゐるが、一を小説、他を作文とかりに言つておく。",
            "機敏な晩熟児といふべき此の男が、現に存するのだから僕は機敏な晩熟児が如何にして存るママかその様を語らうと思ふ。",
        ]
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
        //let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostTableViewCell
        
        cell.username.text = indexPath.row.description + "番目のcell"
        cell.message.text = articles[indexPath.row]
        cell.layoutIfNeeded()
        return cell
    } 
}
