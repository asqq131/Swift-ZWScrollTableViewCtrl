//
//  BaseScrollTableViewCtrl.swift
//  efx
//
//  Created by mac on 16/3/24.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

let kScreenSize = UIScreen.mainScreen().applicationFrame.size

class ZWScrollTableViewCtrl: UIViewController, UITableViewDelegate, UITableViewDataSource {
    weak var scrollView: UIScrollView!
    weak var leftTableView : UITableView!
    weak var rightTableView : UITableView!
    weak var headerView: UIView!
    weak var headerViewLeftBtn: UIButton!
    weak var headerViewRightBtn: UIButton!
    weak var selectedLine: UILabel!
    
    func kColorWithRed(red redcolor:Float, green greenColor:Float, blue blueColor:Float, alpha _alpha:Float) -> UIColor {
        return UIColor.init(colorLiteralRed: redcolor/255.0, green: greenColor/255.0, blue: blueColor/255.0, alpha: _alpha)
    }
    
    lazy var leftTableNetworkReloadView: UIView = {
        let view = UIView(frame: CGRectMake(0, 0, kScreenSize.width, CGRectGetHeight(self.leftTableView.frame)))
        view.backgroundColor = UIColor.whiteColor()
        view.hidden = true
        self.leftTableView.addSubview(view)
        self.leftTableView.networkReloadView = view
        
        let icon = UIImage(named: "msg_network")
        let verifyImageView = UIImageView(frame: CGRectMake(kScreenSize.width/2 - icon!.size.width/2, kScreenSize.height / 2 - UIView.fixRatioHeightByIphone6(icon!.size.height * 2), icon!.size.width, icon!.size.height))
        verifyImageView.image = icon
        verifyImageView.userInteractionEnabled = false
        view.addSubview(verifyImageView)
        
        let tipLabel = UILabel(frame: CGRectMake(0, CGRectGetMaxY(verifyImageView.frame) + 25, kScreenSize.width, 20))
        tipLabel.text = "当前网络不太顺畅"
        tipLabel.textAlignment = .Center
        tipLabel.textColor = self.kColorWithRed(red: 153, green: 153, blue: 153, alpha: 1)
        tipLabel.font = UIFont.systemFontOfSize(15)
        view.addSubview(tipLabel)
        
        let reloadButton = UIButton(type: .Custom)
        reloadButton.frame = CGRectMake((kScreenSize.width - 112) / 2, CGRectGetMaxY(tipLabel.frame) + 13, 112, 32)
        reloadButton.setImage(UIImage(named:"msg_ic_loading"), forState:.Normal)
        reloadButton.setImage(UIImage(named:"msg_ic_loading_sel"), forState:.Highlighted)
        reloadButton.addTarget(self, action:Selector("leftTableNetworkReloadDataAction"), forControlEvents:.TouchUpInside)
        view.addSubview(reloadButton)
        
        return view
    }()
    
    lazy var rightTableNetworkReloadView: UIView = {
        let view = UIView(frame: CGRectMake(0, 0, kScreenSize.width, CGRectGetHeight(self.rightTableView.frame)))
        view.backgroundColor = UIColor.whiteColor()
        view.hidden = true
        self.rightTableView.addSubview(view)
        self.rightTableView.networkReloadView = view
        
        let icon = UIImage(named: "msg_network")
        let verifyImageView = UIImageView(frame: CGRectMake(kScreenSize.width/2 - icon!.size.width/2, kScreenSize.height / 2 - UIView.fixRatioHeightByIphone6(icon!.size.height * 2), icon!.size.width, icon!.size.height))
        verifyImageView.image = icon
        verifyImageView.userInteractionEnabled = false
        view.addSubview(verifyImageView)
        
        let tipLabel = UILabel(frame: CGRectMake(0, CGRectGetMaxY(verifyImageView.frame) + 25, kScreenSize.width, 20))
        tipLabel.text = "当前网络不太顺畅"
        tipLabel.textAlignment = .Center
        tipLabel.textColor = self.kColorWithRed(red: 153, green: 153, blue: 153, alpha: 1)
        tipLabel.font = UIFont.systemFontOfSize(15)
        view.addSubview(tipLabel)
        
        let reloadButton = UIButton(type: .Custom)
        reloadButton.frame = CGRectMake((kScreenSize.width - 112) / 2, CGRectGetMaxY(tipLabel.frame) + 13, 112, 32)
        reloadButton.setImage(UIImage(named:"msg_ic_loading"), forState:.Normal)
        reloadButton.setImage(UIImage(named:"msg_ic_loading_sel"), forState:.Highlighted)
        reloadButton.addTarget(self, action:Selector("rightTableNetworkReloadDataAction"), forControlEvents:.TouchUpInside)
        view.addSubview(reloadButton)
        
        return view
    }()
    
    lazy var leftTableEmptyDataView: UIView = {
        let view = UIView(frame: CGRectMake(0, 0, kScreenSize.width, CGRectGetHeight(self.leftTableView.frame)))
        view.userInteractionEnabled = false
        view.hidden = true
        self.leftTableView.addSubview(view)
        self.leftTableView.emptyDataView = view
        
        let icon = UIImage(named:"msg_ic_data")
        let verifyImageView = UIImageView(frame: CGRectMake(kScreenSize.width/2 - icon!.size.width/2, kScreenSize.height / 2 - UIView.fixRatioHeightByIphone6(icon!.size.height * 2), icon!.size.width, icon!.size.height))
        verifyImageView.image = icon
        view.addSubview(verifyImageView)
        
        let tipLabel = UILabel(frame: CGRectMake(0, CGRectGetMaxY(verifyImageView.frame), kScreenSize.width, 20))
        tipLabel.text = "当前没有更多的消息哦!"
        tipLabel.textAlignment = .Center
        tipLabel.textColor = self.kColorWithRed(red: 153, green: 153, blue: 153, alpha: 1)
        tipLabel.font = UIFont.systemFontOfSize(15)
        view.addSubview(tipLabel)
        
        return view
    }()
    
    lazy var rightTableEmptyDataView: UIView = {
        let view = UIView(frame: CGRectMake(0, 0, kScreenSize.width, CGRectGetHeight(self.rightTableView.frame)))
        view.userInteractionEnabled = false
        view.hidden = true
        self.rightTableView.addSubview(view)
        self.rightTableView.emptyDataView = view
        
        let icon = UIImage(named:"msg_ic_data")
        let verifyImageView = UIImageView(frame: CGRectMake(kScreenSize.width/2 - icon!.size.width/2, kScreenSize.height / 2 - UIView.fixRatioHeightByIphone6(icon!.size.height * 2), icon!.size.width, icon!.size.height))
        verifyImageView.image = icon
        view.addSubview(verifyImageView)
        
        let tipLabel = UILabel(frame: CGRectMake(0, CGRectGetMaxY(verifyImageView.frame), kScreenSize.width, 20))
        tipLabel.text = "当前没有更多的消息哦!"
        tipLabel.textAlignment = .Center
        tipLabel.textColor = self.kColorWithRed(red: 153, green: 153, blue: 153, alpha: 1)
        tipLabel.font = UIFont.systemFontOfSize(15)
        view.addSubview(tipLabel)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseSetupGUI()
        baseSetupTableHelperView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func baseSetupGUI() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        let headerView = UIView(frame: CGRectMake(0, 64, kScreenSize.width, 44))
        headerView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(headerView)
        self.headerView = headerView
        
        let headerViewLeftBtn = UIButton(type: .Custom)
        headerViewLeftBtn.frame = CGRectMake(0, 0, CGRectGetWidth(headerView.frame) / 2, CGRectGetHeight(headerView.frame) - 1.0)
        headerViewLeftBtn.backgroundColor = UIColor.whiteColor()
        headerViewLeftBtn.setTitleColor(kColorWithRed(red: 51, green: 51, blue: 51, alpha: 1), forState: .Normal)
        headerViewLeftBtn.setTitleColor(kColorWithRed(red: 54, green: 201, blue: 251, alpha: 1), forState: .Selected)
        headerViewLeftBtn.titleLabel?.font = UIFont.systemFontOfSize(16)
        headerViewLeftBtn.setTitle("leftBtn", forState: .Normal)
        headerViewLeftBtn.selected = true
        headerViewLeftBtn.addTarget(self, action: Selector("headerLeftBtnAction:"), forControlEvents: .TouchUpInside)
        headerView.addSubview(headerViewLeftBtn)
        self.headerViewLeftBtn = headerViewLeftBtn
        
        let headerViewRightBtn = UIButton(type: .Custom)
        headerViewRightBtn.frame = CGRectMake(CGRectGetMaxX(headerViewLeftBtn.frame), 0, CGRectGetWidth(headerView.frame) / 2, CGRectGetHeight(headerView.frame) - 1.0)
        headerViewRightBtn.backgroundColor = UIColor.whiteColor()
        headerViewRightBtn.setTitleColor(kColorWithRed(red: 51, green: 51, blue: 51, alpha: 1), forState: .Normal)
        headerViewRightBtn.setTitleColor(kColorWithRed(red: 54, green: 201, blue: 251, alpha: 1), forState: .Selected)
        headerViewRightBtn.setTitle("rightBtn", forState: .Normal)
        headerViewRightBtn.titleLabel?.font = UIFont.systemFontOfSize(16)
        headerViewRightBtn.addTarget(self, action: Selector("headerRightBtnAction:"), forControlEvents: .TouchUpInside)
        headerView.addSubview(headerViewRightBtn)
        self.headerViewRightBtn = headerViewRightBtn
        
        let line1 = UILabel(frame: CGRectMake(CGRectGetWidth(headerView.frame) / 2, 10, 0.5, CGRectGetHeight(headerView.frame) - 20))
        line1.backgroundColor = kColorWithRed(red: 232, green: 232, blue: 232, alpha: 1)
        headerView.addSubview(line1)
        
        let line2 = UILabel(frame: CGRectMake(0, CGRectGetHeight(headerView.frame) - 0.5, CGRectGetWidth(headerView.frame), 0.5))
        line2.backgroundColor = kColorWithRed(red: 232, green: 232, blue: 232, alpha: 1)
        headerView.addSubview(line2)
        
        let selectedLine = UILabel(frame: CGRectMake(0, CGRectGetHeight(headerView.frame) - 2.0, CGRectGetWidth(headerView.frame) / 2, 2.0))
        selectedLine.backgroundColor = kColorWithRed(red: 54, green: 201, blue: 251, alpha: 1)
        headerView.addSubview(selectedLine)
        self.selectedLine = selectedLine
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        let scrollView = UIScrollView(frame: CGRectMake(0, CGRectGetMaxY(headerView.frame), kScreenSize.width, kScreenSize.height - CGRectGetHeight(headerView.frame) - 44))
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.pagingEnabled = true
        scrollView.contentSize = CGSizeMake(kScreenSize.width*2, CGRectGetHeight(scrollView.frame))
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        self.scrollView = scrollView
        
        let leftTableView: UITableView = UITableView(frame: CGRectMake(0, 0, kScreenSize.width, CGRectGetHeight(scrollView.frame)))
        leftTableView.tableFooterView = UIView()
        leftTableView.delegate = self
        leftTableView.dataSource = self
        self.leftTableView = leftTableView
        self.scrollView.addSubview(self.leftTableView)
        
        let rightTableView: UITableView = UITableView(frame: CGRectMake(kScreenSize.width, 0, kScreenSize.width, CGRectGetHeight(scrollView.frame)))
        rightTableView.tableFooterView = UIView()
        rightTableView.delegate = self
        rightTableView.dataSource = self
        self.rightTableView = rightTableView
        self.scrollView.addSubview(self.rightTableView)
    }
    
    func baseSetupTableHelperView() {
        self.leftTableView.emptyDataView = self.leftTableEmptyDataView
        self.leftTableView.networkReloadView = self.leftTableNetworkReloadView
        self.rightTableView.emptyDataView = self.rightTableEmptyDataView
        self.rightTableView.networkReloadView = self.rightTableNetworkReloadView
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellID"
        
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        
        return cell!
    }
    
    func setupLeftTableViewPullDownRefresh() {
        let refreshHeader = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: Selector("leftTableViewPullDownRefresh"))
        self.leftTableView.mj_header = refreshHeader
    }
    
    func setupLeftTableViewPullUpRefresh() {
        let refreshFooter = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: Selector("leftTableViewPullUpRefresh"))
        refreshFooter.automaticallyHidden = true
        self.leftTableView.mj_footer = refreshFooter
    }
    
    func setupRightTableViewPullDownRefresh() {
        let refreshHeader = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: Selector("rightTableViewPullDownRefresh"))
        self.rightTableView.mj_header = refreshHeader
    }
    
    func setupRightTableViewPullUpRefresh() {
        let refreshFooter = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: Selector("rightTableViewPullUpRefresh"))
        refreshFooter.automaticallyHidden = true
        self.rightTableView.mj_footer = refreshFooter
    }
    
    func setupLeftTableViewRefresh() {
        setupLeftTableViewPullUpRefresh()
        setupLeftTableViewPullDownRefresh()
    }
    
    func setupRightTableViewRefresh() {
        setupRightTableViewPullUpRefresh()
        setupRightTableViewPullDownRefresh()
    }
    
    func leftTableViewPullUpRefresh() {
        print("leftTableViewPullUpRefresh by BaseScrollTableViewCtrl")
    }
    
    func leftTableViewPullDownRefresh() {
        print("leftTableViewPullDownRefresh by BaseScrollTableViewCtrl")
    }
    
    func rightTableViewPullUpRefresh() {
        print("rightTableViewPullUpRefresh by BaseScrollTableViewCtrl")
    }
    
    func rightTableViewPullDownRefresh() {
        print("rightTableViewPullDownRefresh by BaseScrollTableViewCtrl")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView != self.scrollView { return }
        
        var rect = self.selectedLine.frame;
        rect.origin.x = scrollView.contentOffset.x / 2;
        self.selectedLine.frame = rect;
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView != self.scrollView { return }
        
        self.headerViewLeftBtn.selected = scrollView.contentOffset.x == 0
        self.headerViewRightBtn.selected = !self.headerViewLeftBtn.selected
    }
    
    func headerLeftBtnAction(sender: UIButton) {
        if sender.selected { return }
        
        sender.selected = true
        self.headerViewRightBtn.selected = false
        scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    
    func headerRightBtnAction(sender: UIButton) {
        if sender.selected { return }
        
        sender.selected = true
        self.headerViewLeftBtn.selected = false
        scrollView.setContentOffset(CGPointMake(kScreenSize.width, 0), animated: true)
    }
    
    func leftTableNetworkReloadDataAction() {
        print("leftTableNetworkReloadDataAction by BaseScrollTableViewCtrl")
    }
    
    func rightTableNetworkReloadDataAction() {
        print("rightTableNetworkReloadDataAction by BaseScrollTableViewCtrl")
    }
    
}
