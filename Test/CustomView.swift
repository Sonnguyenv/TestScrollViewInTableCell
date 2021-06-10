//
//  CustomView.swift
//  TestTableViewInScrollView
//
//  Created by Sonnv on 11/05/2021.
//

import Foundation
import UIKit

class CustomView: UIView {
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func initViews() {
        self.labelName.text = "abc"
    }
}
