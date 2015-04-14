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

      self.add(pages)
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    self.delegate = self
    self.dataSource = self
    self.goto(self.startPage)
  }
}

// MARK: Public methods
extension PagesController {

  public func goto(index: Int) {
    if index > -1 && index < self.pages.count {
      let viewController = self.pages[index]
      self.currentIndex = index
      self.setViewControllers([viewController],
        direction: (index > self.currentIndex) ? .Forward : .Reverse,
        animated: true, completion: nil)
      if self.setNavigationTitle {
        self.title = viewController.title
      }
    }
  }

  public func next() {
    self.goto(self.currentIndex + 1)
  }

  public func previous() {
    self.goto(self.currentIndex - 1)
  }

  public func add(viewControllers: [UIViewController]) {
    for viewController in viewControllers {
      self.addViewController(viewController)
    }
  }
}

// MARK: UIPageViewControllerDataSource

extension PagesController {

  public func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    let index = prevIndex(viewControllerIndex(viewController))
    return self.pages.at(index)
  }

  public func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    let index: Int? = nextIndex(viewControllerIndex(viewController))
    return self.pages.at(index)
  }

  public func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    return self.pages.count
  }

  public func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    return self.currentIndex
  }

}

// MARK: UIPageViewControllerDelegate

extension PagesController {

  public func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [AnyObject]) {

    if let viewController = pendingViewControllers.first as? UIViewController,
      index = self.viewControllerIndex(viewController) {
        self.currentIndex = index

        if self.setNavigationTitle {
          self.title = viewController.title
        }
    }
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

  private func addViewController(viewController: UIViewController) {
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
}

extension Array {

  func at(index: Int?) -> T? {
    if let index = index where index >= 0 && index < self.endIndex {
      return self[index]
    } else {
      return nil
    }
  }

}

func nextIndex(x: Int?) -> Int? {
  return x.map { $0 + 1 }
}

func prevIndex(x: Int?) -> Int? {
  return x.map { $0 - 1 }
}

