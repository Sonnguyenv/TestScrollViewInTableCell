//
//  TableViewCell.swift
//  Test
//
//  Created by SonNV MacMini on 12/05/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var csWidthTableView: NSLayoutConstraint!

    @IBOutlet weak var collectionView: UICollectionView!

    let drugNames = ["オセルタミビルリン酸塩", "アスピリン", "アミノ安息香酸エチル・パラブチルアミノ安息香酸ジエチルアミノエチル塩酸塩"]
    let values: [String] = ["578", "15446", "57"]

    var widths: [CGFloat] = [] 
    var isActive: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        setupCollectionView()
//            var frame = self.frame
//            let newWidth = frame.width * 3
//            value = newWidth
//            frame.size.width = newWidth
//            self.frame = frame
//            self.scrollView.contentSize.width = newWidth
//            self.tableView.contentSize.width = newWidth
////            print(frame)
//        let widthNew =  widths.reduce(0, +) + 110
//        if widthNew > self.frame.width {
//            self.scrollView.contentSize.width = widthNew
//            self.csWidthTableView.constant = widthNew
//            self.isActive = false
//            self.tableView.reloadData()
//        } else {
//            self.isActive = true
//            self.scrollView.contentSize.width = self.frame.width
//            self.csWidthTableView.constant = self.frame.width
//            self.tableView.reloadData()
//        }
//        print("Sonnv === layoutSubviews")
    }
//
//    func setupTableView() {
//        self.scrollView.bounces = false
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.scrollView.delegate = self
//        self.tableView.bounces = false
//        self.tableView.register(UINib(nibName: "MutipleDrugsCountCell", bundle: nil), forCellReuseIdentifier: "MutipleDrugsCountCell")
//    }

    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "CollectionViewCell2", bundle: nil),
                                     forCellWithReuseIdentifier: "CollectionViewCell2")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            let width = UIScreen.main.bounds.width
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
//            layout.itemSize = CGSize(width: width/3, height: 45)
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        collectionView.collectionViewLayout = layout
//
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: self.collectionView.frame.size.width / 5, height: self.collectionView.frame.size.height / 2.5)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
    }
}

//extension TableViewCell: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//    }
//}
//
//extension TableViewCell: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MutipleDrugsCountCell") as! MutipleDrugsCountCell
//        cell.initStackView(drugNames, indexPath.row, isActive, widths)
//        cell.widthView = {[weak self] widths in
//            self?.widths.removeAll()
//            self?.widths = widths
//            self?.layoutIfNeeded()
//        }
//        print("Sonnv === cell")
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return  UITableView.automaticDimension
//    }
//}

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2",
                                                      for: indexPath) as! CollectionViewCell2

        if indexPath.row == 0 {
            cell.setupStackView(drugNames, indexPath.row, [])
//            cell.closure = {[weak self] width in
//                self?.widths.append(width)
//            }
//            print(widths)
        }
        else {
            cell.setupStackView(values, indexPath.row, widths)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 45)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
