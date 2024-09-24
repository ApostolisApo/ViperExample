//
//  ViewController.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-02.
//

import UIKit

class FilmListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FilmListViewProtocol {
	
	@IBOutlet weak var filmList: UITableView!
	@IBOutlet weak var bottomButton: UIButton!

	var uiDelegate: FilmListUIDelegate?
	var myFilms = [FilmListPresentation.FilmPresentation]()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = "My Films"

		filmList.delegate = self
		filmList.dataSource = self
		filmList.register(UINib(nibName: FilmListCell.name, bundle: nil), forCellReuseIdentifier: FilmListCell.name)
		filmList.separatorInset = .zero
		
		bottomButton.setTitle("Load more", for: .normal)
		bottomButton.isHidden = true

		Task {
			await uiDelegate?.viewDidLoad()
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		myFilms.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: FilmListCell.name, for:indexPath) as? FilmListCell {
			cell.filmImage.image = UIImage(data: myFilms[indexPath.row].image)
			cell.filmTitle.text = myFilms[indexPath.row].title
			return cell
		}
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		uiDelegate?.didTapFilm(at: indexPath.row)
	}
	
	func prepare(with presentation: FilmListPresentation) {
		myFilms = presentation.films
		filmList.reloadData()
		
		bottomButton.isHidden = presentation.hideBottomButton
	}
}
