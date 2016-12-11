//
//  ViewController.swift
//  UIAlertController
//
//  Created by user on 16/12/11.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    var cancelAction = UIAlertAction(title:"取消",style:UIAlertActionStyle.cancel,handler:nil)
    var resetAction = UIAlertAction(title:"重置",style:UIAlertActionStyle.destructive,handler:nil)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: ALERT
    @IBAction func alert(_ sender: Any) {
        let alertViewController = UIAlertController(title: "提示", message: "小心有坑", preferredStyle: UIAlertControllerStyle.alert)
        alertViewController.addAction(resetAction)
        alertViewController.addAction(cancelAction)
        self.present(alertViewController,animated:true,completion:nil)
    }
    
    // MARK:TEXT
    @IBAction func alertText(_ sender: Any) {
        let alertTextViewController = UIAlertController(title: "登录", message: "请登录", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "确认", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            let login = (alertTextViewController.textFields?.first)! as UITextField
            let password = (alertTextViewController.textFields?.last)! as UITextField
            self.textLabel.text = "name:" + (login.text)!  + "password:" + (password.text)!
            
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextViewTextDidChange, object: nil)
        }
        okAction.isEnabled = false
        alertTextViewController.addAction(cancelAction)
        alertTextViewController.addAction(okAction)
        alertTextViewController.addTextField { (textField:UITextField) in
            textField.placeholder = "登录"
        }
        alertTextViewController.addTextField { (textField:UITextField) in
            textField.placeholder = "密码"
            textField.isSecureTextEntry = true
        }
        
        alertTextViewController.addTextField { (textField:UITextField) in
            NotificationCenter.default.addObserver(self, selector: #selector(self.alertTextFieldChange(notification:)), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        }
        
        self.present(alertTextViewController, animated: true, completion: nil)
    }
    
    func alertTextFieldChange(notification:NSNotification){
        let currentController = self.presentedViewController as! UIAlertController?
        if(currentController != nil){
            let login = (currentController?.textFields?.first)! as UITextField
            let okAction = (currentController?.actions.last)! as UIAlertAction
            okAction.isEnabled = (login.text?.characters.count)! > 2
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

