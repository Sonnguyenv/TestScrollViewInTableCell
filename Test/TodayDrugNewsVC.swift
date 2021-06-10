//
//  TodayDrugNewsVC.swift
//  Develop
//
//  Created by SonNV MacMini on 16/03/2021.
//  Copyright © 2021 Dr.JOY No,054. All rights reserved.
//

import UIKit

struct TodayDrugNewsModel {
    var categories: String
    var drugName: String
    var companyName: String
    var isDsExits: Bool
    var isRsExits: Bool
    var isShowProfile: Bool
    var isShowResgisterDrug: Bool

    init(_ categories: String, _ drugName: String, _ companyName: String, _ isDsExits: Bool,
         _ isRsExits: Bool, _ isShowProfile: Bool, _ isShowResgisterDrug: Bool) {
        self.categories = categories
        self.drugName = drugName
        self.companyName = companyName
        self.isDsExits = isDsExits
        self.isRsExits = isRsExits
        self.isShowProfile = isShowProfile
        self.isShowResgisterDrug = isShowResgisterDrug
    }
}

class TodayDrugNewsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var dataFake = ["2月22日(水)", [TodayDrugNewsModel("abc", "abc", "abc", true, true, false, false),
                                        TodayDrugNewsModel("abc", "abc", "abc", true, true, false, false),
                                        TodayDrugNewsModel("abc", "abc", "abc", true, true, false, false),
                                        TodayDrugNewsModel("abc", "abc", "abc", true, true, false, false)],
                    "2月24日(水)", [TodayDrugNewsModel("abc", "abc", "abc", false, false, true, true),
                                        TodayDrugNewsModel("abc", "abc", "abc", false, false, true, true),
                                        TodayDrugNewsModel("abc", "abc", "abc", false, false, true, true),
                                        TodayDrugNewsModel("abc", "abc", "abc", false, false, true, true)],
                    "2月25日(水)", [TodayDrugNewsModel("abc", "abc", "abc", true, false, true, false),
                                        TodayDrugNewsModel("abc", "abc", "abc", true, false, true, false),
                                        TodayDrugNewsModel("abc", "abc", "abc", true, false, true, false),
                                        TodayDrugNewsModel("abc", "abc", "abc", true, false, true, false)],
                    "2月26日(水)", [TodayDrugNewsModel("abc", "abc", "abc", true, false, true, false),
                                        TodayDrugNewsModel("abc", "abc", "abc", true, false, true, false),
                                        TodayDrugNewsModel("abc", "abc", "abc", true, false, true, false),
                                        TodayDrugNewsModel("abc", "abc", "abc", true, false, true, false)]
    ] as [Any]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        self.tableView.register(UINib(nibName: "TodayDrugNewsCell", bundle: nil), forCellReuseIdentifier: "TodayDrugNewsCell")
        self.tableView.dataSource = self
//        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = 95.0
    }
}

extension TodayDrugNewsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodayDrugNewsCell", for: indexPath) as! TodayDrugNewsCell

        cell.setupData("abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc", "abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc", "abc",
                       (indexPath.row / 2 != 0) ? false : true,
                       (indexPath.row / 2 != 0) ? true : false,
                       (indexPath.row / 2 != 0) ? true : false,
                       (indexPath.row / 2 != 0) ? false : true)
        return cell
    }
}

