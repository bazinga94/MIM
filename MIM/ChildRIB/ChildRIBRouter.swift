//
//  ChildRIBRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/12.
//

import RIBs

protocol ChildRIBInteractable: Interactable {
    var router: ChildRIBRouting? { get set }
    var listener: ChildRIBListener? { get set }
}

protocol ChildRIBViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ChildRIBRouter: ViewableRouter<ChildRIBInteractable, ChildRIBViewControllable>, ChildRIBRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ChildRIBInteractable, viewController: ChildRIBViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
