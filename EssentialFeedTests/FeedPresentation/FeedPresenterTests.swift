//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Fattah, Iram on 10/21/23.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {

    }
}

class FeedPresenterTests: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()

        _ = FeedPresenter(view: view)
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    

    // MARK: Helpeers

    private class ViewSpy {
        let messages = [Any]()
    }
}
