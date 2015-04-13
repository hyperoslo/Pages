import UIKit

@objc(HYPPagesController) public class PagesController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

  public var startPage = 0
  public var setNavigationTitle = true

  public var enableSwipe = true {
    didSet {
      self.toggle()
    }
  }

  lazy var pages = Array<UIViewController>()

  var currentIndex: Int = 0

  public convenience init(_ pages: [UIViewController],
    transitionStyle: UIPageViewControllerTransitionStyle = .Scroll,
    navigationOrientation: UIPageViewControllerNavigationOrientation = .Horizontal,
    options: [NSObject : AnyObject]? = nil) {
      self.init(transitionStyle: transitionStyle,
        navigationOrientation: navigationOrientation,
        options: options)

      self.pages = pages
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    self.delegate = self
    self.dataSource = self
    self.goToPage(self.startPage)
  }
}

// MARK: Public methods
extension PagesController {

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
    for viewController in viewControllers {
      self.addPage(viewController)
    }
  }
}

// MARK: UIPageViewControllerDataSource

extension PagesController {

  public func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    if let index = prev(viewControllerIndex(viewController)) where index > 0 {
      return self.pages[index]
    }
    return nil
  }

  public func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    if let index = next(viewControllerIndex(viewController)) where index < self.pages.count {
      return self.pages[index]
    }
    return nil
  }

  public func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    return self.pages.count
  }

  public func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    return 0
  }
}

// MARK: UIPageViewControllerDelegate

extension PagesController {

  public func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [AnyObject]) {
    let viewController = pendingViewControllers.first as! UIViewController
    let index = self.viewControllerIndex(viewController)

    if self.setNavigationTitle {
      self.title = viewController.title
    }

    self.currentIndex = index!
  }
}

// MARK: Private methods

extension PagesController {

  func viewControllerIndex(viewController: UIViewController) -> Int? {
    return find(self.pages, viewController)
  }

  private func toggle() {
    for recognizer in self.gestureRecognizers {
      (recognizer as! UIGestureRecognizer).enabled = self.enableSwipe
    }
  }
}

func next(x: Int?) -> Int? {
  return x.map { $0 + 1}
}

func prev(x: Int?) -> Int? {
  return x.map { $0 - 1}
}
