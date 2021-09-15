
import Foundation

struct Employee {
    var name: String
    var mobile: String
    var passportID: String
}

class AppData {
    
    static let shared = AppData()
    
    private init() { }
        
    var globalEmployeeList: [Employee] = []
}

