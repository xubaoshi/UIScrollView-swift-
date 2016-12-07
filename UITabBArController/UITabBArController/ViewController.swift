//
//  ViewController.swift
//  UITabBarController
//
//  Created by user on 16/12/7.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    
    @IBOutlet weak var tab: UITabBar!
    var tabs = ["公开课","全栈课","设置"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewMain = MainViewController()
        let secondView = secondViewController()
        let thirdView = thirdViewController()
        viewMain.title = "main"
        secondView.title = "second"
        thirdView.title = "third"
        
        self.selectedIndex = 2
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
