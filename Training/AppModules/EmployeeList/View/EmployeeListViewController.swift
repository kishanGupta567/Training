
import UIKit

class EmployeeListViewController: BaseViewController {
    
    @IBOutlet private  var tableView: UITableView!
   var employeeList = AppData.shared.globalEmployeeList

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    private func initView() {
        title = "List of employees"
        
        tableView.dataSource = self
        tableView.delegate=self
        tableView.reloadData()
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
extension EmployeeListViewController: UITableViewDelegate{
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = viewController(vc: DetailViewController.self)
        DispatchQueue.main.async {
            detailViewController.x=indexPath.row
            detailViewController.nameLabel?.text=self.employeeList[indexPath.row].name
            detailViewController.passportLabel?.text=self.employeeList[indexPath.row].passportID
            detailViewController.mobileLabel?.text=self.employeeList[indexPath.row].mobile
        }
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
