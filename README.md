# Image Loader Library for iOS

[![Build Status](https://travis-ci.com/zambelz48/ZIMGLoader.svg?branch=master)](https://travis-ci.com/zambelz48/ZIMGLoader)
![Platform](https://img.shields.io/badge/platforms-iOS-blue.svg)
![Languages](https://img.shields.io/badge/languages-Swift-blue.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Installation

#### [Carthage](https://github.com/Carthage/Carthage)
Create a file named `Cartfile` inside your root project, and add this to the `Cartfile` :
```
github "zambelz48/ZIMGLoader" "v1.0.0"
```

## Usages

#### Simple
```
let option = ImageRequestOption(
	urlString: "http://www.image-url.com",
	placeholderImage: nil,
	loadingIndicator: nil
)

imageView.loadImage(with: option)
```

#### Add placeholder image and indicator view
```
let placeholderImage = UIImage(named: "your_placeholder_image")

let indicatorView = UIActivityIndicatorView(style: .whiteLarge)
indicatorView.startAnimating()

let option = ImageRequestOption(
	urlString: "http://www.image-url.com",
	placeholderImage: placeholderImage,
	loadingIndicator: indicatorView
)

imageView.loadImage(with: option)
```
