//
//  testKVOBindableTests.swift
//  testKVOBindableTests
//
//  Created by Filipe Dias on 15/04/2021.
//

import XCTest
@testable import testKVOBindable

class testKVOBindableTests: XCTestCase {

    var sut: ViewModel!
    var expectedArray: [String]!
    var totalElements: Int!
    var cycle: Int!
    
    override func setUpWithError() throws {
        sut = ViewModel(title: "some")
        expectedArray = []
        cycle = sut.cycle
    }

    override func tearDownWithError() throws {
        totalElements = nil
        expectedArray = nil
        sut = nil
    }

    func testRun1Time() throws {
     
        runTest(expectation: "run once", numberOfTimes: 1)
    }
    
    func testRun2Times() throws {
     
        runTest(expectation: "run 2 times", numberOfTimes: 2)
    }
    
    func testRunNTimes() throws {
     
        runTest(expectation: "multiple times", numberOfTimes: 10)
    }
    
    private func runTest(expectation: String,
                         numberOfTimes: Int) {
        
        // Given
        totalElements = cycle * numberOfTimes
        let expectation = XCTestExpectation(description: expectation)
        expectation.expectedFulfillmentCount = numberOfTimes
        
        for nCycle in 1...numberOfTimes {
            
            for i in 1...cycle {
                let random = "\(nCycle) | \(i)"
                expectedArray.append(random)
            }
            
        }
        
        // When
        for _ in 1...numberOfTimes {
            sut.buttonPressed {
                expectation.fulfill()
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 60.0)
        XCTAssertEqual(sut.result.count, totalElements)
        XCTAssertEqual(sut.result.sorted(), expectedArray.sorted())
    }

}
