//
//  FilmInfoViewerTests.swift
//  FilmInfoViewerTests
//
//  Created by Apostolos Apostolidis on 2024-09-02.
//

import XCTest
@testable import FilmInfoViewer

final class FilmListPresentationTests: XCTestCase {
	var objectToTest: FilmListPresentationFactory!
	
	override func setUpWithError() throws {
		objectToTest = FilmListPresentationFactory()
	}
	
	override func tearDownWithError() throws {
		objectToTest = nil
	}
	
	func testPresentationWithNoMoreResults() {
		let presentation = objectToTest.presentation(fromResponse: SavedFilmsResponse(
			films: [Film(
				title: "title",
				description: "description",
				image: UIImage(systemName: "plus")!.pngData()!)],
			hasMore: false))
		
		XCTAssertEqual(presentation, FilmListPresentation(
			films: [FilmListPresentation.FilmPresentation(title: "title", image: UIImage(systemName: "plus")!.pngData()!)],
			hideBottomButton: true))
	}
	
	func testPresentationWithMoreResults() {
		let presentation = objectToTest.presentation(fromResponse: SavedFilmsResponse(
			films: [Film(
				title: "title",
				description: "description",
				image: UIImage(systemName: "plus")!.pngData()!)],
			hasMore: true))
		
		XCTAssertEqual(presentation, FilmListPresentation(
			films: [FilmListPresentation.FilmPresentation(title: "title", image: UIImage(systemName: "plus")!.pngData()!)],
			hideBottomButton: false))
	}
}
