//
//  ChildInteractor.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs
import RxSwift
import RxCocoa

protocol ChildRouting: ViewableRouting {
	// TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ChildPresentable: Presentable {
	// TODO: Declare methods the interactor can invoke the presenter to present data.
	var listener: ChildPresentableListener? { get set }
	var detachObservable: Observable<Void> { get }
}

protocol ChildListener: AnyObject {
	// TODO: Declare methods the interactor can invoke to communicate with other RIBs.
	func detachChildRIB()
}

final class ChildInteractor: PresentableInteractor<ChildPresentable>, ChildInteractable, ChildPresentableListener {

	// MARK: - ChildInteractable

	weak var router: ChildRouting?
	weak var listener: ChildListener?

	// MARK: - ChildPresentableListener
	var viewModel: Observable<String> {
		viewModelRelay.asObservable()
	}

	private let viewModelRelay: BehaviorRelay<String>	// 초기값을 제공하고 UI용 Observable + Observer

	// TODO: Add additional dependencies to constructor. Do not perform any logic in constructor.

	// MARK: - Con(De)structor

	init(
		message: String,
		presenter: ChildPresentable
	) {
		viewModelRelay = .init(value: message)
		super.init(presenter: presenter)
		presenter.listener = self
	}

	override func didBecomeActive() {
		super.didBecomeActive()
		// TODO: Implement business logic here.
		bindPresenter()
	}

	override func willResignActive() {
		super.willResignActive()
		// TODO: Pause any business logic.
	}
}

private extension ChildInteractor {
	func bindPresenter() {
		presenter.detachObservable
			.bind { [weak self] _ in
				self?.listener?.detachChildRIB()
			}
			.disposeOnDeactivate(interactor: self)
	}
}
