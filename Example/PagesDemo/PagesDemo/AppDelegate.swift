import UIKit
import Pages

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    let pages = pagesControllerInCode()
    // let pages = pagesControllerInStoryboard()

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

  func pagesControllerInCode() -> PagesController {

    let viewController1 = UIViewController()
    viewController1.view.backgroundColor = .blackColor()
    viewController1.title = "Controller A"

    let viewController2 = UIViewController()
    viewController2.view.backgroundColor = .blueColor()
    viewController2.title = "Controller B"

    let viewController3 = UIViewController()
    viewController3.view.backgroundColor = .redColor()
    viewController3.title = "Controller C"

    let viewController4 = UIViewController()
    viewController4.view.backgroundColor = .yellowColor()
    viewController4.title = "Controller D"

    let pages = PagesController([viewController1,
      viewController2,
      viewController3,
      viewController4
    ])

    pages.enableSwipe = false
    pages.showBottomLine = true

    return pages
  }

  func pagesControllerInStoryboard() -> PagesController {
    let storyboardIds = ["One","Two"]
    return PagesController(storyboardIds)
  }
}
