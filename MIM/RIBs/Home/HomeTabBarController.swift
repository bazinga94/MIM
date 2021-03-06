//
//  HomeViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: AnyObject {
	// TODO: Declare properties and methods that the view controller can invoke to perform
	// business logic, such as signIn(). This protocol is implemented by the corresponding
	// interactor class.
}

final class HomeTabBarController: UITabBarController, HomePresentable, HomeViewControllable {

	// MARK: - HomePresentable

	weak var listener: HomePresentableListener?

	// MARK: - HomeViewControllable

	func setViewControllers(_ viewControllers: [ViewControllable]) {
		super.setViewControllers(viewControllers.map(\.uiviewController), animated: false)
	}

	// MARK: - Con(De)structor

	init() {
		super.init(nibName: nil, bundle: nil)
		modalPresentationStyle = .fullScreen	// RootViewController 대신 새로운 View를 보여주기 위해
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	deinit {
		print("deinit: \(type(of: self))")
	}

	// MARK: - Overridden: UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		setupUI()
	}
}

// MARK: - Set up UI
private extension HomeTabBarController {
	func setupUI() {
		tabBar.isTranslucent = false
		tabBar.tintColor = .black
		tabBar.backgroundColor = .white
	}

	func layout() {
	}
}
