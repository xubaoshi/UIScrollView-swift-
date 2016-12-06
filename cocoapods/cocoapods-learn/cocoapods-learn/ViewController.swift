//
//  ViewController.swift
//  cocoapods-learn
//
//  Created by user on 16/12/6.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
        redView.snp.makeConstraints{ (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
