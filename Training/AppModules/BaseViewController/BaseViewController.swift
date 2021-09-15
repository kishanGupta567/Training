import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(message: String, title: String, okAction: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                okAction!()
            }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func initRightNavBarButton(title: String) {
        let barButton = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightNavBarAction))
        navigationItem.rightBarButtonItem = barButton
    }

    @objc func rightNavBarAction() { }
    
    func viewController<T: UIViewController>(vc: T.Type) -> T {
        return storyboard?.instantiateViewController(withIdentifier: String(describing: vc)) as! T
    }
}
