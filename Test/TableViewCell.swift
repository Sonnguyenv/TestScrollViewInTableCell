//
//  TableViewCell.swift
//  Test
//
//  Created by SonNV MacMini on 12/05/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let paddingForCell: CGFloat = 30.0
    var data = [["転帰／薬剤名12345", "死亡", "軽快", "回復", "後遺症あり"],
                ["オセルタミビルリン酸塩", "336件", "594件", "298件", "41件"],
                ["TAMIFLU", "6件", "30000件", "18件", "419件"],
                ["vc", "6件", "1件", "11件", "11件"]
    ]
    
//    var data = [
//                ["vc", "6件", "1件", "11件", "11件"]
//    ]
    
//    var data = [
//                ["TAMIFLU", "6件", "30000件", "18件", "419件"],
//                ["vc", "6件", "1件", "11件", "11件"],
//        ["vc", "6件", "1件", "11件", "11件"],
//        ["vc", "6件", "1件", "11件", "11件"]
//    ]
    
    var maxWidth: CGFloat = 0.0
    var compensateWidthForEachCell: CGFloat = 0.0

    var itemsSize: [CGFloat] = [100, 200, 300, 125]
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        self.setupWithData(self.data)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "CollectionViewCell2", bundle: nil),
                                     forCellWithReuseIdentifier: "CollectionViewCell2")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
    }
    
    func setupWithData(_ data: [[String]]) {
        self.data = data
        self.maxWidth = widthEstimatedWithData(data)
        let compensateWidth = self.bounds.width - maxWidth - paddingForCell*CGFloat(data.count)
        compensateWidthForEachCell = compensateWidth/CGFloat(data.count)
        self.collectionView.reloadData()
    }
    
    func widthEstimatedWithData(_ data: [[String]], font: UIFont = CollectionViewCell2.font) -> CGFloat {
        var maxWidth: CGFloat = 0.0
        data.forEach {
            let longestLabel = $0.max(by: {$0.count < $1.count})?
                .width(withConstrainedHeight: .greatestFiniteMagnitude, font: font)
            maxWidth += longestLabel ?? 0.0
        }
        return maxWidth
    }
}

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2",
                                                      for: indexPath) as! CollectionViewCell2
        cell.setupWithValue(data[indexPath.section])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = data[indexPath.section]
            .max(by: {$0.count < $1.count})?
            .width(withConstrainedHeight: .greatestFiniteMagnitude,
                   font: CollectionViewCell2.font) ?? 0.0
        
        guard compensateWidthForEachCell < 0 else {
            return CGSize(width: width + paddingForCell + compensateWidthForEachCell, height: self.bounds.size.height)
        }
        
        return CGSize(width: width + paddingForCell, height: self.bounds.size.height)
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
