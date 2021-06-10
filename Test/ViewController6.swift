//
//  ViewController6.swift
//  Test
//
//  Created by SonNV MacMini on 02/06/2021.
//

import UIKit

class ViewController6: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil),
                                forCellReuseIdentifier: "TableViewCell")

        self.tableView.rowHeight = 310
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ViewController6: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
//        cell.setupTableView()
        return cell
    }
}
