//
//  EditEmployeeViewController.swift
//  Training
//
//  Created by unthinkable-mac-0026 on 16/09/21.
//

import UIKit

class EditEmployeeViewController: BaseViewController {
    @IBOutlet weak var passportIdLbl: UITextField!
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var mobileNoLbl: UITextField!
    
    private var presenter: EditEmployeePresenter!
    
    var name:String = ""
    var mobileNo:String = ""
    var passportId:String = ""
    var position:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit Employee"
        initDetail()
    }
    func initDetail() {
        self.nameLbl.text = name
        self.mobileNoLbl.text = mobileNo
        self.passportIdLbl.text = passportId
        
        presenter = EditEmployeePresenter(delegate: self)
    }
    
    func initData(employe: Employee, pos: Int) {
        self.name = employe.name
        self.mobileNo = employe.mobile
        self.passportId = employe.passportID
        self.position = pos
    }
    
    @IBAction func editDetail(_ sender: UIButton) {
        
        if sender.currentTitle == "Edit Text" {
            self.nameLbl.isUserInteractionEnabled = true
            self.passportIdLbl.isUserInteractionEnabled = true
            self.mobileNoLbl.isUserInteractionEnabled = true
            
            sender.setTitle("Save", for: .normal)
        } else {
            let employe = Employee(name: self.nameLbl.text!,
                                    mobile: self.mobileNoLbl.text!,
                                    passportID: self.passportIdLbl.text!)
            
            presenter.isValidate(employee: employe, position: self.position)
        }
    }
}

extension EditEmployeeViewController: EditEmployeeProtocol {
    func success() {
        showAlert(message: "Employee data saved", title: "Success") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func failure() {
        showAlert(message: "Please enter data input accurately", title: "Validation Failed", okAction: {})
    }
}
