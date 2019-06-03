# Image Loader Library for iOS

[![Build Status](https://travis-ci.com/zambelz48/ZIMGLoader.svg?branch=master)](https://travis-ci.com/zambelz48/ZIMGLoader)
![Platform](https://img.shields.io/badge/platforms-iOS-blue.svg)
![Languages](https://img.shields.io/badge/languages-Swift-blue.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## About
A very simple iOS image loader library written in `Swift` with in-memory cache support using `NSCache`.

## Installation

#### [Carthage](https://github.com/Carthage/Carthage)
Create a file named `Cartfile` inside your root project, and add this to the `Cartfile` :
```
github "zambelz48/ZIMGLoader" "v1.0.0"
```
Open terminal and execute this :
```bash
carthage update --platform iOS
```

## Usages

#### Simple
```swift
let option = ImageRequestOption(
	urlString: "http://www.image-url.com",
	placeholderImage: nil,
	loadingIndicator: nil
)

imageView.loadImage(with: option)
```

#### Add placeholder image and indicator view
```swift
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

#### Finished callback
```swift
...

imageView.loadImage(with: option) {
	print("Finish load image")
}
```

## Options
```swift
let option = ImageRequestOption(
	urlString: "", // Image url (Mandatory)
	placeholderImage: UIImage?, // Placeholder image (Optional)
	loadingIndicator: UIView?, // Indicator view when loading an image (Optional)
	contentMode: UIView.ContentMode, // Content mode (default value is : `.scaleToFill`)
	cached: Bool // Flag whether the image should store in cache (default value is : `true`)
)
```

## Cache support
This library is used `NSCache`, which is only support in-memory cache strategy. And by default every successful download operation the image will be stored in cache. If you don't want to store in cache, set `cached` flag in `ImageRequestOption` into `false`.

#### Set maximum capacity of the cache
```swift
let desiredMaxCapacity = 200 // in MB
ImageCacheHandler.shared.setCache(maxCapacity: desiredMaxCapacity)
```

#### Clearing caches
```
ImageCacheHandler.shared.clearCachedImages()
```