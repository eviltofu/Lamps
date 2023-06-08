//
//  LampsTests.swift
//  LampsTests
//
//  Created by Jerome Chan on 8/6/23.
//

import XCTest
@testable import Lamps

final class LampsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidatePassCode() throws {
        let m = PassCodeModel(passCodeString: "hello")
        XCTAssertFalse(m.validate(passCodeString: "goodbye"))
        XCTAssertTrue(m.validate(passCodeString: "hello"))
    }
}
