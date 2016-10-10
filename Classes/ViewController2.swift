
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
                                                                     style: UIBarButtonItemStyle.plain,
                                                                     target: self,
                                                                     action: #selector(actionClose))
    }
    
    @objc fileprivate func actionClose() {
        self.dismiss(animated: true, completion: nil)
    }
}
