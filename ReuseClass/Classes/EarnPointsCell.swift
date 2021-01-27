//
//  EarnPointsCell.swift
//  CategoryComponent
//
//  Created by MacV on 25/01/21.
//

import UIKit

class EarnPointsCell: UITableViewCell {

    @IBOutlet weak var earnProgressbar: UIProgressView!
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var imgitem: AsyncImage!
    var progressValue : Float = 0
    
    @IBOutlet weak var progressHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        progressConstraintHeight = 40
        earnProgressbar.clipsToBounds = true
        earnProgressbar.layer.cornerRadius = progressConstraintHeight! / 2
        backgroundcolor = #colorLiteral(red: 0.01568627451, green: 0.05098039216, blue: 0.07843137255, alpha: 1)
        outlineColor = #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        barColor = #colorLiteral(red: 0.9921568627, green: 0.6823529412, blue: 0.7137254902, alpha: 1)
        textcolor = .white
        lblItem.font = Fonts.podFont(name: "Gopher-Bold", size: 16)
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    var outlineColor: UIColor? {
        didSet {
            earnProgressbar.layer.borderColor = outlineColor?.cgColor
            earnProgressbar.layer.borderWidth = 1
        }
    }
    var barColor: UIColor? {
        didSet {
            earnProgressbar.progressTintColor = barColor
            earnProgressbar.subviews[1].layer.borderColor = barColor?.cgColor
            earnProgressbar.subviews[1].layer.borderWidth = 1
        }
    }
    var backgroundcolor: UIColor? {
        didSet {
            earnProgressbar.trackTintColor = backgroundcolor
            self.backgroundColor = backgroundcolor//UIColor.lightGray
        }
    }
    var textcolor: UIColor? {
        didSet {
            lblItem.textColor = textcolor
        }
    }
    var emojiurl: String? {
        didSet {
            if let url = emojiurl {
                imgitem.loadAsyncImage(url: url, placeholder: nil)
            }
        }
    }
    var setprogressValue : Float?{
        didSet {
            progressValue = setprogressValue!
        }
    }
    var setmaxprogressvalue : Float?{
        didSet {
            let ratio = Float(progressValue) / Float(setmaxprogressvalue!)
            earnProgressbar.progress = ratio
        }
    }
    var progressConstraintHeight : CGFloat? = 0.0{
        didSet {
            progressHeight.constant = (progressConstraintHeight ?? 0.0) - 10
            earnProgressbar.layer.cornerRadius = progressHeight.constant / 2
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
