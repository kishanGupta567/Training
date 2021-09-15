
import UIKit

class AddEmployeeViewController: BaseViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var mobileTextField: UITextField!
    @IBOutlet private weak var passportIDTextField: UITextField!
    @IBOutlet private weak var addEmployeeButton: UIButton!
    private var presenter: AddEmployeePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AddEmployeePresenter(delegate: self)
        initView()
    }
    
    private func initView() {
        title = "Add Employee"
    }
    
    @IBAction private func addEmployeeTapped(_ sender: UIButton) {
        let employee = Employee(name: nameTextField.text!,
                                mobile: mobileTextField.text!,
                                passportID: passportIDTextField.text!)
        
        presenter.isValidate(employee: employee)
    }
}


extension AddEmployeeViewController: AddEmployeeProtocol {
    func success() {
        showAlert(message: "Employee data saved", title: "Success") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func failure() {
        showAlert(message: "Please enter data input accurately", title: "Validation Failed", okAction: {})
    }
}
