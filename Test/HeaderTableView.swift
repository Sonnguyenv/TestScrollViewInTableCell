//
//  HeaderTableView.swift
//  Test
//
//  Created by SonNV MacMini on 27/05/2021.
//

import UIKit

class HeaderTableView: UITableViewHeaderFooterView {

    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var labelTitle: UILabel!

    func fillData(_ color: UIColor, _ text: String) {
        self.viewColor.backgroundColor = color
        self.labelTitle.text = text
    }
}
