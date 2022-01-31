//
//  FinanceRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs

protocol FinanceInteractable: Interactable, DashBoardListener {
	var router: FinanceRouting? { get set }
	var listener: FinanceListener? { get set }
}

protocol FinanceViewControllable: ViewControllable {
	// TODO: Declare methods the router invokes to manipulate the view hierarchy.
	func addDashBoard(_ viewControllable: ViewControllable)
}

final class FinanceRouter: ViewableRouter<FinanceInteractable,
							FinanceViewControllable>,
							FinanceRouting {

	// MARK: - Builder
	private let dashBoardBuilder: DashBoardBuildable

	// TODO: Constructor inject child builder protocols to allow building children.
	init(
		interactor: FinanceInteractable,
		viewController: FinanceViewControllable,
		dashBoardBuilder: DashBoardBuildable
	) {
		self.dashBoardBuilder = dashBoardBuilder
		super.init(interactor: interactor, viewController: viewController)
		interactor.router = self
	}

	// MARK: - FinanceRouting
	func attachDashBoard() {
		let dashBoardRouter = dashBoardBuilder.build(withListener: interactor)
		attachChild(dashBoardRouter)

		viewController.addDashBoard(dashBoardRouter.viewControllable)
	}
}
