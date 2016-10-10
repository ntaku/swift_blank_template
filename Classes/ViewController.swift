
import UIKit
import Photos

class ViewController : BaseController {
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController1"
        createToolbar()
    }
    
    fileprivate func createToolbar() {
        let sp = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,
                                      target: nil,
                                      action: nil)

        let item = UIBarButtonItem.init(title: "Goto Next",
                                        style: UIBarButtonItemStyle.plain,
                                        target: self,
                                        action: #selector(actionNext(_:)))
        
        showToolbar([sp, item, sp])
    }
    
    @objc func actionNext(_ sender: AnyObject) {
        let v = ViewController2.init()
        self.navigationController?.pushViewController(v, animated: true)
    }
}
