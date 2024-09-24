//
//  FilmDetailsInteractor.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-13.
//

import Foundation

struct FilmDetailsInteractor: FilmDetailsUIDelegate {
	let router: FilmDetailsRouterProtocol

	weak var viewController: FilmDetailsViewProtocol?

	let film: Film
	
	func viewDidLoad() {
		viewController?.prepare(with: FilmDetailsPresentation(title: film.title, image: film.image, description: film.description))
	}
	
	func didTapGoBack() {
		router.goBack()
	}
}
