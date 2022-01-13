//
//  ChildViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs
import RxSwift
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

	// MARK: - Properties

	private let disposeBag: DisposeBag = .init()

	// MARK: - UIComponents

	private let centerLabel: UILabel = {
		let label = UILabel()
		return label
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
		bind(to: listener)
	}
}

// MARK: - SetupUI
private extension ChildViewController {
	func setupUI() {
		view.backgroundColor = .white

		view.addSubview(centerLabel)

		layout()
	}

	func layout() {
		centerLabel.snp.makeConstraints {
			$0.centerX.equalTo(view.snp.centerX)
			$0.centerY.equalTo(view.snp.centerY)
			$0.width.equalTo(300)
			$0.height.equalTo(40)
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
}
