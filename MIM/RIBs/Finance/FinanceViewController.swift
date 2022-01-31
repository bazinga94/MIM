//
//  FinanceViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs
import RxSwift
import UIKit

protocol FinancePresentableListener: AnyObject {
	// TODO: Declare properties and methods that the view controller can invoke to perform
	// business logic, such as signIn(). This protocol is implemented by the corresponding
	// interactor class.
}

final class FinanceViewController: UIViewController, FinancePresentable, FinanceViewControllable {

	// MARK: - FinancePresentable

	weak var listener: FinancePresentableListener?

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
private extension FinanceViewController {
	func setupUI() {
		view.backgroundColor = .white

		view.addSubview(stackView)
		layout()
	}

	func layout() {
		stackView.pin.top().left().right()
	}
}

