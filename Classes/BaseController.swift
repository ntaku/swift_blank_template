
import UIKit
import GoogleMobileAds


class BaseController : GAITrackedViewController {
    
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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    
    // -----------------------------------------------------------------------------
    // MARK: - View Setting
    // -----------------------------------------------------------------------------

    
    // iPhone6 landscapeで自動でステータスバーが非表示になるので防ぐ
    // info.plistの View controller-based status bar appearanceをYESにする必要あり
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    func showAdBanner() -> Bool {
        return true
    }

    func showToolbar(items : [UIBarButtonItem]) {
        self.view.addSubview(self.toolbar!)
        self.toolbar?.setItems(items, animated: false)
    }
    
    
    // -----------------------------------------------------------------------------
    // MARK: - LifeCycle
    // -----------------------------------------------------------------------------

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screenName = NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last! as String

        // view config
        self.view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        self.edgesForExtendedLayout = UIRectEdge.None

        // navibar config
        let backButton = UIBarButtonItem.init(title: "",
                                              style: UIBarButtonItemStyle.Plain,
                                              target: nil,
                                              action: nil)
        self.navigationItem.backBarButtonItem = backButton
        self.navigationController?.navigationBar.translucent = false

        // toolbar config
        self.toolbar = UIToolbar.init(frame: CGRect.zero)
        self.toolbar?.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin
        self.toolbar?.translucent = false
        
        // banner config
        initializeAdBanner()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        adjustViewFrame()
        showBannerView()
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        hideBannerView()
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }

    
    // -----------------------------------------------------------------------------
    // MARK: - View Rotation
    // -----------------------------------------------------------------------------

    
    func adjustViewFrame() {
        // toolbar
        if(!self.toolbar!.hidden && self.navigationController != nil){
            let naviRect = self.navigationController!.navigationBar.frame
            let viewRect = self.view.bounds
            let rect = CGRect(x: 0, y: viewRect.size.height-naviRect.size.height, width: viewRect.size.width, height: naviRect.size.height)
            self.toolbar!.frame = rect
            self.view.bringSubviewToFront(self.toolbar!)
        }
    }
    
    // iOS8,9 回転前
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition({ context in self.adjustViewFrame()}, completion: nil)
        if(size.width <= size.height){
            // 回転後、縦向きになった
        }else{
            // 回転後、横向きになった
        }
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }

    // iOS8,9 回転後 ※ただしipadでは呼ばれないので coordinator animateAlongsideTransition で処理しておく
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
    }
    
    
    // -----------------------------------------------------------------------------
    // MARK: - Ad Banner
    // -----------------------------------------------------------------------------
    

    private func initializeAdBanner() {
        if(self.showAdBanner()){
            self.adBannerView = GADBannerView.init(adSize: kGADAdSizeBanner)
            self.adBannerView?.adUnitID = Constant.admobBannerId();
            self.adBannerView?.rootViewController = self
            self.adBannerView?.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 50)
            self.adBannerView?.backgroundColor = UIColor.whiteColor()
            self.adBannerView?.autoresizingMask = UIViewAutoresizing.FlexibleWidth
            showBannerView()
        }
    }
    
    private func showBannerView() {
        if(self.showAdBanner()){
            if(!self.adBannerView!.isDescendantOfView(self.view)){
                self.view.addSubview(self.adBannerView!)
                startBannerRequest()
            }else{
                self.view.bringSubviewToFront(self.adBannerView!)
            }
        }
    }
    
    private func hideBannerView() {
        if(self.showAdBanner()){
            self.adBannerView!.removeFromSuperview()
        }
    }
    
    private func startBannerRequest() {
        if(self.adBannerView != nil){
            let request = GADRequest.init()
            request.testDevices = [kGADSimulatorID]
            self.adBannerView?.loadRequest(request)
        }
    }
}