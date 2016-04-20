
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
    
    private func createToolbar() {
        let sp = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace,
                                      target: nil,
                                      action: nil)

        let item = UIBarButtonItem.init(title: "Goto Next",
                                        style: UIBarButtonItemStyle.Plain,
                                        target: self,
                                        action: #selector(actionNext(_:)))
        
        showToolbar([sp, item, sp])
    }
    
    @objc func actionNext(sender: AnyObject) {
        let v = ViewController2.init()
        self.navigationController?.pushViewController(v, animated: true)
    }
}