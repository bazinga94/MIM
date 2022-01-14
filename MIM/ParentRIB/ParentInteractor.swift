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
	func attachChildRIB(text: String)
	func detachChildRIB()
}

protocol ParentPresentable: Presentable {
	// TODO: Declare methods the interactor can invoke the presenter to present data.
	var listener: ParentPresentableListener? { get set }
	var showChildButtonClickObservable: Observable<Void> { get }
	var parentTextFieldTextObservable: Observable<String> { get }
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

		bindPresenter()
	}

	override func willResignActive() {
		super.willResignActive()
		// TODO: Pause any business logic.
	}
}

// MARK: - Binding
private extension ParentInteractor {
	private func bindPresenter() {
		presenter.showChildButtonClickObservable.withLatestFrom(presenter.parentTextFieldTextObservable)
			.bind { [weak self] text in
				self?.router?.attachChildRIB(text: text)
			}
			.disposeOnDeactivate(interactor: self)

//		presenter.showChildButtonClickObservable
//			.bind { [weak self] in
//				self?.router?.attachChildRIB()	// 여기서 인자로 message를 넘겨주자
//			}
//			.disposeOnDeactivate(interactor: self)	// 데이터 전달 없는 경우
	}
}

// MARK: - ParentInteractable
extension ParentInteractor {
	func detachChildRIB() {
		router?.detachChildRIB()
	}
}
