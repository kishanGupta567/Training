//
//  EditEmployeeModel.swift
//  Training
//
//  Created by daffolapmac-190 on 17/09/21.
//

import Foundation

struct EditEmployeeModel {

    func editEmployee(employee: Employee, pos: Int) {
        AppData.shared.globalEmployeeList[pos] = employee
    }
}
