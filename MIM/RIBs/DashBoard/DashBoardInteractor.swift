//
//  DashBoardInteractor.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs
import RxSwift

protocol DashBoardRouting: ViewableRouting {
	// TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol DashBoardPresentable: Presentable {
	var listener: DashBoardPresentableListener? { get set }
	// TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol DashBoardListener: class {
	// TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class DashBoardInteractor: PresentableInteractor<DashBoardPresentable>, DashBoardInteractable, DashBoardPresentableListener {

	weak var router: DashBoardRouting?
	weak var listener: DashBoardListener?

	// TODO: Add additional dependencies to constructor. Do not perform any logic
	// in constructor.
	override init(presenter: DashBoardPresentable) {
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
