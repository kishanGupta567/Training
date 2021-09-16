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
        } else {
            model.editEmployee(employee: employee, pos: position)
            delegate.success()
        }
    }
}


