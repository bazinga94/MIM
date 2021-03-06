//
//  ParentViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import SnapKit

protocol ParentPresentableListener: AnyObject {
	// TODO: Declare properties and methods that the view controller can invoke to perform
	// business logic, such as signIn(). This protocol is implemented by the corresponding interactor class.
}

final class ParentViewController: UIViewController, ParentPresentable, ParentViewControllable {

	// MARK: - ParentPresentable

	weak var listener: ParentPresentableListener?

	lazy var showChildButtonClickObservable: Observable<Void> = detailButton.rx.tap.asObservable()

	lazy var parentTextFieldTextObservable: Observable<String> = textField.rx.text.orEmpty.asObservable()

	// MARK: - Properties

	private let disposeBag: DisposeBag = .init()

	// MARK: - UIComponents

	private let textField: UITextField = {
		let textField = UITextField()
		textField.borderStyle = .bezel
		return textField
	}()

	private var detailButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Show Child View", for: .normal)
		return button
	}()

	// MARK: - Con(De)structor

	init() {
		super.init(nibName: nil, bundle: nil)
		modalPresentationStyle = .fullScreen
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

// MARK: - SetupUI
private extension ParentViewController {
	func setupUI() {
		view.backgroundColor = .white

		view.addSubview(textField)
		view.addSubview(detailButton)

		layout()
	}

	func layout() {
		textField.snp.makeConstraints {
			$0.centerX.equalTo(view.snp.centerX)
			$0.centerY.equalTo(view.snp.centerY)
			$0.width.equalTo(200)
			$0.height.equalTo(30)
		}

		detailButton.snp.makeConstraints {
			$0.centerX.equalTo(textField.snp.centerX)
			$0.top.equalTo(textField.snp.bottom).offset(8)
		}
	}
}

// MARK: - ParentViewControllable
extension ParentViewController {
	func present(_ viewController: ViewControllable, animated: Bool) {
		present(viewController.uiviewController, animated: true)
	}

	func dismiss(_ viewController: ViewControllable, animated: Bool) {
		guard !viewController.uiviewController.isBeingDismissed else { return }

		viewController.uiviewController.dismiss(animated: animated)
	}
}
