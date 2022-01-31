//
//  FinanceRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs

protocol FinanceInteractable: Interactable {
	var router: FinanceRouting? { get set }
	var listener: FinanceListener? { get set }
}

protocol FinanceViewControllable: ViewControllable {
	// TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class FinanceRouter: ViewableRouter<FinanceInteractable, FinanceViewControllable>, FinanceRouting {

	// TODO: Constructor inject child builder protocols to allow building children.
	override init(interactor: FinanceInteractable, viewController: FinanceViewControllable) {
		super.init(interactor: interactor, viewController: viewController)
		interactor.router = self
	}
}
