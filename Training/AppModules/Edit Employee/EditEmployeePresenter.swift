//
//  EditEmployeePresenter.swift
//  Training
//
//  Created by daffolapmac-190 on 17/09/21.
//

import Foundation

protocol EditEmployeeProtocol: AnyObject {
    func success()
    func failure()
}

class EditEmployeePresenter {
    
    weak var delegate: EditEmployeeProtocol!
    private var model: EditEmployeeModel!
    
    init(delegate: EditEmployeeProtocol) {
        self.delegate = delegate
        model = EditEmployeeModel()
    }
    
    func isValidate(employee: Employee, position: Int) {
        if employee.name.count < 2 {
            delegate.failure()
        } else if employee.mobile.count != 10 {
            delegate.failure()
        } else if employee.passportID.isEmpty {
            delegate.failure()
            
        } else {    //data is Valid, Update the Employee Data
            
            model.editEmployee(employee: employee, pos: position)
            delegate.success()
        }
    }
}
