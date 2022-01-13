//
//  ChildInteractor.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs
import RxSwift

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

	// TODO: Add additional dependencies to constructor. Do not perform any logic in constructor.

	// MARK: - Con(De)structor

	init(
		message: String,
		presenter: ChildPresentable
	) {
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
