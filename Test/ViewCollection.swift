//
//  ViewCollection.swift
//  Test
//
//  Created by SonNV MacMini on 09/06/2021.
//

import UIKit

class ViewCollection: UIView {

    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var csWidthView: NSLayoutConstraint!

    var width: CGFloat = 0.0
    var closure: ((CGFloat)->Void)?
    var value: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        viewBound.layer.borderWidth = 1
        viewBound.layer.borderColor = UIColor.opaqueSeparator.cgColor
    }

    func fillData(text: String) {
        self.value = text
        self.labelText.text = text.limitString(20)
        self.csWidthView.constant = text.limitString(20).width(withConstrainedHeight: self.frame.height,
                                           font: UIFont.systemFont(ofSize: 14.0))
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
////        width = self.frame.width
//        DispatchQueue.main.async {
//            self.csWidthView.constant = self.value.width(withConstrainedHeight: self.frame.height,
//                                               font: UIFont.systemFont(ofSize: 14.0))
//        }
//        print(self.frame.width)
//    }
}

extension String {
    func limitString(_ count: Int) -> String {
        var text = self
        if self.count > count {
            text = self.substring(to: count) + "..."
        }
        return text
    }

    func yyyqToYear() -> String {
        let start = String.Index(utf16Offset: 0, in: self)
        let end = String.Index(utf16Offset: 3, in: self)
        return String(self[start...end])
    }
}
