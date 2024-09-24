//
//  FilmListPresentation.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-13.
//

import Foundation

struct FilmListPresentation: Equatable {
	struct FilmPresentation: Equatable {
		let title: String
		let image: Data
	}
	
	let films: [FilmPresentation]
	let hideBottomButton: Bool
}

struct FilmListPresentationFactory: FilmListPresentationFactoryProtocol {
	func presentation(fromResponse response: SavedFilmsResponse) -> FilmListPresentation {
		var films = [FilmListPresentation.FilmPresentation]()
		
		response.films.forEach {
			films.append(FilmListPresentation.FilmPresentation(title: $0.title, image: $0.image))
		}
		
		return FilmListPresentation(films: films, hideBottomButton: !response.hasMore)
	}
}
