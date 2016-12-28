//
//  HomeViewController.swift
//  view-nav
//
//  Created by user on 16/12/26.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class HomeViewController: SlideMenuController {
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.leftViewWidth = 360
    }
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "home-nav"){
            self.mainViewController = controller
        }
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "menu"){
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.dismiss(animated: true, completion: ({
            super.viewWillDisappear(true)
        }))
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
