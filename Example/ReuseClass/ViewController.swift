//
//  ViewController.swift
//  ReuseClass
//
//  Created by vandanapansuria on 01/27/2021.
//  Copyright (c) 2021 vandanapansuria. All rights reserved.
//

import UIKit
import ReuseClass

struct CatList {
    var emoji: String
    var name: String
    var avgPercent: String
    var youPercent: String
    var monthlyOverSpendDollar: String
}
struct CategoryList {
    var emoji: String
    var name: String
    var max: String
    var value: String
    var outlineColor: String
    var barColor: String
    var backgroundColor: String
    var textColor: String
}

class ViewController: UIViewController {
    var objCatList = [CatList]()
    var objCategoryList = [CategoryList]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Category setup
    @IBOutlet weak var customTableView: ReuseClass! {
        didSet {
            customTableView.delegate = self
            customTableView.vCategoryItem = vCategoryItem
            customTableView.isAdvisorVisible = false
            //customTableView.tableCellHeight = 50 //set height of row, default height is 50
        }
    }
    lazy var vCategoryItem: [CategoryItem] = {
        setUpCategory()
        let slices = objCatList.map({CategoryItem.init(itemname: $0.name , emoji: $0.emoji, avgPercent: $0.avgPercent, youPercent: $0.youPercent, monthlyOverSpendDollar: $0.monthlyOverSpendDollar)})
        return slices
    }()
    func setUpCategory () {
       let Itemone = CatList(emoji: "https://dl.dropboxusercontent.com/s/grmetj2iixvz253/Group%201320.png", name: "Restaurent", avgPercent: "0.26%", youPercent: "0.36%", monthlyOverSpendDollar: "76")
       let Itemtwo = CatList(emoji: "https://dl.dropboxusercontent.com/s/rx8rh1uxhxrawx9/Group%201669.png", name: "Clothing", avgPercent: "0.27%", youPercent: "0.37%", monthlyOverSpendDollar: "76")
       let Itemthree = CatList(emoji: "https://dl.dropboxusercontent.com/s/igoyutvhcf5hgdr/Group%201670.png", name: "Subscription", avgPercent: "0.28%", youPercent: "0.38%", monthlyOverSpendDollar: "76")
       objCatList.append(Itemone)
       objCatList.append(Itemtwo)
       objCatList.append(Itemthree)
   }
    
    //Achievements
    @IBOutlet weak var achivementTableView: AchievementProgressbar! {
        didSet {
            achivementTableView.vCategoryItem = vAchivementCategory
            //achivementTableView.tableCellHeight = 50 //set height of row, default height is 50
        }
    }
    lazy var vAchivementCategory: [AchivementItem] = {
        setUpachievementCategory()
        let objvAchivementCategory = objCategoryList.map({AchivementItem.init(itemname: $0.name, emoji: $0.emoji, max: $0.max, value: $0.value, outlineColor: $0.outlineColor, barColor: $0.barColor, backgroundColor: $0.backgroundColor, textColor: $0.textColor)})
        return objvAchivementCategory
    }()
    func setUpachievementCategory () {
        let Itemone = CategoryList(emoji: "https://dl.dropboxusercontent.com/s/zrw9oemgnp14afi/Balance%20%240.png", name: "Watch 30 ads + 100", max: "70", value: "35", outlineColor: "#2A3137", barColor:"#FDAEB6", backgroundColor: "#040D14", textColor: "#FFFFFF")
       let Itemtwo = CategoryList(emoji: "https://dl.dropboxusercontent.com/s/zrw9oemgnp14afi/Balance%20%240.png", name: "Scan 20 Reciept + 200", max: "70", value: "30", outlineColor: "#2A3137", barColor:"#FDAEB6", backgroundColor: "#040D14", textColor: "#FFFFFF")
        objCategoryList.append(Itemone)
        objCategoryList.append(Itemtwo)
   }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- ReuseClassdelegate
extension ViewController : ReuseClassdelegate{
    func onCardClosedClick(_ Vcustomclass: ReuseClass) {
        print("Card close")
    }
}
