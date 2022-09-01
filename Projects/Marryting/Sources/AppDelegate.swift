import DesignSystem
import GuestListScene
import LikeRequestScene
import LoginScene
import UIKit
import ProfileRegister
import GuestDetailScene
import MyGuestListScene
import AuthCodeScene
import LikeRequestCompleteScene
import SplashScene
import ProfileRegisterCompleteScene
import KakaoSDKAuth
import KakaoSDKCommon

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        KakaoSDK.initSDK(appKey: "bd614625345b00170f51b167c97e96e9")
        Font.registerFonts()
        registerNotification()
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        navigationController.pushViewController(SplashViewController(), animated: true)
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }

        return false
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(logout(_:)), name: NSNotification.Name("LogoutNotification"), object: nil)
    }
    
    @objc func logout(_ notification: Notification) {
        DispatchQueue.main.async {
            let loginViewController = LoginViewController()
            let navigationController = UINavigationController(rootViewController: loginViewController)
            navigationController.isNavigationBarHidden = true
            self.window?.rootViewController = navigationController
        }
    }
}
