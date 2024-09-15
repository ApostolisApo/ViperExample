//
//  FilmListCell.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-03.
//

import UIKit

class FilmListCell: UITableViewCell {
	@IBOutlet weak var filmImage: UIImageView!
	@IBOutlet weak var filmTitle: UILabel!
	
	static var name = String(describing: FilmListCell.self)
	
	override func awakeFromNib() {
		super.awakeFromNib()
		filmTitle.font = .boldSystemFont(ofSize: 16)
	}
}
