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
		stackView.translatesAutoresizingMaskIntoConstraints = false
// PinLayout을 사용 하는 경우 필요 없다. AutoLayout을 통해 layout을 결정하지 않아서 그런것 같다.
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .equalSpacing
		stackView.spacing = 4
		return stackView
	}()

	private let titleLabel: UILabel = {
		let label = UILabel()
//		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 22, weight: .semibold)
		label.text = "잔고"
		return label
	}()

	private let chargeButton: UIButton = {
		let button = UIButton()
//		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("충전하기", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		return button
	}()

	private let cardView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .systemIndigo
		view.layer.cornerRadius = 20
		view.layer.cornerCurve = .continuous
		return view
	}()

	// MARK: - Constructor

	init() {
		super.init(nibName: nil, bundle: nil)

		setupUI()	// 특이하게 viewDidLoad가 아닌 init 타이밍에 처리를 해준다.
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

		setupUI()
	}

	// MARK: - Overridden: UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

//		setupUI()
	}
}

// MARK: - Set up UI
private extension DashBoardViewController {
	func setupUI() {
		view.backgroundColor = .orange
		view.addSubview(stackView)
		view.addSubview(cardView)
		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(chargeButton)
		chargeButton.addTarget(self, action: #selector(chargeButtonDidTap), for: .touchUpInside)
		layout()
	}

	func layout() {
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			cardView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
			cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			cardView.heightAnchor.constraint(equalToConstant: 100)
		])

//		stackView.pin.top(10).left(20).right(20)
//		cardView.pin.below(of: stackView, aligned: .left).right(to: stackView.edge.right).marginTop(10).marginBottom(10).height(100)
	}

	@objc
	func chargeButtonDidTap() {

	}
}
