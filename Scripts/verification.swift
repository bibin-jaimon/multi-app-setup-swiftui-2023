import Foundation

func getXcodeVersion() -> String? {
    let process = Process()
    let command = "xcrun"
    let arguments = ["xcodebuild", "-version"]
    process.launchPath = "/usr/bin/env"
    process.arguments = [command] + arguments
    let pipe = Pipe()
    process.standardOutput = pipe
    process.launch()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)
    let lines = output?.split(separator: "\n")
    let versionLine = lines?.first(where: { $0.contains("Xcode") })
    let version = versionLine?.split(separator: " ")[1]
    return version.map(String.init)
}

if let version = getXcodeVersion() {
    print("Xcode version: \(version)")
} else {
    print("Xcode is not installed")
}