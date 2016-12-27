//
//  tabViewController.swift
//  view-nav
//
//  Created by user on 16/12/21.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit
import FontAwesome_swift

class TabViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attributes = [NSFontAttributeName: UIFont.fontAwesome(ofSize: 25)] as [String: Any]
        
        self.tabBar.items?[0].setTitleTextAttributes(attributes, for: .normal)
        self.tabBar.items?[0].title = String.fontAwesomeIcon(name: .home)
        self.tabBar.items?[1].setTitleTextAttributes(attributes, for: .normal)
        self.tabBar.items?[1].title = String.fontAwesomeIcon(name: .diamond)
        self.tabBar.items?[2].setTitleTextAttributes(attributes, for: .normal)
        self.tabBar.items?[2].title = String.fontAwesomeIcon(name: .github)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("tab chnaged")
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
