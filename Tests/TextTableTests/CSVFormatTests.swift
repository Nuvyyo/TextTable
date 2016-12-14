//
//  CSVFormatTests.swift
//  TextTable
//
//  Created by Steve Brambilla on 2016-12-14.
//
//

import XCTest
@testable import TextTable

private let testStyle = Style.csv

class CSVFormatTests: XCTestCase {

	func testPerformanceExample() {
		self.measure {
			let _ = table.string(for: data, style: testStyle)
		}
	}

	func testTable() {
		let expectedOutput = "" +
			"Name,Age,Birthday,Notes,Notes\n" +
			"Alice,42,8/14/16,Lorem ips…,… rhoncus.\n" +
			"Bob,22,8/14/16,Nunc vari…,…enenatis.\n" +
			"Eve,142,8/14/16,Etiam qui…,…ulus mus.\n" +
		""
		let s = table.string(for: data, style: testStyle)!
		XCTAssertEqual(s, expectedOutput)
	}

}
