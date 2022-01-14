//
//  ChildViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import SnapKit

protocol ChildPresentableListener: AnyObject {
	// TODO: Declare properties and methods that the view controller can invoke to perform
	// business logic, such as signIn(). This protocol is implemented by the corresponding interactor class.
	var viewModel: Observable<String> { get }
}

final class ChildViewController: UIViewController, ChildPresentable, ChildViewControllable {

	// MARK: - ChildPresentable

	weak var listener: ChildPresentableListener?

	lazy var detachObservable: Observable<Void> = detachRelay.asObservable()

	// MARK: - Properties

	private let detachRelay: PublishRelay<Void> = .init()

	private let disposeBag: DisposeBag = .init()

	// MARK: - UIComponents

	private let centerLabel: UILabel = {
		let label = UILabel()
		return label
	}()

	private let closeButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Close Child", for: .normal)
		return button
	}()

	// MARK: - Con(De)structor

	init() {
		super.init(nibName: nil, bundle: nil)
		modalPresentationStyle = .pageSheet
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
		bind(to: listener)
		bindView()
	}
}

// MARK: - SetupUI
private extension ChildViewController {
	func setupUI() {
		presentationController?.delegate = self
		view.backgroundColor = .white
		view.addSubview(centerLabel)
		view.addSubview(closeButton)

		layout()
	}

	func layout() {
		centerLabel.snp.makeConstraints {
			$0.centerX.equalTo(view.snp.centerX)
			$0.centerY.equalTo(view.snp.centerY)
		}

		closeButton.snp.makeConstraints {
			$0.centerX.equalTo(view.snp.centerX)
			$0.top.equalTo(centerLabel.snp.bottom).offset(20)
		}
	}
}

// MARK: - Binding
private extension ChildViewController {
	func bind(to listener: ChildPresentableListener?) {
		listener?.viewModel
			.observe(on: MainScheduler.instance)
			.subscribe(onNext: { [weak self] text in
				self?.centerLabel.text = text
			})
			.disposed(by: disposeBag)
	}

	func bindView() {
		closeButton.rx.tap
			.bind(to: detachRelay)
			.disposed(by: disposeBag)
	}
}

// MARK: - UIAdaptivePresentationControllerDelegate
extension ChildViewController: UIAdaptivePresentationControllerDelegate {
	func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
		detachRelay.accept(())
	}
}
