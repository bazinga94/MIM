//
//  ParentRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs

protocol ParentInteractable: Interactable {
    var router: ParentRouting? { get set }
    var listener: ParentListener? { get set }
}

protocol ParentViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ParentRouter: ViewableRouter<ParentInteractable, ParentViewControllable>, ParentRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ParentInteractable, viewController: ParentViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
