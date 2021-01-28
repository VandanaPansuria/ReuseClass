# ReuseClass

[![CI Status](https://img.shields.io/travis/vandanapansuria/ReuseClass.svg?style=flat)](https://travis-ci.org/vandanapansuria/ReuseClass)
[![Version](https://img.shields.io/cocoapods/v/ReuseClass.svg?style=flat)](https://cocoapods.org/pods/ReuseClass)
[![License](https://img.shields.io/cocoapods/l/ReuseClass.svg?style=flat)](https://cocoapods.org/pods/ReuseClass)
[![Platform](https://img.shields.io/cocoapods/p/ReuseClass.svg?style=flat)](https://cocoapods.org/pods/ReuseClass)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 10.0+
- Xcode 11+
- Swift 5.0+

## Installation

ReuseClass is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ReuseClass'
```

# Initializing and Usage

## Integrate

Import ReuseClass into ViewController.swift

Then click on the UIView you added and go to the Identity Inspector. Set the class to ReuseClass.

Initialize ReuseClass within
```swift
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
   
}
```

Now connect these to outlets. and connect it to an Outlet named customTableView for Spend category list & card and achivementTableView for Achievement progressbar.

We want to make the View Controller implement the ReuseClassdelegate protocol, At this point ViewController.Swift should look like the following:

```swift
//MARK:- ReuseClassdelegate
extension ViewController : ReuseClassdelegate{
    func onCardClosedClick(_ Vcustomclass: ReuseClass) {
        print("Card close")
    }
}
```

## Author

vandanapansuria, vandanapansuria@gmail..com

## License

ReuseClass is available under the MIT license. See the LICENSE file for more info.
# ReuseClass
