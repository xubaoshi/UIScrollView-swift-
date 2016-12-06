//
//  ViewController.swift
//  dynamic-load
//
//  Created by user on 16/12/6.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    // 数据集合
    var dataArray = [String]()
    // 提示数据加载视图
    var loadMoreView:UIView?
    // 计数器
    var timer:Timer!
    // 是否允许加载新数据
    var loadMoreEnable = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.setupInfiniteScrollView()
        self.tableView.tableFooterView = self.loadMoreView
        
        loadMore()
    }
    
    // MARK:tableView dele
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        if(loadMoreEnable && indexPath.row == self.dataArray.count - 1){
            loadMore()
        }
        return cell
        
    }
    // private fn
    func loadMore() {
        print("我在玩命的加载！！！")
        loadMoreEnable = false
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.timeOut), userInfo:nil, repeats: true)
    }
    
    func setupInfiniteScrollView(){
        self.loadMoreView = UIView(frame:CGRect(x:0,y:self.tableView.contentSize.height,width:self.tableView.contentSize.width,height:60))
        self.loadMoreView!.autoresizingMask = UIViewAutoresizing.flexibleWidth
        self.loadMoreView!.backgroundColor = UIColor.orange
        
        // 添加进度条
        let activityViewIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityViewIndicator.color = UIColor.darkGray
        let indicatorx = self.loadMoreView!.frame.size.width/2 - activityViewIndicator.frame.width/2
        let indicaroty = self.loadMoreView!.frame.height/2 - activityViewIndicator.frame.height/2
        activityViewIndicator.frame = CGRect(x:indicatorx,y:indicaroty,width:activityViewIndicator.frame.width,height:activityViewIndicator.frame.height)
        activityViewIndicator.startAnimating()
        self.loadMoreView?.addSubview(activityViewIndicator)
    }
    
    func timeOut(){
        let start = self.dataArray.count + 1
        for i in start..<start+20 {
            self.dataArray.append("标题\(i)")
        }
        self.tableView.reloadData()
        loadMoreEnable = true
        timer.invalidate()
        timer = nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

