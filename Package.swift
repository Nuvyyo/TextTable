// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "TextTable",
    products: [
    	.library(name: "TextTable", targets: ["TextTable"]),
  	],
    targets: [
        .target(name: "TextTable", path: "Sources"),
    ]
)
