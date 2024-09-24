//
//  FilmDetailsProtocols.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-13.
//

import UIKit

protocol FilmDetailsUIDelegate {
	func viewDidLoad()
	func didTapGoBack()
}

protocol FilmDetailsRouterProtocol {
	var viewController: FilmDetailsViewProtocol? { get set }

	func goBack()
}

protocol FilmDetailsViewProtocol: UIViewController {
	var uiDelegate: FilmDetailsUIDelegate? { get set }
	
	func prepare(with presentation: FilmDetailsPresentation)
}

protocol FilmDetailsPresentationFactoryProtocol {
	func presentation(fromResponse response: SavedFilmsResponse) -> FilmDetailsPresentation
}
