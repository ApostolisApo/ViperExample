//
//  FilmListInteractorTests.swift
//  FilmInfoViewerTests
//
//  Created by Apostolos Apostolidis on 2024-09-16.
//

import XCTest
@testable import FilmInfoViewer

final class FilmListInteractorTests: XCTestCase {
	var objectToTest: FilmListInteractor!
	
	override func setUpWithError() throws {
		let mockViewController = MockViewController()
		objectToTest = FilmListInteractor(
			router: MockFilmListRouter(viewController: mockViewController),
			controller: mockViewController,
			filmService: MockFilmService(),
			presentationFactory: MockFilmPresentationFactory())
	}
	
	override func tearDownWithError() throws {
		objectToTest = nil
		MockFilmListRouter.filmToLoadFilmDetails = nil
	}
	
	func testDidTapFilm() async {
		let film = Film(title: "Film 1", description: "description 1", image: UIImage(named: "StarWars")!.pngData()!)
		MockFilmService.response = SavedFilmsResponse(
			films: [film],
			hasMore: false
		)
		MockFilmPresentationFactory.presentation = FilmListPresentation(
			films: [
				FilmListPresentation.FilmPresentation(title: "Film 1", image: UIImage(named: "StarWars")!.pngData()!)
			],
			hideBottomButton: false)
		
		await objectToTest.viewDidLoad()
		objectToTest.didTapFilm(at: 0)
		XCTAssertEqual(MockFilmListRouter.filmToLoadFilmDetails, film)
	}
}

private class MockViewController: UIViewController, FilmListViewProtocol {
	var uiDelegate: FilmListUIDelegate?
	
	func prepare(with presentation: FilmInfoViewer.FilmListPresentation) { }
	
	override func show(_ vc: UIViewController, sender: Any?) { }
}

private class MockFilmListRouter: FilmListRouterProtocol {
	static var filmToLoadFilmDetails: Film?
	
	var viewController: FilmListViewProtocol?
	
	init(viewController: FilmListViewProtocol) {
		self.viewController = viewController
	}
	
	func loadFilmDetails(_ film: Film) {
		MockFilmListRouter.filmToLoadFilmDetails = film
	}
}

private class MockFilmService: FilmInfoServiceProtocol {
	static var response: SavedFilmsResponse!
	
	func getSavedFilms() async -> SavedFilmsResponse {
		MockFilmService.response
	}
}

private class MockFilmPresentationFactory: FilmListPresentationFactoryProtocol {
	static var presentation: FilmListPresentation!
	
	func presentation(fromResponse response: SavedFilmsResponse) -> FilmListPresentation {
		MockFilmPresentationFactory.presentation
	}
}


