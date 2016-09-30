import UIKit

class ViewController: UIViewController {

  lazy var imageView = UIImageView()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(imageView)

    imageView.contentMode = .scaleAspectFill

    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}
