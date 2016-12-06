//
//  ViewController.swift
//  ScrollViews
//
//  Created by user on 16/11/22.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = UIScrollView()
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 3
        scrollView.delegate = self
        scrollView.frame = self.view.bounds
        let imageView = UIImageView(image:UIImage(named:"photo1.png"))
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
    }

    // MARK: scrollView Event
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for subView :AnyObject in scrollView.subviews {
            if subView.isKind(of: UIImageView.self){
                return subView as? UIView
            }
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

