//
//  ViewController5.swift
//  Test
//
//  Created by SonNV MacMini on 02/06/2021.
//

import UIKit

class ViewController5: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewCorner1: UIView!
    @IBOutlet weak var view2: UIView!
    //    @IBOutlet weak var viewCorner2: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        viewCorner1.roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 7.0,
//                                 color: UIColor(hexString: "D7D7D7"), width: 1)

//        viewCorner1.roundCorners(corners: [.topLeft, .topRight], radius: 7.0)
        view2.roundCorners(corners: [.topLeft, .topRight], radius: 7.0)

//        viewCorner2.roundCorners(corners: [], radius: 7.0,
//                                 color: UIColor(hexString: "D7D7D7"), width: 1)

//        viewCorner1.addBorder(toSide: .Bottom, withColor: UIColor.white.cgColor, andThickness: 1)
//        viewCorner1.addTopAndBottomBorders()

//        viewCorner1.clipsToBounds = true
//        viewCorner1.layer.cornerRadius = 7.0
//        viewCorner1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//
//        viewCorner2.clipsToBounds = true
//        viewCorner2.layer.cornerRadius = 7.0
//        viewCorner2.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

//        viewCorner1.layer.addBorder(side: .top, thickness: 1, color: UIColor(hexString: "D7D7D7").cgColor)
//        viewCorner1.layer.addBorder(side: .left, thickness: 1, color: UIColor(hexString: "D7D7D7").cgColor)
//        viewCorner1.layer.addBorder(side: .bottom, thickness: 10, color: UIColor.white.cgColor)

//        viewCorner1.layer.cornerRadius = 4

        let title = NSMutableAttributedString()

        let title1 = "【副作用】"
        let title2 = "【年齢】"
        let title3 = "【性別】"

        title.append(title1.bold)
        title.append(NSAttributedString(string: " 発熱, "))

        title.append(title2.bold)
        title.append(NSAttributedString(string: " すべて, "))

        title.append(title3.bold)
        title.append(NSAttributedString(string: " すべて"))
        let string = title.string
        if let index = string.firstIndex(where: {$0 == ","}) {
            let count = title.string.count - title.string[index..<title.string.endIndex].count
//            title.mutableString.replaceCharacters(in: NSRange(location: 0, length: ), with: "")

//            let newStartIndex = string.startIndex
//            let newEndIndex = string.substring(to: index)

//            title.string.remove(at: i)
//            let sub = title.attributedSubstring(from: NSRange(location: 0, length: count))
            title.mutableString.replaceCharacters(in: NSRange(location: 0, length: count+1), with: "")
            title.insert(NSAttributedString(string: " vcc,"), at: 0)
            title.insert(title1.bold, at: 0)
            labelTitle.attributedText = title

        }
    }
}

public extension String {

    var bold: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.boldSystemFont(ofSize: 20)])
    }
}

extension UIView {
    func roundCorners(corners :CACornerMask, radius: CGFloat, color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.maskedCorners = corners
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension CALayer {

    enum BorderSide {
        case top
        case right
        case bottom
        case left
        case notRight
        case notLeft
        case topAndBottom
        case all
    }

    enum Corner {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }

    func addBorder(side: BorderSide, thickness: CGFloat, color: CGColor, maskedCorners: CACornerMask? = nil) {
        var topWidth = frame.size.width; var bottomWidth = topWidth
        var leftHeight = frame.size.height; var rightHeight = leftHeight

        var topXOffset: CGFloat = 0; var bottomXOffset: CGFloat = 0
        var leftYOffset: CGFloat = 0; var rightYOffset: CGFloat = 0

        // Draw the corners and set side offsets
        switch maskedCorners {
        case [.layerMinXMinYCorner, .layerMaxXMinYCorner]: // Top only
            addCorner(.topLeft, thickness: thickness, color: color)
            addCorner(.topRight, thickness: thickness, color: color)
            topWidth -= cornerRadius*2
            leftHeight -= cornerRadius; rightHeight -= cornerRadius
            topXOffset = cornerRadius; leftYOffset = cornerRadius; rightYOffset = cornerRadius

        case [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]: // Bottom only
            addCorner(.bottomLeft, thickness: thickness, color: color)
            addCorner(.bottomRight, thickness: thickness, color: color)
            bottomWidth -= cornerRadius*2
            leftHeight -= cornerRadius; rightHeight -= cornerRadius
            bottomXOffset = cornerRadius

        case [.layerMinXMinYCorner, .layerMinXMaxYCorner]: // Left only
            addCorner(.topLeft, thickness: thickness, color: color)
            addCorner(.bottomLeft, thickness: thickness, color: color)
            topWidth -= cornerRadius; bottomWidth -= cornerRadius
            leftHeight -= cornerRadius*2
            leftYOffset = cornerRadius; topXOffset = cornerRadius; bottomXOffset = cornerRadius;

        case [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]: // Right only
            addCorner(.topRight, thickness: thickness, color: color)
            addCorner(.bottomRight, thickness: thickness, color: color)
            topWidth -= cornerRadius; bottomWidth -= cornerRadius
            rightHeight -= cornerRadius*2
            rightYOffset = cornerRadius

        case [.layerMaxXMinYCorner, .layerMaxXMaxYCorner,  // All
              .layerMinXMaxYCorner, .layerMinXMinYCorner]:
            addCorner(.topLeft, thickness: thickness, color: color)
            addCorner(.topRight, thickness: thickness, color: color)
            addCorner(.bottomLeft, thickness: thickness, color: color)
            addCorner(.bottomRight, thickness: thickness, color: color)
            topWidth -= cornerRadius*2; bottomWidth -= cornerRadius*2
            topXOffset = cornerRadius; bottomXOffset = cornerRadius
            leftHeight -= cornerRadius*2; rightHeight -= cornerRadius*2
            leftYOffset = cornerRadius; rightYOffset = cornerRadius

        default: break
        }

        // Draw the sides
        switch side {
        case .top:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)

        case .right:
            addLine(x: frame.size.width - thickness, y: rightYOffset, width: thickness, height: rightHeight, color: color)

        case .bottom:
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)

        case .left:
            addLine(x: 0, y: leftYOffset, width: thickness, height: leftHeight, color: color)

        // Multiple Sides
        case .notRight:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)
            addLine(x: 0, y: leftYOffset, width: thickness, height: leftHeight, color: color)
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)

        case .notLeft:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)
            addLine(x: frame.size.width - thickness, y: rightYOffset, width: thickness, height: rightHeight, color: color)
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)

        case .topAndBottom:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)

        case .all:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)
            addLine(x: frame.size.width - thickness, y: rightYOffset, width: thickness, height: rightHeight, color: color)
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)
            addLine(x: 0, y: leftYOffset, width: thickness, height: leftHeight, color: color)
        }
    }

    private func addLine(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: CGColor) {
        let border = CALayer()
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        border.backgroundColor = color
        addSublayer(border)
    }

    private func addCorner(_ corner: Corner, thickness: CGFloat, color: CGColor) {
        // Set default to top left
        let width = frame.size.width; let height = frame.size.height
        var x = cornerRadius
        var y = cornerRadius
        var startAngle: CGFloat = .pi; var endAngle: CGFloat = .pi*3/2

        switch corner {
        case .bottomLeft:
            y = height - cornerRadius
            startAngle = .pi/2; endAngle = .pi

        case .bottomRight:
            x = width - cornerRadius
            y = height - cornerRadius
            startAngle = 0; endAngle = .pi/2

        case .topRight:
            x = width - cornerRadius
            startAngle = .pi*3/2; endAngle = 0

        default: break
        }

        let cornerPath = UIBezierPath(arcCenter: CGPoint(x: x, y: y),
                                      radius: cornerRadius - thickness,
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: true)

        let cornerShape = CAShapeLayer()
        cornerShape.path = cornerPath.cgPath
        cornerShape.lineWidth = thickness
        cornerShape.strokeColor = color
        cornerShape.fillColor = nil
        addSublayer(cornerShape)
    }
}
