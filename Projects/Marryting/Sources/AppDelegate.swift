import DesignSystem
import GuestListScene
import LikeRequestScene
import LoginScene
import UIKit
import ProfileRegister
import GuestDetailScene

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        Font.registerFonts()
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        navigationController.pushViewController(ProfileRegisterViewController(), animated: true)

        return true
    }

}
