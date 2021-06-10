//
//  MutipleDrugsCountCell.swift
//  Drjoy
//
//  Created by SonNV MacMini on 21/05/2021.
//  Copyright © 2021 Dr.JOY No,054. All rights reserved.
//

import UIKit

class MutipleDrugsCountCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var stackView: UIStackView!

    var widths: [CGFloat] = []
    var widthView: (([CGFloat])->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        print(self.frame.width)
        widthView?(widths)
    }

    func initStackView(_ datas: [String], _ index: Int, _ isActive: Bool, _ widthNew: [CGFloat]) {
        let values: [String] = ["578", "15446", "456", "123", "75587"]
        self.stackView.arrangedSubviews.forEach({$0.removeFromSuperview()})
        datas.enumerated().forEach({ (i, item) in
            let customView = UINib(nibName: "ValueView", bundle: nil)
                .instantiate(withOwner: nil, options: nil)
                .first as? ValueView
            guard let view = customView else {return}
            view.labelValue.text = index == 0 ? item : values[i]
            if isActive == true {
                view.csWidthView.isActive = true
                view.csWidthView.constant = self.frame.width / CGFloat((datas.count + 1))
            } else {
                view.csWidthView.isActive = false
            }

//            if !widthNew.isEmpty {
//                view.csWidthView.constant = widthNew[i]
//            } else {
//
//            }
            if index == 0 {
                let width = item.width(withConstrainedHeight: 45, font: .systemFont(ofSize: 13))
                widths.append(width)
            }
            stackView.addArrangedSubview(view)
        })
    }
}
