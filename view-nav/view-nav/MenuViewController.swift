//
//  MenuViewController.swift
//  view-nav
//
//  Created by user on 16/12/27.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var menuTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuTable.delegate = self
        self.menuTable.dataSource = self
    }
    
    // MARK:tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.imageView?.image
         = UIImage.fontAwesomeIcon(name: .user, textColor: UIColor.white, size: CGSize(width: 50, height: 50))
        cell.textLabel?.text = "xubaoshi@made-in-china.com"
        return cell
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
