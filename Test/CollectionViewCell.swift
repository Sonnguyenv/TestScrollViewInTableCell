//
//  CollectionViewCell.swift
//  Test
//
//  Created by SonNV MacMini on 31/05/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelDescrip: UILabel!
    @IBOutlet weak var viewDescrip: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
