//
//  DetailViewController.swift
//  Training
//
//  Created by Unthinkable-mac-0040 on 15/09/21.
//

import UIKit

class DetailViewController: UIViewController, EditEmployeeProtocol {
    var x:Int=0
    private var editPresenter=DetailViewPresenter()
    @IBOutlet weak var passportLabel: UITextField!
    @IBOutlet weak var mobileLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        editPresenter.delegate = self
        passportLabel.isUserInteractionEnabled = false
        mobileLabel.isUserInteractionEnabled = false
        nameLabel.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        passportLabel.isUserInteractionEnabled = true
        mobileLabel.isUserInteractionEnabled = true
        nameLabel.isUserInteractionEnabled = true
        nameLabel.becomeFirstResponder()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let newEmp=Employee(name: nameLabel.text!, mobile: mobileLabel.text!, passportID: passportLabel.text!)
        editPresenter.isValidate(employee:newEmp)
    }
    func showAlert(message: String, title: String, okAction: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                okAction?()
            }))
        
        present(alert, animated: true, completion: nil)
    }
    func success() {
        let editedEmployee=Employee(name: nameLabel.text!, mobile: mobileLabel.text!, passportID: passportLabel.text!)
        editPresenter.settingFinalData(pos: x, newEmployee: editedEmployee)
        showAlert(message: "Employee data saved", title: "Success") {
                    self.navigationController?.popViewController(animated: true)
                }
    }
    func failure() {
        showAlert(message: "Please enter data input accurately", title: "Validation Failed", okAction: {})
    }
}
