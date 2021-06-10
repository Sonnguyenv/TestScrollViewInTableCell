//
//  ViewController.swift
//  Test
//
//  Created by SonNV MacMini on 02/02/2021.
//

import UIKit

enum PasswordError: Error {
    case obvious
}

public struct User: Codable {
    public var createdDate: String?
    public var name: String?
    public var memberId: String?
    public var isServer: Bool?
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let array: [String] = ["a", "b", "c", "d"]

    var dataA = ["A", "B", "C", "D", "E", "F"]
    var dataB: [String: String] = ["C":"3", "B":"2", "A":"1", "F":"6", "D":"4", "E":"5"]

    var dataNew: [String:String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "TableViewCellNew", bundle: nil),
                                forCellReuseIdentifier: "TableViewCellNew")
        self.tableView.register(UINib(nibName: "HeaderTableView", bundle: nil),
                                forHeaderFooterViewReuseIdentifier: "HeaderTableView")
        self.tableView.rowHeight = 50
        self.tableView.estimatedSectionHeaderHeight = 32
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.sectionFooterHeight = CGFloat.leastNonzeroMagnitude
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    func sizeHeaderToFit() {
        let headerView = tableView.tableHeaderView

        headerView?.setNeedsLayout()
        headerView?.layoutIfNeeded()

        let height = headerView?.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = headerView?.frame
        frame?.size.height = height ?? 0.0
        headerView?.frame = frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)

        tableView.tableHeaderView = headerView
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellNew") as! TableViewCellNew
        tableView.beginUpdates()
        tableView.endUpdates()
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderTableView") as! HeaderTableView
        header.fillData(.red, "abcabcabcabcasdasasasadsasasasasasdasdasdasdasdasasd")
        header.setNeedsLayout()
        header.layoutIfNeeded()
        return header
    }

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 32
//    }

//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return CGFloat.leastNonzeroMagnitude
//    }
}
