
//
//  ReuseClass.swift
//  ReuseClass
//
//  Created by vandanapansuria on 01/27/2021.
//  Copyright (c) 2021 vandanapansuria. All rights reserved.
//


import Foundation
import UIKit

public protocol ReuseClassdelegate{
    func onCardClosedClick(_ ReuseClass : ReuseClass)
}

@IBDesignable
public class ReuseClass: UIControl {
    
    public var delegate: ReuseClassdelegate?
    var customTableView: UITableView
    private var alertdetection: Bool = false
    public var vCategoryItem: [CategoryItem] = []
    public var tableCellHeight : CGFloat = 50
    public required init?(coder aDecoder: NSCoder) {
        customTableView = UITableView()
        super.init(coder: aDecoder)
        customTableView = UITableView(frame: CGRect(x: frame.origin.x, y: frame.origin.y + 40, width: frame.width, height: frame.height - 40), style: .plain)
        customTableView.delegate = self
        customTableView.dataSource = self
        customTableView.showsVerticalScrollIndicator = false
        let bundle = Bundle(for: ReuseClass.self)
        let nib = UINib(nibName: "CategoryListCell", bundle: bundle)
        customTableView.register(nib, forCellReuseIdentifier: "CategoryListCell")
        self.addSubview(customTableView)
        self.customTableView.tableFooterView = UIView()
        VCustomFonts.loadFonts()
    }
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    open var objCategoryItem: [CategoryItem] = [] {
        didSet {
           self.vCategoryItem = objCategoryItem
        }
    }
    var vtableCellHeight : CGFloat = 50{
        didSet {
           self.tableCellHeight = vtableCellHeight
        }
    }
    func footerSetup(){
        if alertdetection == true{
            let advisorView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 120))
            advisorView.backgroundColor = #colorLiteral(red: 0.1232384071, green: 0.1336408854, blue: 0.1420524716, alpha: 1)
            
            let bundle = Bundle(for: ReuseClass.self)
            let imageView = UIImageView(image: UIImage(named: "Imagecard", in: bundle, compatibleWith: nil))
            imageView.frame = CGRect(x: 10, y: 10, width: advisorView.frame.size.width - 20, height: advisorView.frame.size.height - 20)
            advisorView.addSubview(imageView)
            
            let btndismiss = UIButton(frame: CGRect(x: frame.size.width - 35, y: 12, width: 23, height: 23))
            btndismiss.setImage(UIImage(named: "dismis", in: bundle, compatibleWith: nil), for: .normal)
            btndismiss.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
            advisorView.addSubview(btndismiss)
            
            customTableView.tableFooterView = advisorView
        }
    }
    @objc func dismissAction(_ sender: UIButton!) {
        self.customTableView.tableFooterView = UIView()
        self.delegate?.onCardClosedClick(self)
    }
    func registerClass(cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        customTableView.register(cellClass, forCellReuseIdentifier: identifier)
    }

    func dequeueReusableCellWithIdentifier(identifier: String) -> UITableViewCell? {
        return customTableView.dequeueReusableCell(withIdentifier: identifier)
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        customTableView.frame = self.bounds
        self.customTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        customTableView.rowHeight = tableCellHeight
        self.addSubview(customTableView)
        footerSetup()
    }
}
extension ReuseClass: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return vCategoryItem.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(  withIdentifier: "CategoryListCell",  for: indexPath) as! CategoryListCell
        cell.lblItem.text = vCategoryItem[indexPath.row].itemname
        cell.lblAvg.text = vCategoryItem[indexPath.row].avgPercent
        cell.lblYou.text = vCategoryItem[indexPath.row].youPercent
        cell.emojiurl = vCategoryItem[indexPath.row].emoji
        cell.selectionStyle = .none
        return cell
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableCellHeight
    }
}

public struct CategoryItem {
    public var itemname: String?
    public var emoji: String?
    public var avgPercent: String?
    public var youPercent: String?
    public var monthlyOverSpendDollar: String?
    public init(
        itemname: String? = nil,
        emoji: String? = nil,
        avgPercent: String? = nil,
        youPercent: String? = nil,
        monthlyOverSpendDollar: String? = nil) {
     
        self.itemname = itemname
        self.emoji = emoji
        self.avgPercent = avgPercent
        self.youPercent = youPercent
        self.monthlyOverSpendDollar = monthlyOverSpendDollar
    }
}

public extension ReuseClass{
@IBInspectable var isAdvisorVisible: Bool {
    get {
        return alertdetection
    }
    set {
        alertdetection = newValue
    }
}
}
