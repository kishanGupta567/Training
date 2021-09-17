//
//  DetailViewPresenter.swift
//  Training
//
//  Created by Unthinkable-mac-0040 on 15/09/21.
//

import Foundation
protocol EditEmployeeProtocol: AnyObject {
    func success()
    func failure()
}

class DetailViewPresenter{
weak var delegate: EditEmployeeProtocol!
func isValidate(employee: Employee) {
    if employee.name.count < 2 {
        delegate.failure()
    } else if employee.mobile.count != 10 {
        delegate.failure()
    } else if employee.passportID.isEmpty {
        delegate.failure()
    } else {
       // model.addEmployee(employee: employee)
        delegate.success()
    }
}
}
