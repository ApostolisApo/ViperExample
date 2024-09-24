//
//  FilmListProtocols.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-13.
//

import UIKit

protocol FilmListUIDelegate {
	func viewDidLoad() async
	func didTapFilm(at index: Int)
}

protocol FilmListRouterProtocol {
	var viewController: FilmListViewProtocol? { get set }

	func loadFilmDetails(_ film: Film)
}

protocol FilmListViewProtocol: UIViewController {
	var uiDelegate: FilmListUIDelegate? { get set }
	
	func prepare(with presentation: FilmListPresentation)
}

protocol FilmListPresentationFactoryProtocol {
	func presentation(fromResponse response: SavedFilmsResponse) -> FilmListPresentation
}
