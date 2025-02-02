// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RxCocoa-Texture",
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "RxCocoa-Texture",
      targets: ["RxCocoa-Texture"]
    ),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(
      url: "https://github.com/3a4oT/Texture.git", .upToNextMajor(from: "3.0.1")
      // 3.1.0을 써야 하는딩
      // carthage를 제공하게 하고...
      //
    ),
    .package(
      url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.5.0")
    )
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "RxCocoa-Texture",
      path: "RxCocoa-Texture/Classes"
    )
  ],
  swiftLanguageVersions: [.v5]
)
