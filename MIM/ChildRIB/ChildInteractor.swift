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
	var listener: ChildPresentableListener? { get set }
	// TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ChildListener: AnyObject {
	// TODO: Declare methods the interactor can invoke to communicate with other RIBs.
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
	}

	override func willResignActive() {
		super.willResignActive()
		// TODO: Pause any business logic.
	}
}
