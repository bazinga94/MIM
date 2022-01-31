//
//  HomeRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs

protocol HomeInteractable: Interactable {
	var router: HomeRouting? { get set }
	var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
	// TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRouting {

	private let dashBoardBuilder: DashBoardBuildable
	
	// TODO: Constructor inject child builder protocols to allow building children.
	init(
		interactor: HomeInteractable,
		viewController: HomeViewControllable,
		dashBoardBuilder: DashBoardBuildable
	) {
		self.dashBoardBuilder = dashBoardBuilder
		super.init(interactor: interactor, viewController: viewController)
		interactor.router = self
	}
}
