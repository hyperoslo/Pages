import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

      let viewController1 = UIViewController()
      viewController1.view.backgroundColor = UIColor.blackColor()
      viewController1.title = "Controller A"

      let viewController2 = UIViewController()
      viewController2.view.backgroundColor = UIColor.blueColor()
      viewController2.title = "Controller B"

      let viewController3 = UIViewController()
      viewController3.view.backgroundColor = UIColor.redColor()
      viewController3.title = "Controller C"

      let viewController4 = UIViewController()
      viewController4.view.backgroundColor = UIColor.yellowColor()
      viewController4.title = "Controller D"

      let pages = PagesController([viewController1,
        viewController2,
        viewController3,
        viewController4
        ])

      pages.enableSwipe = false
      pages.showBottomLine = true

      let navigationController = UINavigationController(rootViewController: pages)

      pages.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Previous Page",
        style: .Plain,
        target: pages,
        action: "previous")

      pages.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next Page",
        style: .Plain,
        target: pages,
        action: "next")

      window = UIWindow(frame: UIScreen.mainScreen().bounds)
      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()

      return true
    }
}

