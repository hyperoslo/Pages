import UIKit
import Pages

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let pages = pagesControllerInCode()
    // let pages = pagesControllerInStoryboard()

    let navigationController = UINavigationController(rootViewController: pages)

    pages.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Previous Page",
      style: .plain,
      target: pages,
      action: #selector(PagesController.moveBack))

    pages.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next Page",
      style: .plain,
      target: pages,
      action: #selector(PagesController.moveForward))

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()

    return true
  }

  private func pagesControllerInCode() -> PagesController {
    var viewControllers: [UIViewController] = []

    for i in 0..<5 {
      if let imageURL = URL(string: "https://unsplash.it/375/667/?image=\(i+10)") {
        let viewController = ViewController()        
        viewController.imageView.setImage(url: imageURL)

        viewControllers.append(viewController)
      }
    }

    let pages = PagesController(viewControllers)

    pages.enableSwipe = true
    pages.showBottomLine = true

    return pages
  }

  private func pagesControllerInStoryboard() -> PagesController {
    let storyboardIds = ["One","Two"]
    return PagesController(storyboardIds)
  }
}
