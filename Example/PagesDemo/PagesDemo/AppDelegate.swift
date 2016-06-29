import UIKit
import Pages
import Imaginary

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
      action: #selector(PagesController.previous))

    pages.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next Page",
      style: .Plain,
      target: pages,
      action: #selector(PagesController.next))

    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    return true
  }

  func pagesControllerInCode() -> PagesController {

    var viewControllers: [UIViewController] = []

    for i in 0..<5 {
      if let imageURL = NSURL(string: "https://unsplash.it/375/667/?image=\(i+10)") {
	let viewController = ViewController()
	viewController.imageView.setImage(imageURL)

	viewControllers.append(viewController)
      }
    }

    let pages = PagesController(viewControllers)

    pages.enableSwipe = true
    pages.showBottomLine = true

    return pages
  }

  func pagesControllerInStoryboard() -> PagesController {
    let storyboardIds = ["One","Two"]
    return PagesController(storyboardIds)
  }
}
