//
//  PassCodeViewController.swift
//  Lamps
//
//  Created by Jerome Chan on 13/6/23.
//

import UIKit

class PassCodeViewController: UIViewController {

    enum mode {
        case createPassCode
        case validatePassCode
        case editPassCode

        var label: String {
            switch self {
            case .createPassCode:
                return "Create Pass Code"
            case .validatePassCode:
                return "Validate Pass Code"
            case .editPassCode:
                return "Edit Pass Code"
            }
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var field3: UITextField!

    var mode: PassCodeViewController.mode = .validatePassCode

    var model: PassCodeModel = PassCodeModel(passCodeString: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateAll()
    }


    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func performOkButtonAction(_ sender: Any) {
        switch self.mode {
        case .createPassCode:
            createPassCode()
        case .validatePassCode:
            validatePassCode()
        case .editPassCode:
            editPassCode()
        }
    }

    private func updateAll() {
        updateTitleLabel()
        updateTextFields()
    }

    private func updateTitleLabel() {
        titleLabel.text = self.mode.label
    }

    private func updateTextFields() {
        switch self.mode {
        case .createPassCode:
            field1.isHidden = false
            field2.isHidden = false
            field3.isHidden = true
        case .editPassCode:
            field1.isHidden = false
            field2.isHidden = false
            field3.isHidden = false
        case .validatePassCode:
            field1.isHidden = false
            field2.isHidden = true
            field3.isHidden = true
        }
    }

    private func createPassCode() {
        if
            let p1 = field1.text,
            let p2 = field2.text,
            p1 == p2 {
            self.dismiss(animated: true)
        } else {
            showAlert(title: "Error", message: "Pass codes do not match")
        }
    }

    private func validatePassCode() {
        if
            let p1 = field1.text,
            model.validate(passCodeString: p1) {
            self.dismiss(animated: true)
        } else {
            showAlert(title: "Error", message: "Pass codes do not match")
        }
    }

    private func editPassCode() {
        if
            let p1 = field1.text,
            let p2 = field2.text,
            let p3 = field3.text,
            self.model.validate(passCodeString: p1),
            p2 == p3 {
            self.dismiss(animated: true)
        } else {
            showAlert(title: "Error", message: "Pass codes do not match")
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in })
        self.present(alert, animated: true, completion: nil)
    }
}
