import Foundation

struct EditEmployeeModel {

    func editEmployee(employee: Employee, pos: Int) {
        AppData.shared.globalEmployeeList[pos] = employee
    }
}
