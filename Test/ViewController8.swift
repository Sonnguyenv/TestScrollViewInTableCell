//
//  ViewController8.swift
//  Test
//
//  Created by SonNV MacMini on 08/06/2021.
//

import UIKit

class ViewController8: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!

    var push: (()->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self

        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
          view.endEditing(true)
    }

    @IBAction func editingDidBegin(_ sender: Any) {
        print("editingDidBegin")
    }

    @IBAction func editingDidEnd(_ sender: Any) {
        print("editingDidEnd")
    }

    @IBAction func touchUpOutSide(_ sender: Any) {
        print("touchUpOutSide")
    }

    @IBAction func actionPush(_ sender: Any) {
//        push?()
        let vc = ChartViewController()
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
