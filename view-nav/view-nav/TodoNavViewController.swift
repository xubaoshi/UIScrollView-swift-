//
//  TodoNavViewController.swift
//  view-nav
//
//  Created by user on 16/12/23.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit

class TodoNavViewController: UINavigationController {

    let todo = TodoViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.pushViewController(todo, animated: true)
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
