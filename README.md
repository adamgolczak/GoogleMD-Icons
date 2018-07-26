# GoogleMD-Icons

[![CI Status](https://img.shields.io/travis/adamgolczak/GoogleMD-Icons.svg?style=flat)](https://travis-ci.org/adamgolczak/GoogleMD-Icons)
[![Version](https://img.shields.io/cocoapods/v/GoogleMD-Icons.svg?style=flat)](https://cocoapods.org/pods/GoogleMD-Icons)
[![License](https://img.shields.io/cocoapods/l/GoogleMD-Icons.svg?style=flat)](https://cocoapods.org/pods/GoogleMD-Icons)
[![Platform](https://img.shields.io/cocoapods/p/GoogleMD-Icons.svg?style=flat)](https://cocoapods.org/pods/GoogleMD-Icons)

Easy way to use Google Material Design Icons in your app.

## Requirements

- iOS 9.0+
- Xcode 8

## Installation

### CocoaPods

Make sure you have the latest version of CocoaPods by running:

```bash
$ gem install cocoapods
```

Update your local specs repo by running:

```bash
$ pod repo update
```

Add the following lines to your `Podfile`:

```ruby
target 'YourProject' do
use_frameworks!
pod 'GoogleMD-Icons'
end
```

Then run the following command

```bash
$ pod install
```

You can start using the library by importing it wherever you want

```swift
import GoogleMD_Icons
```

### UIImage

```Swift
import GoogleMD_Icons

// Set icon
imageView.image = UIImage.googleMDIcon(icon: .accountBalance, size: CGSize(width: 150.0, height: 150.0))

// Set icon with color
imageView.image = UIImage.googleMDIcon(icon: .accountBalance, size: CGSize(width: 150.0, height: 150.0), color: .orange)

// Set icon with color and icon code
imageView.image = UIImage.googleMDIcon(icon: GoogleMDIconType(name: "accountBalance")!, size: CGSize(width: 150.0, height: 150.0), color: .orange)

```


### UIImageView

```Swift
import GoogleMD_Icons

// Set icon
imageView = UIImageView.googleMDIcon(icon: .accountBalance, size: CGSize(width: 150.0, height: 150.0))

// Set icon with color
imageView = UIImageView.googleMDIcon(icon: .accountBalance, size: CGSize(width: 150.0, height: 150.0), color: .orange)

// Set icon with color and icon code
imageView = UIImageView.googleMDIcon(icon: GoogleMDIconType(name: "accountBalance")!, size: CGSize(width: 150.0, height: 150.0), color: .orange)


```

## Author

Adam Golczak
- adam@pxlborn.com

## License

GoogleMD-Icons is available under the MIT license. See the LICENSE file for more info.
