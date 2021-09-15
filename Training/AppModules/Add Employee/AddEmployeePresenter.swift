protocol AddEmployeeProtocol: AnyObject {
    func success()
    func failure()
}

class AddEmployeePresenter {
    
    weak var delegate: AddEmployeeProtocol!
    private var model: AddEmployeeModel!
    
    init(delegate: AddEmployeeProtocol) {
        self.delegate = delegate
        model = AddEmployeeModel()
    }
    
    func isValidate(employee: Employee) {
        if employee.name.count < 2 {
            delegate.failure()
        } else if employee.mobile.count != 10 {
            delegate.failure()
        } else if employee.passportID.isEmpty {
            delegate.failure()
        } else {
            model.addEmployee(employee: employee)
            delegate.success()
        }
    }
}
