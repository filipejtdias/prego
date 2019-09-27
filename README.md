# Prego 🔨

[![license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/filipejtdias/prego/blob/master/LICENSE)
[![release](https://img.shields.io/github/release/filipejtdias/prego.svg)](https://github.com/filipejtdias/prego/releases)
![platforms](https://img.shields.io/badge/platforms-iOS-lightgrey.svg)
[![Swift 5.0](https://img.shields.io/badge/Swift-5-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/cocoapods/v/Prego.svg)](https://cocoapods.org/)

## Purpose 🚀

Have you ever heard about DRY? 🤔    
This repository contains small utils and helpers that make our life easier.

## Features ✨

1. **Extensions 🔍**
1. **Log 📝**
1. **Networking 🔗**
1. **Operations 🚦**
1. **Protocols 📖**
1. **Utils 🍿**

## Installation 🔧

Prego supports iOS 11.0+ and requires Xcode 10.2.1  ( Swift 5.0 )    

### CocoaPods

If you use [CocoaPods][] to manage your dependencies, simply add Prego to your `Podfile`:

```ruby
pod 'Prego', '~> 0.5'
```

### Carthage

If you use [Carthage][] to manage your dependencies, simply add Prego to your `Cartfile`:

```
github "filipejtdias/prego" ~> 0.5
```

If you use Carthage to build your dependencies, make sure you have added `Prego.framework` to the 
"_Linked Frameworks and Libraries_" section of your target, and have included them in your Carthage framework copying build 
phase.

### Git Submodule

1. Add this repository as a [submodule][].
1. Drag Prego.xcodeproj into your project or workspace.
1. Link your target against Prego.framework.
1. If linking against an Application target, ensure the framework gets copied into the bundle. If linking against a Framework target, 
the application linking to it should also include Prego.

## Author

Filipe Dias, filipejtdias@gmail.com


[Carthage]: https://github.com/Carthage/Carthage/#readme
[CocoaPods]: https://cocoapods.org/
[submodule]: https://git-scm.com/docs/git-submodule
