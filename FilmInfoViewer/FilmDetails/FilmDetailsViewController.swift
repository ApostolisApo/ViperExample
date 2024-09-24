//
//  FilmDetailsViewController.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-13.
//

import UIKit

class FilmDetailsViewController: UIViewController, FilmDetailsViewProtocol {
	var uiDelegate: FilmDetailsUIDelegate?
	
	@IBOutlet weak var filmImage: UIImageView!
	@IBOutlet weak var filmTitle: UILabel!
	@IBOutlet weak var filmDescription: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.largeTitleDisplayMode = .never

		let customBarButtonItem = customBackButton(selector: #selector(didTapGoBack), in: self)
		customBarButtonItem.target = self
		customBarButtonItem.action = #selector(didTapGoBack)
		
		navigationItem.leftBarButtonItem = customBarButtonItem

		filmDescription.numberOfLines = 0

		filmImage.contentMode = .scaleAspectFill
		filmTitle.font = .boldSystemFont(ofSize: 18)
		
		uiDelegate?.viewDidLoad()
	}
	
	func prepare(with presentation: FilmDetailsPresentation) {
		filmImage.image = UIImage(data: presentation.image)
		filmTitle.text = presentation.title
		filmDescription.text = presentation.description
	}
	
	@objc func didTapGoBack() {
		uiDelegate?.didTapGoBack()
	}
}
