//
//  ParentInteractor.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs
import RxSwift

protocol ParentRouting: ViewableRouting {
	// TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ParentPresentable: Presentable {
	var listener: ParentPresentableListener? { get set }
	// TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ParentListener: AnyObject {
	// TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ParentInteractor: PresentableInteractor<ParentPresentable>, ParentInteractable, ParentPresentableListener {

	// MARK: - ParentInteractable

	weak var router: ParentRouting?
	weak var listener: ParentListener?

	// TODO: Add additional dependencies to constructor. Do not perform any logic in constructor.

	// MARK: - Con(De)structor

	override init(presenter: ParentPresentable) {
		super.init(presenter: presenter)
		presenter.listener = self
	}

	deinit {
		print("deinit: \(type(of: self))")
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
