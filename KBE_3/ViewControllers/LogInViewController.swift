import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var connectionSettingsView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var portTextField: UITextField!
    @IBOutlet weak var hostnameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectionSettingsView.layer.cornerRadius = 10
        connectionSettingsView.layer.borderWidth = 1
        connectionSettingsView.layer.borderColor = UIColor.green.cgColor
    }
    
    
    @IBAction func connectButtonPressed(_ sender: Any) {
        guard
            let hostnameTextFieldText = hostnameTextField?.text,
            let hostnameTextFieldPlaceholder = hostnameTextField?.placeholder,
            let portTextFieldText = portTextField?.text,
            let portTextFieldPlaceholder = portTextField?.placeholder,
            let usernameTextFieldText = usernameTextField?.text,
            let usernameTextFieldPlaceholder = usernameTextField?.placeholder,
            let passwordTextFieldText = passwordTextField?.text,
            let passwordTextFieldPlaceholder = passwordTextField?.placeholder else {
                return
        }
        
        let hostname = hostnameTextFieldText == "" ? hostnameTextFieldPlaceholder : hostnameTextFieldText

        let portString = portTextFieldText == "" ? portTextFieldPlaceholder : portTextFieldText
        let port = Int(portString) ?? 7687
        let username = usernameTextFieldText == "" ? usernameTextFieldPlaceholder : usernameTextFieldText
        let password = passwordTextFieldText == "" ? passwordTextFieldPlaceholder : passwordTextFieldText
        
        let config = ConnectionConfig(host: hostname, port: port, username: username, password: password)
        
        GraphBaseManager.shared().instantiateDatabase(connectionConfig: config)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ontologyMaintainerViewController = storyboard.instantiateViewController(identifier: String(describing: OntologyMaintainerViewController.self)) as! OntologyMaintainerViewController
        self.present(ontologyMaintainerViewController, animated: true, completion: nil)

    }
}
