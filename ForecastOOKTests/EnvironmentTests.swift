//
//  EnvironmentTests.swift
//  ForecastOOKTests
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import XCTest
@testable import ForecastOOK

final class EnvironmentTests: XCTestCase {

    var sut: Environment!
    
    override func setUpWithError() throws {
        sut = Environment(resourceName: "Test-API-Keys")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_apiKey_shouldNotBeNilOrEmpty() {
        XCTAssertEqual(sut.apiKey, TestData.apiKey)
    }
}

private enum TestData {
    static let apiKey = "123456789"
}
