
import UIKit

class EmployeeListViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var employeeList = AppData.shared.globalEmployeeList

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    private func initView() {
        title = "List of employees"
        
        tableView.dataSource = self
        
        initRightNavBarButton(title: "add")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        employeeList = AppData.shared.globalEmployeeList
        tableView.reloadData()
    }
    
    override func rightNavBarAction() {
        let addEmployeeController = viewController(vc: AddEmployeeViewController.self)
        navigationController?.pushViewController(addEmployeeController, animated: true)
    }
}


extension EmployeeListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = employeeList[indexPath.row].name
        return cell
    }
}
