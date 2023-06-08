//
//  LampsUIPassCodeTests.swift
//  LampsUIPassCodeTests
//
//  Created by Jerome Chan on 8/6/23.
//

import XCTest

final class LampsUIPassCodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPassCodeCreateOk() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchEnvironment[TestLauncher.TestPhrase] = "ON"
        app.launchEnvironment[TestLauncher.VCPhrase] = TestLauncherViewControllers.PassCode.rawValue
        app.launchEnvironment[TestLauncher.ModelPhrase] = TestLauncherModels.PassCode1.rawValue

        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let l1 = app.staticTexts["titleLabel"]
        let f1 = app.secureTextFields["field1"]
        let f2 = app.secureTextFields["field2"]
        let f3 = app.secureTextFields["field3"]
        let b1 = app.buttons["ok"]
        XCTAssert(l1.exists)
        XCTAssertTrue(f1.exists)
        XCTAssertTrue(f2.exists)
        XCTAssertFalse(f3.exists)
        XCTAssertTrue(b1.exists)
        f1.tap()
        f1.typeText("appleworks1")
        f2.tap()
        f2.typeText("appleworks1")
        b1.tap()
        XCTAssertFalse(l1.exists)
    }

    func testPassCodeCreateError() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchEnvironment[TestLauncher.TestPhrase] = "ON"
        app.launchEnvironment[TestLauncher.VCPhrase] = TestLauncherViewControllers.PassCode.rawValue
        app.launchEnvironment[TestLauncher.ModelPhrase] = TestLauncherModels.PassCode1.rawValue

        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let l1 = app.staticTexts["titleLabel"]
        let f1 = app.secureTextFields["field1"]
        let f2 = app.secureTextFields["field2"]
        let f3 = app.secureTextFields["field3"]
        let b1 = app.buttons["ok"]
        XCTAssert(l1.exists)
        XCTAssertTrue(f1.exists)
        XCTAssertTrue(f2.exists)
        XCTAssertFalse(f3.exists)
        XCTAssertTrue(b1.exists)
        f1.tap()
        f1.typeText("appleworks1")
        f2.tap()
        f2.typeText("appleworks2")
        b1.tap()
        XCTAssertTrue(app.alerts["Error"].exists)
    }

    func testPassCodeValidateOk() throws {
        let app = XCUIApplication()
        app.launchEnvironment[TestLauncher.TestPhrase] = "ON"
        app.launchEnvironment[TestLauncher.VCPhrase] = TestLauncherViewControllers.PassCode.rawValue
        app.launchEnvironment[TestLauncher.ModelPhrase] = TestLauncherModels.PassCode2.rawValue

        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let l1 = app.staticTexts["titleLabel"]
        let f1 = app.secureTextFields["field1"]
        let f2 = app.secureTextFields["field2"]
        let f3 = app.secureTextFields["field3"]
        let b1 = app.buttons["ok"]
        XCTAssert(l1.exists)
        XCTAssertTrue(f1.exists)
        XCTAssertFalse(f2.exists)
        XCTAssertFalse(f3.exists)
        XCTAssertTrue(b1.exists)

        f1.tap()
        f1.typeText("parislondon")
        b1.tap()
        XCTAssertFalse(l1.exists)
    }

    func testPassCodeValidateError() throws {
        let app = XCUIApplication()
        app.launchEnvironment[TestLauncher.TestPhrase] = "ON"
        app.launchEnvironment[TestLauncher.VCPhrase] = TestLauncherViewControllers.PassCode.rawValue
        app.launchEnvironment[TestLauncher.ModelPhrase] = TestLauncherModels.PassCode2.rawValue

        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let l1 = app.staticTexts["titleLabel"]
        let f1 = app.secureTextFields["field1"]
        let f2 = app.secureTextFields["field2"]
        let f3 = app.secureTextFields["field3"]
        let b1 = app.buttons["ok"]
        XCTAssert(l1.exists)
        XCTAssertTrue(f1.exists)
        XCTAssertFalse(f2.exists)
        XCTAssertFalse(f3.exists)
        XCTAssertTrue(b1.exists)

        f1.tap()
        f1.typeText("parislondon1")
        b1.tap()
        XCTAssertTrue(app.alerts["Error"].exists)
    }

    func testPassCodeEditOk() throws {
        let app = XCUIApplication()
        app.launchEnvironment[TestLauncher.TestPhrase] = "ON"
        app.launchEnvironment[TestLauncher.VCPhrase] = TestLauncherViewControllers.PassCode.rawValue
        app.launchEnvironment[TestLauncher.ModelPhrase] = TestLauncherModels.PassCode3.rawValue

        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let l1 = app.staticTexts["titleLabel"]
        let f1 = app.secureTextFields["field1"]
        let f2 = app.secureTextFields["field2"]
        let f3 = app.secureTextFields["field3"]
        let b1 = app.buttons["ok"]
        XCTAssert(l1.exists)
        XCTAssertTrue(f1.exists)
        XCTAssertTrue(f2.exists)
        XCTAssertTrue(f3.exists)
        XCTAssertTrue(b1.exists)

        f1.tap()
        f1.typeText("marsvenus")
        f2.tap()
        f2.typeText("morningafternoon")
        f3.tap()
        f3.typeText("morningafternoon")
        b1.tap()
        XCTAssertFalse(l1.exists)
    }

    func testPassCodeEditValidationFail() throws {
        let app = XCUIApplication()
        app.launchEnvironment[TestLauncher.TestPhrase] = "ON"
        app.launchEnvironment[TestLauncher.VCPhrase] = TestLauncherViewControllers.PassCode.rawValue
        app.launchEnvironment[TestLauncher.ModelPhrase] = TestLauncherModels.PassCode3.rawValue

        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let l1 = app.staticTexts["titleLabel"]
        let f1 = app.secureTextFields["field1"]
        let f2 = app.secureTextFields["field2"]
        let f3 = app.secureTextFields["field3"]
        let b1 = app.buttons["ok"]
        XCTAssert(l1.exists)
        XCTAssertTrue(f1.exists)
        XCTAssertTrue(f2.exists)
        XCTAssertTrue(f3.exists)
        XCTAssertTrue(b1.exists)

        f1.tap()
        f1.typeText("mercuryjupiter")
        f2.tap()
        f2.typeText("morningafternoon")
        f3.tap()
        f3.typeText("morningafternoon")
        b1.tap()
        XCTAssertTrue(app.alerts["Error"].exists)
    }

    func testPassCodeEditCreationFail() throws {
        let app = XCUIApplication()
        app.launchEnvironment[TestLauncher.TestPhrase] = "ON"
        app.launchEnvironment[TestLauncher.VCPhrase] = TestLauncherViewControllers.PassCode.rawValue
        app.launchEnvironment[TestLauncher.ModelPhrase] = TestLauncherModels.PassCode3.rawValue

        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let l1 = app.staticTexts["titleLabel"]
        let f1 = app.secureTextFields["field1"]
        let f2 = app.secureTextFields["field2"]
        let f3 = app.secureTextFields["field3"]
        let b1 = app.buttons["ok"]
        XCTAssert(l1.exists)
        XCTAssertTrue(f1.exists)
        XCTAssertTrue(f2.exists)
        XCTAssertTrue(f3.exists)
        XCTAssertTrue(b1.exists)

        f1.tap()
        f1.typeText("marsvenus")
        f2.tap()
        f2.typeText("morningafternoon1")
        f3.tap()
        f3.typeText("morningafternoon2")
        b1.tap()
        XCTAssertTrue(app.alerts["Error"].exists)
    }}
