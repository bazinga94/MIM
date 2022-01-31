//
//  HomeViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs
import RxSwift
import PinLayout
import UIKit

protocol HomePresentableListener: AnyObject {
	// TODO: Declare properties and methods that the view controller can invoke to perform
	// business logic, such as signIn(). This protocol is implemented by the corresponding
	// interactor class.
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

	// MARK: - ParentPresentable

	weak var listener: HomePresentableListener?

	// MARK: - UIComponents

	private let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .equalSpacing
		stackView.spacing = 4
		return stackView
	}()

	// MARK: - Overridden: UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		setupUI()
	}
}

// MARK: - Set up UI
private extension HomeViewController {
	func setupUI() {
		view.backgroundColor = .white

		view.addSubview(stackView)
		layout()
	}

	func layout() {
		stackView.pin.top().left().right()
	}
}
