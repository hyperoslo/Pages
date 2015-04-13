# Pages

[![CI Status](http://img.shields.io/travis/hyperoslo/Pages.svg?style=flat)](https://travis-ci.org/hyperoslo/Pages)
[![Version](https://img.shields.io/cocoapods/v/Pages.svg?style=flat)](http://cocoadocs.org/docsets/Pages)
[![License](https://img.shields.io/cocoapods/l/Pages.svg?style=flat)](http://cocoadocs.org/docsets/Pages)
[![Platform](https://img.shields.io/cocoapods/p/Pages.svg?style=flat)](http://cocoadocs.org/docsets/Pages)

Pages is probably the easiest way of setting up a `UIPageViewController`. It also comes with some convenience methods like, disabling swipe, go to a specific page and navigate backwards and forwards. And best of all, you don't have to make your own custom `UIViewController` to keep an index, Pages handles that for you. It just works.

## Usage

```swift
let viewController1 = UIViewController()
viewController1.title = "Controller A"

let viewController2 = UIViewController()
viewController2.title = "Controller B"

let pages = PagesController([viewController1, viewController2])
```

## Installation

**Pages** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Pages'
```

## Author

Hyper, ios@hyper.no

## License

**Pages** is available under the MIT license. See the LICENSE file for more info.
