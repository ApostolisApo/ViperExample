//
//  FilmListInteractor.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-13.
//

import Foundation

class FilmListInteractor: FilmListUIDelegate {
	
	private let router: FilmListRouterProtocol
	private let filmService: FilmInfoServiceProtocol
	private let presentationFactory: FilmListPresentationFactoryProtocol
	
	private weak var controller: FilmListViewProtocol?

	private var films = [Film]()
	
	init(
		router: FilmListRouterProtocol,
		controller: FilmListViewProtocol,
		filmService: FilmInfoServiceProtocol? = nil,
		presentationFactory: FilmListPresentationFactoryProtocol? = nil)
	{
		self.router = router
		self.controller = controller
		self.filmService = filmService ?? FilmInfoService()
		self.presentationFactory = presentationFactory ?? FilmListPresentationFactory()
	}
	
	func viewDidLoad() async {
		let response = await filmService.getSavedFilms()
		films = response.films
		let presentation = presentationFactory.presentation(fromResponse: response)
		DispatchQueue.main.async {
			self.controller?.prepare(with: presentation)
		}
	}
	
	func didTapFilm(at index: Int) {
		router.loadFilmDetails(films[index])
	}
}
