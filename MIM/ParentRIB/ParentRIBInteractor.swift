//
//  ParentRIBInteractor.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/12.
//

import RIBs
import RxSwift

protocol ParentRIBRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ParentRIBPresentable: Presentable {
    var listener: ParentRIBPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ParentRIBListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ParentRIBInteractor: PresentableInteractor<ParentRIBPresentable>, ParentRIBInteractable, ParentRIBPresentableListener {

    weak var router: ParentRIBRouting?
    weak var listener: ParentRIBListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ParentRIBPresentable) {
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
