//
//  HomeInteractor.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs
import RxSwift

protocol HomeRouting: ViewableRouting {
	// TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
	func attachTabs()
}

protocol HomePresentable: Presentable {
	var listener: HomePresentableListener? { get set }
	// TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol HomeListener: AnyObject {
	// TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {

	weak var router: HomeRouting?
	weak var listener: HomeListener?

	// TODO: Add additional dependencies to constructor. Do not perform any logic
	// in constructor.
	override init(presenter: HomePresentable) {
		super.init(presenter: presenter)
		presenter.listener = self
	}

	override func didBecomeActive() {
		super.didBecomeActive()
		// TODO: Implement business logic here.
		router?.attachTabs()
	}

	override func willResignActive() {
		super.willResignActive()
		// TODO: Pause any business logic.
	}
}
