
import UIKit
import GoogleMobileAds


class BaseController : UIViewController {
    
    var toolbar : UIToolbar?
    var adBannerView : GADBannerView?

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // -----------------------------------------------------------------------------
    // MARK: - Initializer
    // -----------------------------------------------------------------------------

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    
    // -----------------------------------------------------------------------------
    // MARK: - View Setting
    // -----------------------------------------------------------------------------

    
    // iPhone6 landscapeで自動でステータスバーが非表示になるので防ぐ
    // info.plistの View controller-based status bar appearanceをYESにする必要あり
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func showAdBanner() -> Bool {
        return true
    }

    func showToolbar(_ items : [UIBarButtonItem]) {
        self.view.addSubview(self.toolbar!)
        self.toolbar?.setItems(items, animated: false)
    }
    
    
    // -----------------------------------------------------------------------------
    // MARK: - LifeCycle
    // -----------------------------------------------------------------------------

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // view config
        self.view.backgroundColor = UIColor.background
        self.automaticallyAdjustsScrollViewInsets = false

        // navibar config
        let backButton = UIBarButtonItem.init(title: "",
                                              style: UIBarButtonItemStyle.plain,
                                              target: nil,
                                              action: nil)
        self.navigationItem.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isTranslucent = false

        // toolbar config
        self.toolbar = UIToolbar.init(frame: CGRect.zero)
        self.toolbar?.autoresizingMask = UIViewAutoresizing.flexibleTopMargin
        self.toolbar?.isTranslucent = false
        
        // banner config
        initializeAdBanner()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        hideBannerView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustViewFrame()
        showBannerView()
    }

    
    // -----------------------------------------------------------------------------
    // MARK: - View Rotation
    // -----------------------------------------------------------------------------

    
    func adjustViewFrame() {
        // toolbar
        if(!self.toolbar!.isHidden && self.navigationController != nil){
            let naviRect = self.navigationController!.navigationBar.frame
            let viewRect = self.view.bounds
            let rect = CGRect(x: 0, y: viewRect.size.height-naviRect.size.height, width: viewRect.size.width, height: naviRect.size.height)
            self.toolbar!.frame = rect
            self.view.bringSubview(toFront: self.toolbar!)
        }
    }
    
    // iOS8,9 回転前
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in self.adjustViewFrame()}, completion: nil)
        if(size.width <= size.height){
            // 回転後、縦向きになった
        }else{
            // 回転後、横向きになった
        }
        super.viewWillTransition(to: size, with: coordinator)
    }

    // iOS8,9 回転後 ※ただしipadでは呼ばれないので coordinator animateAlongsideTransition で処理しておく
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    }
    
    
    // -----------------------------------------------------------------------------
    // MARK: - Ad Banner
    // -----------------------------------------------------------------------------
    

    fileprivate func initializeAdBanner() {
        if(self.showAdBanner()){
            self.adBannerView = GADBannerView.init(adSize: kGADAdSizeBanner)
            self.adBannerView?.adUnitID = Constant.admobBannerId;
            self.adBannerView?.rootViewController = self
            self.adBannerView?.frame = CGRect(x: 0, y: 0, width: (self.view.frame).width, height: 50)
            self.adBannerView?.backgroundColor = UIColor.white
            self.adBannerView?.autoresizingMask = UIViewAutoresizing.flexibleWidth
            showBannerView()
        }
    }
    
    fileprivate func showBannerView() {
        if(self.showAdBanner()){
            if(!self.adBannerView!.isDescendant(of: self.view)){
                self.view.addSubview(self.adBannerView!)
                startBannerRequest()
            }else{
                self.view.bringSubview(toFront: self.adBannerView!)
            }
        }
    }
    
    fileprivate func hideBannerView() {
        if(self.showAdBanner()){
            self.adBannerView!.removeFromSuperview()
        }
    }
    
    fileprivate func startBannerRequest() {
        if(self.adBannerView != nil){
            let request = GADRequest.init()
            request.testDevices = [kGADSimulatorID]
            self.adBannerView?.load(request)
        }
    }
}
