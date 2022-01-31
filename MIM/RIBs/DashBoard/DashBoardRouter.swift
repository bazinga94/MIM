//
//  DashBoardRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs

protocol DashBoardInteractable: Interactable {
	var router: DashBoardRouting? { get set }
	var listener: DashBoardListener? { get set }
}

protocol DashBoardViewControllable: ViewControllable {
	// TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class DashBoardRouter: ViewableRouter<DashBoardInteractable, DashBoardViewControllable>, DashBoardRouting {
	
	// TODO: Constructor inject child builder protocols to allow building children.
	override init(interactor: DashBoardInteractable, viewController: DashBoardViewControllable) {
		super.init(interactor: interactor, viewController: viewController)
		interactor.router = self
	}
}
