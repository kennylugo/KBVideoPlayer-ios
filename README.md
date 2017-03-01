# KBVideoPlayer

```KBVideoPlayer``` is a simple iOS video player written entirely in Swift that is highly customizable through storyboards!

[![CI Status](http://img.shields.io/travis/kennybatista/KBVideoPlayer.svg?style=flat)](https://travis-ci.org/kennybatista/KBVideoPlayer)
[![Version](https://img.shields.io/cocoapods/v/KBVideoPlayer.svg?style=flat)](http://cocoapods.org/pods/KBVideoPlayer)
[![License](https://img.shields.io/cocoapods/l/KBVideoPlayer.svg?style=flat)](http://cocoapods.org/pods/KBVideoPlayer)
[![Platform](https://img.shields.io/cocoapods/p/KBVideoPlayer.svg?style=flat)](http://cocoapods.org/pods/KBVideoPlayer)

![Promo](https://github.com/kennybatista/ui-components/blob/master/UICustomKennyVideoPlayer/uikennyvideoplayer.gif)


## Usage - XCode 8 / Swift 3

Hi! Thanks for checking out my component. Let me teach you how it works :)

``` swift
let linkToVideo = URL(string: "https://goo.gl/qLRdBp")
let videoPlayer = KBVideoPlayerViewController(urlToPlayMediaFrom: linkToVideo!)
present(videoPlayer, animated: true, completion: nil)

// That's it! Super easy right? 
```

## Installation

### CocoaPods

``` ruby
pod 'KBVideoPlayer'
```

### Manual

Add **KBVideoPlayerViewController.swift** and **KBVideoPlayerView.xib** folder into your project.

## Contribution

Please feel free to submit pull requests. I think there are many other functionalities and things that we can do to improve this component.

## Author

Kenny Batista

- https://github.com/kennybatista
- https://twitter.com/kennybatista
- kennybatista7@gmail.com

## License

KBVideoPlayer is available under the MIT license. See the LICENSE file for more info.
