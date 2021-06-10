//
//  TodayDrugNewsCell.swift
//  Drjoy
//
//  Created by SonNV MacMini on 16/03/2021.
//  Copyright © 2021 Dr.JOY No,054. All rights reserved.
//

import UIKit

class TodayDrugNewsCell: UITableViewCell {
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var labelDrugName: UILabel!
    @IBOutlet weak var labelCompanyName: UILabel!

    @IBOutlet weak var buttonIsDsExits: UIButton!
    @IBOutlet weak var buttonIsRsExits: UIButton!
    
    @IBOutlet weak var buttonProfileUser: UIView!
    @IBOutlet weak var buttonRegisterDrug: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.buttonRegisterDrug.layer.borderWidth = 1.6
        self.buttonRegisterDrug.layer.cornerRadius = 2
        self.buttonRegisterDrug.layer.borderColor = UIColor(named: "#EE8B23")?.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupData(_ categories: String, _ drugName: String, _ companyName: String, _ registerDrug: Bool, _ profileUser: Bool, _ isDsExits: Bool, _ isRsExits: Bool) {

        self.labelCategories.text = categories
        self.labelDrugName.text = drugName
        self.labelCompanyName.text = companyName

        self.buttonIsDsExits.isHidden = !isDsExits
        self.buttonIsRsExits.isHidden = !isRsExits

        self.buttonRegisterDrug.isHidden = !registerDrug
        self.buttonProfileUser.isHidden = !profileUser
    }
}
