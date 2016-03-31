//
//  ViewController.swift
//  Demo
//
//  Created by mac on 16/3/31.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class ViewController: ZWScrollTableViewCtrl {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLeftTableViewRefresh()
        self.setupRightTableViewRefresh()
        
        self.headerViewLeftBtn.setTitle("Button1", forState: .Normal)
        self.headerViewRightBtn.setTitle("Button2", forState: .Normal)
        
        self.leftTableView.networkReloadView?.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellID"
        
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        
        if tableView == self.leftTableView {
            cell?.textLabel?.text = "leftTableView"
        } else {
            cell?.textLabel?.text = "rightTableView"
        }
        
        return cell!
    }
    
    override func leftTableViewPullDownRefresh() {
        self.leftTableView.mj_header.beginRefreshing()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self.leftTableView.mj_header.endRefreshing()
        }
    }
    
    override func leftTableViewPullUpRefresh() {
        self.leftTableView.mj_footer.beginRefreshing()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self.leftTableView.mj_footer.endRefreshing()
        }
    }
    
    override func rightTableViewPullDownRefresh() {
        self.rightTableView.mj_header.beginRefreshing()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self.rightTableView.mj_header.endRefreshing()
        }
    }
    
    override func rightTableViewPullUpRefresh() {
        self.rightTableView.mj_footer.beginRefreshing()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self.rightTableView.mj_footer.endRefreshing()
        }
    }
    
    override func leftTableNetworkReloadDataAction() {
        self.leftTableView.networkReloadView?.hidden = true
         self.leftTableView.mj_header.beginRefreshing()
    }

}

