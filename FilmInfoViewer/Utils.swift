//
//  Utils.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-15.
//

import UIKit

extension UIImage {
	func tinted(with color: UIColor?) -> UIImage? {
		guard let color = color else {
			return self
		}
		let tintedImage = UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { _ in
			color.set()
			withRenderingMode(.alwaysTemplate).draw(at: .zero)
		}
		return tintedImage.withRenderingMode(renderingMode)
	}
}

extension UIColor {
	public convenience init(hexRgb: String) {
		var packedRgb = 0
		if hexRgb.starts(with: "#") && hexRgb.count == 7 {
			let indexOfSecondChar = hexRgb.index(hexRgb.startIndex, offsetBy: 1)
			packedRgb = Int(hexRgb[indexOfSecondChar...], radix:16) ?? 0
		}
		self.init(
			red: CGFloat((packedRgb >> 16) & 0xFF) / 255.0,
			green: CGFloat((packedRgb >> 8) & 0xFF) / 255.0,
			blue: CGFloat(packedRgb & 0xFF) / 255.0,
			alpha: 1.0
		)
	}
}

func customBackButton(selector: Selector, in target: UIViewController) -> UIBarButtonItem {
	let barButton = UIBarButtonItem(title: "    Back   " + "\u{200c}", style: .plain, target: target, action: selector)
	barButton.style = .done
	let backImage = UIImage(named: "back_left_angle")?.tinted(with: UIColor(hexRgb: "#0876B9"))
	let capInsets = UIEdgeInsets(top: backImage!.size.height - 1.0, left: backImage!.size.width - 1.0, bottom: 0, right: 0)
	let stretchableBackImage = backImage?.resizableImage(withCapInsets: capInsets).imageFlippedForRightToLeftLayoutDirection()
	barButton.setBackgroundImage(stretchableBackImage, for: UIControl.State.normal, barMetrics: UIBarMetrics.default)
	return barButton
}
