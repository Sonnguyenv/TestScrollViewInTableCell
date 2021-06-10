//
//  CollectionViewCell2.swift
//  Test
//
//  Created by SonNV MacMini on 09/06/2021.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {

    @IBOutlet weak var stackView: UIStackView!
    var widths: CGFloat = 0.0
    var closure: ((CGFloat)->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }

    func setupStackView(_ datas: [String], _ index: Int, _ widthsNew: [CGFloat]) {
        self.stackView.arrangedSubviews.forEach({$0.removeFromSuperview()})
        datas.enumerated().forEach { index , item in
            let customView = UINib(nibName: "ViewCollection", bundle: nil)
                .instantiate(withOwner: nil, options: nil)
                .first as? ViewCollection
            guard let view = customView else {return}
            view.fillData(text: item)
//            if index == 0 {
//                view.csWidthView.isActive = false
//                view.closure = {[weak self] width in
//                    self?.closure?(width)
//                }
//            } else {
//                view.csWidthView.isActive = true
//                if !widthsNew.isEmpty {
//                    view.csWidthView.constant = widthsNew[index]
//                }
//            }
            stackView.addArrangedSubview(view)
        }

    }
}
