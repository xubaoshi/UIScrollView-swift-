//
//  ViewController.swift
//  ScrollViews
//
//  Created by user on 16/11/22.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
    
    @IBOutlet var scrollView:UIScrollView!
    var imageView:UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let image = UIImage(named:"photo1.png")
        imageView = UIImageView(image:image)
        imageView.frame = CGRect(origin:CGPoint(x:0,y:0),size:(image?.size)!)
        scrollView.addSubview(imageView)
        
        // 2
        scrollView.contentSize = (image?.size)!
        
        // 3
        let doubleTapRecognizer = UITapGestureRecognizer(target:self,action:Selector(("scrollViewDoubleTapped:")))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTapsRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        
        // 4
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height/scrollView.contentSize.height
        let minScale = min(scaleWidth,scaleHeight)
        scrollView.minimumZoomScale = minScale
        
        // 5
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale
        
        // 6
        centerScrollViewContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

