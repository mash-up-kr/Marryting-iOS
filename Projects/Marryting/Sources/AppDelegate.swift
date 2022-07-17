import UIKit
import GuestList
import DesignSystem

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        Font.registerFonts()
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = TestComponentsViewController()
        viewController.view.backgroundColor = Pallete.Dark.errorRed.color
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }

}
