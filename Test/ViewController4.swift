//
//  ViewController4.swift
//  Test
//
//  Created by SonNV MacMini on 28/05/2021.
//

import UIKit

class ViewController4: UIViewController {

    var datas: [String] = ["VC", "アスピリン", "アスピリン・アスコルビン酸",
                           "アスピリン・ボノプラザンフマル酸塩配合剤", "ロキソプロフェンナトリウム水和物"]
    var values: [String] = [": 0.53", ": 0.84", ": 0.21", ": 1.04", ": 0.58",  ": 0.0"]

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.reloadData()
    }
}

extension ViewController4: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.labelTitle.text = datas[indexPath.row].limitString()
        cell.labelValue.text = values[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 10) / 2
        return CGSize(width: width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController4 {
    private func size(for indexPath: IndexPath) -> CGSize {
        // load cell from Xib
        let cell = Bundle.main.loadNibNamed("CollectionViewCell", owner: self, options: nil)?.first as? CollectionViewCell

        // width that you want
        let width = (collectionView.frame.width - 10) / 2
        let height: CGFloat = 0

        let targetSize = CGSize(width: width, height: height)

        // get size with width that you want and automatic height
        guard let size = cell?.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .sceneSizeStayPut) else {
            return targetSize
        }
        // if you want height and width both to be dynamic use below
        // let size = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        return size
    }
}

extension String {
    func limitString() -> String {
        var text = self
        if self.count > 20 {
            text = self.substring(to: 20) + "..."
        }
        return text
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
}
