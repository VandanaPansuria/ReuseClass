//
//  CategoryListCell.swift
//  ReuseClass
//
//  Created by MacV on 22/01/21.
//

import UIKit

class CategoryListCell: UITableViewCell {

    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblAvg: UILabel!
    @IBOutlet weak var lblYou: UILabel!
    @IBOutlet weak var imgitem: AsyncImage!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgitem.layer.cornerRadius = imgitem.frame.size.height / 2
        lblItem.font = Fonts.podFont(name: "Gopher-Regular", size: 14)
        lblYou.font = Fonts.podFont(name: "Gopher-Bold", size: 16)
        lblAvg.font = Fonts.podFont(name: "Gopher-Bold", size: 16)
    }
    var emojiurl: String? {
        didSet {
            if let url = emojiurl {
                let bundle = Bundle(for: ReuseClass.self)
                let placeholderimage =  UIImage(named: "placeholder", in: bundle, compatibleWith: nil)
                imgitem.loadAsyncImage(url: url, placeholder : placeholderimage)
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

