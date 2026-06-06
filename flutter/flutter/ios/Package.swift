// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

// This Package.swift adds Swift Package Manager (SPM) support to the ffmpeg_kit_flutter
// iOS plugin while keeping the existing CocoaPods podspec as a fallback for projects
// that have not yet migrated to SPM.
//
// Only the 'https' variant is supported via SPM, as it is the only one with
// locally vendored xcframeworks. Other variants (min, audio, video, full) depended
// on CocoaPod specs from the now-retired arthenica/ffmpeg-kit project.

import PackageDescription

let package = Package(
    name: "ffmpeg_kit_flutter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ffmpeg-kit-flutter",
            targets: ["ffmpeg_kit_flutter"]
        )
    ],
    targets: [
        // MARK: - Binary targets (vendored xcframeworks — https variant)

        .binaryTarget(
            name: "ffmpegkit",
            path: "Frameworks/ffmpeg-kit-ios-https/ffmpegkit.xcframework"
        ),
        .binaryTarget(
            name: "libavcodec",
            path: "Frameworks/ffmpeg-kit-ios-https/libavcodec.xcframework"
        ),
        .binaryTarget(
            name: "libavdevice",
            path: "Frameworks/ffmpeg-kit-ios-https/libavdevice.xcframework"
        ),
        .binaryTarget(
            name: "libavfilter",
            path: "Frameworks/ffmpeg-kit-ios-https/libavfilter.xcframework"
        ),
        .binaryTarget(
            name: "libavformat",
            path: "Frameworks/ffmpeg-kit-ios-https/libavformat.xcframework"
        ),
        .binaryTarget(
            name: "libavutil",
            path: "Frameworks/ffmpeg-kit-ios-https/libavutil.xcframework"
        ),
        .binaryTarget(
            name: "libswresample",
            path: "Frameworks/ffmpeg-kit-ios-https/libswresample.xcframework"
        ),
        .binaryTarget(
            name: "libswscale",
            path: "Frameworks/ffmpeg-kit-ios-https/libswscale.xcframework"
        ),

        // MARK: - Plugin target (Objective-C sources)

        .target(
            name: "ffmpeg_kit_flutter",
            dependencies: [
                "ffmpegkit",
                "libavcodec",
                "libavdevice",
                "libavfilter",
                "libavformat",
                "libavutil",
                "libswresample",
                "libswscale",
            ],
            path: "Classes",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        )
    ]
)
