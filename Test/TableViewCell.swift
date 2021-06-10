//
//  TableViewCell.swift
//  Test
//
//  Created by SonNV MacMini on 12/05/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    let drugNames = ["オセルタミビルリン酸塩", "アスピリン", "アミノ安息香酸エチル・パラブチルアミノ安息香酸ジエチルアミノエチル塩酸塩"]
    let values: [String] = ["578", "15446", "57"]

    var widths: [CGFloat] = [] 
    var isActive: Bool = false
    var itemsSize: [CGFloat] = [100, 200, 300, 125]
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
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
}

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return itemsSize.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2",
                                                      for: indexPath) as! CollectionViewCell2
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
        return CGSize(width: itemsSize[indexPath.section], height: self.bounds.size.height)
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
