//
//  DashBoardViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs
import RxSwift
import PinLayout
import UIKit

protocol DashBoardPresentableListener: AnyObject {
	// TODO: Declare properties and methods that the view controller can invoke to perform
	// business logic, such as signIn(). This protocol is implemented by the corresponding
	// interactor class.
}

final class DashBoardViewController: UIViewController, DashBoardPresentable, DashBoardViewControllable {

	// MARK: - DashBoardPresentable

	weak var listener: DashBoardPresentableListener?

	// MARK: - UIComponents

	private let stackView: UIStackView = {
		let stackView = UIStackView()
//		stackView.translatesAutoresizingMaskIntoConstraints = false
// PinLayout을 사용 하는 경우 필요 없다. AutoLayout을 통해 layout을 결정하지 않아서 그런것 같다.
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .equalSpacing
		stackView.spacing = 4
		stackView.backgroundColor = .blue
		return stackView
	}()

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 22, weight: .semibold)
		label.text = "잔고"
		return label
	}()

	private let chargeButton: UIButton = {
		let button = UIButton()
		button.setTitle("충전하기", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		return button
	}()

	// MARK: - Overridden: UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		setupUI()
	}
}

// MARK: - Set up UI
private extension DashBoardViewController {
	func setupUI() {
		view.backgroundColor = .white
		view.addSubview(stackView)
		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(chargeButton)
		chargeButton.addTarget(self, action: #selector(chargeButtonDidTap), for: .touchUpInside)
		layout()
	}

	func layout() {
		stackView.pin.top().left().right()
	}

	@objc
	func chargeButtonDidTap() {

	}
}
