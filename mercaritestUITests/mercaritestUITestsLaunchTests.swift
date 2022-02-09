//
//  mercaritestUITestsLaunchTests.swift
//  mercaritestUITests
//
//  Created by Varun Raj on 2022/02/01.
//

import XCTest

class mercaritestUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
    
        let mercariApp = XCUIApplication(bundleIdentifier: "com.kouzoh.ios.mercari")
        mercariApp.launch()
        
    }
}
