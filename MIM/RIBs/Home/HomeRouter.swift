//
//  HomeRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs

protocol HomeInteractable: Interactable, FinanceListener {
	var router: HomeRouting? { get set }
	var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
	// TODO: Declare methods the router invokes to manipulate the view hierarchy.
	func setViewControllers(_ viewControllers: [ViewControllable])
}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRouting {

	// MARK: - Builder
	private let financeBuilder: FinanceBuildable
	
	// TODO: Constructor inject child builder protocols to allow building children.
	init(
		interactor: HomeInteractable,
		viewController: HomeViewControllable,
		financeBuilder: FinanceBuildable
	) {
		self.financeBuilder = financeBuilder
		super.init(interactor: interactor, viewController: viewController)
		interactor.router = self
	}

	// MARK: - HomeRouting
	func attachTabs() {
		let financeRouter = financeBuilder.build(withListener: interactor)

		attachChild(financeRouter)

		let viewControllers = [
			NavigationControllerable(root: financeRouter.viewControllable)
		]

		viewController.setViewControllers(viewControllers)
	}
}
