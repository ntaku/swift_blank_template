
import UIKit

class ViewController2 : BaseController {

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController2"
    }
    
    func createNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "閉じる",
                                                                     style: UIBarButtonItemStyle.Plain,
                                                                     target: self,
                                                                     action: #selector(actionClose))
    }
    
    @objc private func actionClose() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}