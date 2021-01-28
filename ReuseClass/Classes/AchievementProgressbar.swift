//
//  AchievementProgressbar.swift
//  ReuseClass
//
//  Created by MacV on 27/01/21.
//

import Foundation
import UIKit

@IBDesignable
public class AchievementProgressbar: UIControl {

    var customTableView: UITableView
    public var vCategoryItem: [AchivementItem] = []
    public var tableCellHeight : CGFloat = 50
    public required init?(coder aDecoder: NSCoder) {
        customTableView = UITableView()
        super.init(coder: aDecoder)
        customTableView = UITableView(frame: CGRect(x: frame.origin.x, y: frame.origin.y + 40, width: frame.width, height: frame.height - 40), style: .plain)
        customTableView.backgroundColor = UIColor.lightGray
        customTableView.delegate = self
        customTableView.dataSource = self
        customTableView.showsVerticalScrollIndicator = false
        let bundle = Bundle(for: ReuseClass.self)
        let nib = UINib(nibName: "EarnPointsCell", bundle: bundle)
        customTableView.register(nib, forCellReuseIdentifier: "EarnPointsCell")
        self.addSubview(customTableView)
        self.customTableView.tableFooterView = UIView()
        VCustomFonts.loadFonts()
    }
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    open var objCategoryItem: [AchivementItem] = [] {
        didSet {
           self.vCategoryItem = objCategoryItem
        }
    }
    var vtableCellHeight : CGFloat = 50{
        didSet {
           self.tableCellHeight = vtableCellHeight
        }
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
    }
}
extension AchievementProgressbar: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return vCategoryItem.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(  withIdentifier: "EarnPointsCell",  for: indexPath) as! EarnPointsCell
        cell.lblItem.text = vCategoryItem[indexPath.row].itemname
        cell.emojiurl = vCategoryItem[indexPath.row].emoji
        cell.textcolor = UIColor(hexaRGB: vCategoryItem[indexPath.row].textColor!)
        cell.backgroundcolor = UIColor(hexaRGB: vCategoryItem[indexPath.row].backgroundColor!)
        cell.barColor =  UIColor(hexaRGB: vCategoryItem[indexPath.row].barColor!)
        cell.outlineColor = UIColor(hexaRGB: vCategoryItem[indexPath.row].outlineColor!)
        cell.setprogressValue = Float(vCategoryItem[indexPath.row].value ?? "0")!
        cell.setmaxprogressvalue = Float(vCategoryItem[indexPath.row].max ?? "0")!
        cell.progressConstraintHeight = tableCellHeight
        cell.selectionStyle = .none
        return cell
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableCellHeight
    }
}

public struct AchivementItem {
    public var itemname: String?
    public var emoji: String?
    public var max: String?
    public var value: String?
    public var outlineColor: String?
    public var barColor: String?
    public var backgroundColor: String?
    public var textColor: String?
    public init(
        itemname: String? = nil,
        emoji: String? = nil,
        max: String? = nil,
        value: String? = nil,
        outlineColor: String? = nil,
        barColor: String? = nil,
        backgroundColor: String? = nil,
        textColor: String? = nil) {
     
        self.itemname = itemname
        self.emoji = emoji
        self.max = max
        self.value = value
        self.outlineColor = outlineColor
        self.barColor = barColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}
extension UIColor {
    convenience init?(hexaRGB: String, alpha: CGFloat = 1) {
        var chars = Array(hexaRGB.hasPrefix("#") ? hexaRGB.dropFirst() : hexaRGB[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }
        case 6: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                alpha: alpha)
    }

    convenience init?(hexaRGBA: String) {
        var chars = Array(hexaRGBA.hasPrefix("#") ? hexaRGBA.dropFirst() : hexaRGBA[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars.append(contentsOf: ["F","F"])
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                alpha: .init(strtoul(String(chars[6...7]), nil, 16)) / 255)
    }

    convenience init?(hexaARGB: String) {
        var chars = Array(hexaARGB.hasPrefix("#") ? hexaARGB.dropFirst() : hexaARGB[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars.append(contentsOf: ["F","F"])
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[6...7]), nil, 16)) / 255,
                alpha: .init(strtoul(String(chars[0...1]), nil, 16)) / 255)
    }
}
