//
//  FilmInfoService.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-02.
//

import UIKit

struct Film: Equatable {
	let title: String
	let description: String
	let image: Data
}

typealias SavedFilmsResponse = (films: [Film], hasMore: Bool)

struct FilmInfoService: FilmInfoServiceProtocol {
	
	func getSavedFilms() async -> SavedFilmsResponse {
		return (
			[Film(
				title: "Star Wars V: The Empire Strikes Back",
				description: "Darkness descends as the evil Galactic Empire hunts the Rebel Alliance. Luke Skywalker embarks on a perilous journey to master the ways of the Force under the tutelage of Jedi Master Yoda, while Han Solo and Princess Leia find themselves ensnared in a dangerous game of cat and mouse with the Empire. Betrayal, heartbreak, and epic lightsaber duels culminate in a shocking revelation that leaves the fate of the galaxy hanging in the balance.",
				image: UIImage(named: "StarWars")!.pngData()!),
			 Film(
				title: "Arrival",
				description: "Enigmatic alien spacecraft touch down across the globe, plunging humanity into uncertainty and fear. Linguist Louise Banks is recruited to decipher the visitors' complex language and uncover their purpose on Earth. As she delves deeper into their communication, Louise experiences profound shifts in her perception of time and reality, leading to a stunning revelation about the aliens' true intentions and the profound impact they will have on humanity's future.",
				image: UIImage(named: "Arrival")!.pngData()!),
			 Film(
				title: "Blade Runner",
				description: "In a dystopian L.A. Rick Deckard, a specialized hunter known as a Blade Runner, is tasked with tracking down and retiring rogue replicants, bioengineered beings indistinguishable from humans. As Deckard hunts his targets, he grapples with existential questions about the nature of life, identity, and what it truly means to be human. The lines between hunter and hunted blur, leading to a thrilling climax that challenges our understanding of reality and leaves a lasting impact.",
				image: UIImage(named: "BladeRunner")!.pngData()!)
			],
			hasMore: true
		)
	}
}

protocol FilmInfoServiceProtocol {
	func getSavedFilms() async -> SavedFilmsResponse
}
