//
//  CollectionViewCell2.swift
//  Test
//
//  Created by SonNV MacMini on 09/06/2021.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {
    
    static let font: UIFont = .systemFont(ofSize: 15.0)

    @IBOutlet weak var stackView: UIStackView!
    var widths: CGFloat = 0.0
    var closure: ((CGFloat)->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.gray.cgColor
        stackView.distribution = .fillEqually
        stackView.spacing = .zero
    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    func setupWithValue(_ values: [String]) {
        values.map { value -> UIButton in
            let label = UIButton(frame: .zero)
            label.setTitle(value, for: .normal)
            label.titleLabel?.font = CollectionViewCell2.font
            label.setTitleColor(.black, for: .normal)
            label.contentHorizontalAlignment = .right
            label.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
            label.addBottomBorder(color: .gray, thickness: 0.5)
            return label
        }
        .forEach {stackView.addArrangedSubview($0)}
        (stackView.arrangedSubviews.first as? UIButton)?.contentHorizontalAlignment = .center
    }
    
    override func prepareForReuse() {
        stackView.removeAllArrangedSubviews()
    }
}


extension UIView {
    func addTopBorder(color: UIColor, thickness: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: thickness)
        addSubview(border)
    }
    
    func addBottomBorder(color: UIColor, thickness: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - thickness, width: frame.size.width, height: thickness)
        addSubview(border)
    }
    
    func addLeftBorder(color: UIColor, thickness: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.size.height)
        addSubview(border)
    }
    
    func addRightBorder(color: UIColor, thickness: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        border.frame = CGRect(x: frame.size.width - thickness, y: 0, width: thickness, height: frame.size.height)
        addSubview(border)
    }
}
extension UIStackView {
    
    func removeAllArrangedSubviews() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
            
    }
}
