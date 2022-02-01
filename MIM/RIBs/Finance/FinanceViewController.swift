//
//  FinanceViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs
import RxSwift
import PinLayout
import UIKit

protocol FinancePresentableListener: AnyObject {
	// TODO: Declare properties and methods that the view controller can invoke to perform
	// business logic, such as signIn(). This protocol is implemented by the corresponding
	// interactor class.
}

final class FinanceViewController: UIViewController, FinancePresentable, FinanceViewControllable {

	// MARK: - FinancePresentable

	weak var listener: FinancePresentableListener?

	// MARK: - FinanceViewControllable

	func addDashBoard(_ viewControllable: ViewControllable) {
		let viewController = viewControllable.uiviewController

		addChild(viewController)
		stackView.addArrangedSubview(viewController.view)
		viewController.didMove(toParent: self)
	}

	// MARK: - UIComponents

	private let stackView: UIStackView = {
		let stackView = UIStackView()
//		stackView.translatesAutoresizingMaskIntoConstraints = false
		// PinLayout을 사용 하는 경우 필요 없다. AutoLayout을 통해 layout을 결정하지 않아서 그런것 같다.
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .equalSpacing
		stackView.spacing = 4
		stackView.backgroundColor = .blue
		return stackView
	}()

	// MARK: - Overridden: UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		setupUI()
	}
}

// MARK: - Set up UI
private extension FinanceViewController {
	func setupUI() {
		view.backgroundColor = .white
		title = "홈"		// 무슨 용도?
		tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
		view.addSubview(stackView)
		layout()
	}

	func layout() {
		stackView.pin.top(100).left().right()
	}
}

