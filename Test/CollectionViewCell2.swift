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
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.gray.cgColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }
}
