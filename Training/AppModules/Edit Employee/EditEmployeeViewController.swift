//
//  EditEmployeeViewController.swift
//  Training
//
//  Created by daffolapmac-190 on 17/09/21.
//

import UIKit

class EditEmployeeViewController: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var passportIdLbl: UITextField!
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var mobileNoLbl: UITextField!
    
    
    //MARK: - Private Methods
    private var presenter: EditEmployeePresenter!
    var name:String = ""
    var mobileNo:String = ""
    var passportId:String = ""
    var position:Int = 0
    
    
    
    //MARK:-IBActions
    @IBAction func editDetail(_ sender: UIButton) {
        
        if sender.currentTitle == "Edit" {
            self.nameLbl.isUserInteractionEnabled = true
            self.passportIdLbl.isUserInteractionEnabled = true
            self.mobileNoLbl.isUserInteractionEnabled = true
            
            sender.setTitle("Save", for: .normal)
            
        } else {
            
            //Create new Employee
            let employe = Employee(name: self.nameLbl.text!, mobile: self.mobileNoLbl.text!, passportID: self.passportIdLbl.text!)
            
            //Validate this Emplyee Data
            presenter.isValidate(employee: employe, position: self.position)
        }
    }
}


//MARK: - Lifecyle Methods
extension EditEmployeeViewController{
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit Employee"
        initDetail()
    }
}

//MARK: - Public Methods
extension EditEmployeeViewController{
    
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
}


//MARK: - Presenter Methods
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
