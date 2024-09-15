//
//  FilmInfoViewerTests.swift
//  FilmInfoViewerTests
//
//  Created by Apostolos Apostolidis on 2024-09-02.
//

import XCTest
@testable import FilmInfoViewer

final class FilmInfoViewerTests: XCTestCase {
	var objectToTest: FilmListViewController!
	
	override func setUpWithError() throws {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		objectToTest = (storyboard.instantiateViewController(withIdentifier: "FilmListViewController") as! FilmListViewController)
		let window = UIWindow()
		window.rootViewController = objectToTest
		window.makeKeyAndVisible()
	}
	
	override func tearDownWithError() throws {
		objectToTest = nil
	}
	
	func testButtonTapPresentsViewControllerB() {
		objectToTest.myFilms = [Film(title: "A", description: "B", image: Data())]
		objectToTest.tableView(objectToTest.filmList, didSelectRowAt: IndexPath(row: 0, section: 0))

		let presentedVC = objectToTest.presentedViewController
		XCTAssertTrue(presentedVC is FilmDetailsViewController, "The presented view controller should be of type FilmDetailsViewController")
		
		if let viewControllerB = presentedVC as? FilmDetailsViewController {
			XCTAssertEqual(viewControllerB.film!, Film(title: "A", description: "B", image: Data()), "filmIndex should be set correctly")
		}
	}
}
