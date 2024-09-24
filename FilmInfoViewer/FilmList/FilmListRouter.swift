//
//  FilmListRouter.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-13.
//

import UIKit

struct FilmListRouter: FilmListRouterProtocol {
	weak var viewController: FilmListViewProtocol?
	
	static func viewController() -> UIViewController {
		var viewController: UIViewController?
		autoreleasepool {
			let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
			viewController = mainStoryboard.instantiateViewController(withIdentifier: "FilmListViewController")
		}
		
		if let viewController = viewController as? FilmListViewController {
			let router = FilmListRouter(viewController: viewController)
			let interactor = FilmListInteractor(router: router, controller: viewController)
			viewController.uiDelegate = interactor
		}
		return viewController!
	}
	
	func loadFilmDetails(_ film: Film) {
		let detailsController = FilmDetailsRouter.viewController(film: film)
		viewController?.show(detailsController, sender: nil)
	}
}
