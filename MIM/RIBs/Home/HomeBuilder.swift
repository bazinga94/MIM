//
//  HomeBuilder.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs

protocol HomeDependency: Dependency {
	// TODO: Declare the set of dependencies required by this RIB, but cannot be
	// created by this RIB.
}

final class HomeComponent: Component<HomeDependency> {
	
	// TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol HomeBuildable: Buildable {
	func build(withListener listener: HomeListener) -> HomeRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {
	
	override init(dependency: HomeDependency) {
		super.init(dependency: dependency)
	}

	func build(withListener listener: HomeListener) -> HomeRouting {
		let component = HomeComponent(dependency: dependency)
		let viewController = HomeViewController()
		let interactor = HomeInteractor(presenter: viewController)
		interactor.listener = listener

		let dashBoardBuilder = DashBoardBuilder(dependency: component)
		let financeBuilder = FinanceBuilder(dependency: component)

		return HomeRouter(
			interactor: interactor,
			viewController: viewController,
			financeBuilder: financeBuilder,
			dashBoardBuilder: dashBoardBuilder
		)
	}
}
