import UIKit

public class ViewController: UIViewController {

  lazy var imageView = UIImageView()

  public override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(imageView)

    imageView.contentMode = .ScaleAspectFill

    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
    imageView.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
    imageView.rightAnchor.constraintEqualToAnchor(view.rightAnchor).active = true
    imageView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
  }
}
