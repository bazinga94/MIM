//
//  ParentRIBRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/12.
//

import RIBs

protocol ParentRIBInteractable: Interactable {
    var router: ParentRIBRouting? { get set }
    var listener: ParentRIBListener? { get set }
}

protocol ParentRIBViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ParentRIBRouter: ViewableRouter<ParentRIBInteractable, ParentRIBViewControllable>, ParentRIBRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ParentRIBInteractable, viewController: ParentRIBViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
