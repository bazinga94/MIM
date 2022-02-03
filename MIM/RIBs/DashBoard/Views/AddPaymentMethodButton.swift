//
//  AddPaymentMethodButton.swift
//  MIM
//
//  Created by Jongho Lee on 2022/02/03.
//

import UIKit

// Custom 버튼을 생성하는 경우 UIControl을 상속 받아 만들 수 있다.
final class AddPaymentMethodButton: UIControl {

	private let plusIcon: UIImageView = {
		let imageView = UIImageView(
			image: UIImage(
				systemName: "plus",
				withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold)
			)
		)
		imageView.tintColor = .white
		imageView.translatesAutoresizingMaskIntoConstraints = false

		return imageView
	}()

	init() {
		super.init(frame: .zero)

		setupViews()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

		setupViews()
	}

	private func setupViews() {
		addSubview(plusIcon)

		NSLayoutConstraint.activate([
			plusIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			plusIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
		])
	}
}
