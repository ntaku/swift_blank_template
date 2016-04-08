
import UIKit

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
    
    @objc func actionNext(sender : AnyObject) {
        let sheet = ActionSheet.init(title: "How To?",
                                     items: ["Push", "Modal", "Cancel"],
                                     delegate: self,
                                     cancelIndex: 2,
                                     destructiveIndex: -1,
                                     tag: 0,
                                     direction: UIPopoverArrowDirection.Down)
        sheet.showFromBarButton(sender)
    }
    
    override func actionSheetSelected(tag:Int, buttonAtIndex:Int) {
        Logger.d("actionSheetSelected tag \(tag), buttonAtIndex \(buttonAtIndex)");
        
        if(buttonAtIndex == 0){
            let v = ViewController2.init()
            self.navigationController?.pushViewController(v, animated: true)
            
        }else if(buttonAtIndex == 1){
            let v = ViewController2.init()
            v.createNavigationBar()
            let n = UINavigationController.init(rootViewController: v)
            self.presentViewController(n, animated: true, completion: nil)
        }
    }
}