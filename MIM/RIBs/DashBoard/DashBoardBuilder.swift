//
//  DashBoardBuilder.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs

protocol DashBoardDependency: Dependency {
	// TODO: Declare the set of dependencies required by this RIB, but cannot be
	// created by this RIB.
}

final class DashBoardComponent: Component<DashBoardDependency> {
	
	// TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol DashBoardBuildable: Buildable {
	func build(withListener listener: DashBoardListener) -> DashBoardRouting
}

final class DashBoardBuilder: Builder<DashBoardDependency>, DashBoardBuildable {
	
	override init(dependency: DashBoardDependency) {
		super.init(dependency: dependency)
	}
	
	func build(withListener listener: DashBoardListener) -> DashBoardRouting {
		let component = DashBoardComponent(dependency: dependency)
		let viewController = DashBoardViewController()
		let interactor = DashBoardInteractor(presenter: viewController)
		interactor.listener = listener
		return DashBoardRouter(interactor: interactor, viewController: viewController)
	}
}
