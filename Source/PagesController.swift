import UIKit

@objc(HYPPagesController) public class PagesController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

  public var startPage = 0
  public var setNavigationTitle = true

  public var enableSwipe = true {
    didSet {
      self.toggle()
    }
  }

  lazy var pages: Array<UIViewController> = {
    return []
    }()

  var currentIndex: Int = 0

  public convenience init(_ pages: [UIViewController],
    transitionStyle: UIPageViewControllerTransitionStyle,
    navigationOrientation: UIPageViewControllerNavigationOrientation,
    options: [NSObject : AnyObject]?) {
      self.init(transitionStyle: transitionStyle,
        navigationOrientation: navigationOrientation,
        options: options)

      self.pages = pages
  }


  public convenience init(_ pages: [UIViewController]) {
    self.init(transitionStyle: .Scroll,
      navigationOrientation: .Horizontal,
      options: nil)
    self.pages = pages
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    self.delegate = self
    self.dataSource = self
    self.goToPage(self.startPage)
  }

  // MARK: Public methods

  public func goToPage(index: Int) {
    if index > -1 && index < self.pages.count {
      let viewController = self.pages[index]
      self.setViewControllers([viewController],
        direction: (index > self.currentIndex) ? .Forward : .Reverse,
        animated: true, completion: nil)
      self.currentIndex = index
      if self.setNavigationTitle {
        self.title = viewController.title
      }
    }
  }

  public func nextPage() {
    self.goToPage(self.currentIndex + 1)
  }

  public func previousPage() {
    self.goToPage(self.currentIndex - 1)
  }

  public func addPage(viewController: UIViewController) {
    self.pages.append(viewController)

    if self.pages.count == 1 {
      self.setViewControllers([viewController],
        direction: .Forward,
        animated: true,
        completion: nil)
      if self.setNavigationTitle {
        self.title = viewController.title
      }
    }
  }

  public func addPages(viewControllers: [UIViewController]) {
    for viewController: UIViewController in viewControllers {
      self.addPage(viewController)
    }
  }

  // MARK: UIPageViewControllerDataSource

  public func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    var index = viewControllerIndex(viewController)
    if index == 0 {
      return nil
    } else {
      index--
      return self.viewControllerAtIndex(index)
    }
  }

  public func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    var index = viewControllerIndex(viewController)

    index++

    if index == self.pages.count {
      return nil
    } else {
      return self.viewControllerAtIndex(index)
    }
  }

  public func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    return self.pages.count
  }

  public func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    return 0
  }

  // MARK: UIPageViewControllerDelegate

  public func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [AnyObject]) {
    let viewController = pendingViewControllers.first! as! UIViewController
    let index = self.viewControllerIndex(viewController)

    if self.setNavigationTitle {
      self.title = viewController.title
    }

    self.currentIndex = index
  }

  // MARK: Private methods

  func viewControllerIndex(viewController: UIViewController) -> Int {
    let viewControllers: NSArray = self.pages

    return viewControllers.indexOfObject(viewController)
  }

  func viewControllerAtIndex(index: NSInteger) -> UIViewController {
    return self.pages[index]
  }

  private func toggle() {
    for recognizer in self.gestureRecognizers {
      (recognizer as! UIGestureRecognizer).enabled = self.enableSwipe
    }
  }

}
