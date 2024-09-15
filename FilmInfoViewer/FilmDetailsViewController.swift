//
//  FilmDetailsViewController.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-13.
//

import UIKit

class FilmDetailsViewController: UIViewController {
	@IBOutlet weak var filmImage: UIImageView!
	@IBOutlet weak var filmTitle: UILabel!
	@IBOutlet weak var filmDescription: UILabel!
	
	var film: Film?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.largeTitleDisplayMode = .never

		filmDescription.numberOfLines = 0

		filmImage.contentMode = .scaleAspectFill
		filmTitle.font = .boldSystemFont(ofSize: 18)

		guard let film else { return }

		filmImage.image = UIImage(data: film.image)
		filmTitle.text = film.title
		filmDescription.text = film.description
	}
}
