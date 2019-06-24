//
//  SwiftUI_Todo_ReduxTests.swift
//  SwiftUI-Todo-ReduxTests
//
//  Created by admin on 6/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import XCTest

class SwiftUI_Todo_ReduxTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEncoding() {
        let json = #"""
        { "id": 1,
         "tasks":
         [  { "id": "UUID1",
            "title": "Task title goes here",
            "isDone": false
        },  {"id": "UUID1",
            "title": "Task title goes here",
            "isDone": false
        }]}
        """#

        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()

        do {
            let object = try decoder.decode(TaskResponseJSON.self, from: data)
            print(object)

            XCTAssertNotNil(object)

        } catch {
            print("JSON decoding error (GET)", TaskResponseJSON.self, error)

            XCTFail()
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
