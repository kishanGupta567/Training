import Foundation

struct AddEmployeeModel {
    
    var list: [Employee] {
        return getData()
    }
    
    func getData() -> [Employee] {
        return AppData.shared.globalEmployeeList
    }

    func addEmployee(employee: Employee) {
        AppData.shared.globalEmployeeList.append(employee)
    }
}
