//
//  ViewController.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-02.
//

import UIKit

class FilmListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var filmList: UITableView!
	@IBOutlet weak var bottomButton: UIButton!
	
	let filmService = FilmInfoService()
	let toFilmDetailsSegueID = "toFilmDetails"
	
	var myFilms = [Film]()
	var selectedFilmIndex: Int?
	
	override func viewDidLoad() {
		super.viewDidLoad()

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = "My Films"

		filmList.delegate = self
		filmList.dataSource = self
		filmList.register(UINib(nibName: "FilmListCell", bundle: nil), forCellReuseIdentifier: FilmListCell.name)
		filmList.separatorInset = .zero
		
		bottomButton.setTitle("Load more", for: .normal)
		bottomButton.isHidden = true
		
		Task {
			let filmListResponse = await filmService.getSavedFilms()
			myFilms = filmListResponse.films
			filmList.reloadData()
			bottomButton.isHidden = !filmListResponse.hasMore
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
		selectedFilmIndex = indexPath.row
		performSegue(withIdentifier: toFilmDetailsSegueID, sender: nil)
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == toFilmDetailsSegueID {
			if let detailsController = segue.destination as? FilmDetailsViewController,
				let selectedFilmIndex {
				detailsController.film = myFilms[selectedFilmIndex]
			}
		}
	}
}
