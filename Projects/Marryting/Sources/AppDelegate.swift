import UIKit
import DesignSystem

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = TestComponentViewController()
        viewController.view.backgroundColor = Pallete.Dark.errorRed.color
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }

}
