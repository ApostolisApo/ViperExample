//
//  FilmDetailsRouter.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-13.
//

import UIKit

struct FilmDetailsRouter: FilmDetailsRouterProtocol {	
	weak var viewController: FilmDetailsViewProtocol?
	
	static func viewController(film: Film) -> UIViewController {
		var viewController: UIViewController?
		autoreleasepool {
			let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
			viewController = mainStoryboard.instantiateViewController(withIdentifier: "FilmDetailsViewController")
		}
		
		if let viewController = viewController as? FilmDetailsViewController {
			let router = FilmDetailsRouter(viewController: viewController)
			let interactor = FilmDetailsInteractor(router: router, viewController: viewController, film: film)
			viewController.uiDelegate = interactor
		}
		return viewController!
	}
	
	func goBack() {
		viewController?.navigationController?.popViewController(animated: true)
	}
}
