//
//  FinanceInteractor.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs
import RxSwift

protocol FinanceRouting: ViewableRouting {
	// TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol FinancePresentable: Presentable {
	var listener: FinancePresentableListener? { get set }
	// TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol FinanceListener: AnyObject {
	// TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class FinanceInteractor: PresentableInteractor<FinancePresentable>, FinanceInteractable, FinancePresentableListener {

	weak var router: FinanceRouting?
	weak var listener: FinanceListener?

	// TODO: Add additional dependencies to constructor. Do not perform any logic
	// in constructor.
	override init(presenter: FinancePresentable) {
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
