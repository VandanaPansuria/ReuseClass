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

class ViewController: UIViewController, ReuseClassdelegate {
    var objCatList = [CatList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    func onCardClosedClick(_ Vcustomclass: ReuseClass) {
        print("Card close")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

