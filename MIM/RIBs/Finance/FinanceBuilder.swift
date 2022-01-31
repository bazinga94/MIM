//
//  FinanceBuilder.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs

protocol FinanceDependency: Dependency {
	// TODO: Declare the set of dependencies required by this RIB, but cannot be
	// created by this RIB.
}

final class FinanceComponent: Component<FinanceDependency> {
	
	// TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol FinanceBuildable: Buildable {
	func build(withListener listener: FinanceListener) -> FinanceRouting
}

final class FinanceBuilder: Builder<FinanceDependency>, FinanceBuildable {
	
	override init(dependency: FinanceDependency) {
		super.init(dependency: dependency)
	}
	
	func build(withListener listener: FinanceListener) -> FinanceRouting {
		let _ = FinanceComponent(dependency: dependency)
		let viewController = FinanceViewController()
		let interactor = FinanceInteractor(presenter: viewController)
		interactor.listener = listener
		return FinanceRouter(interactor: interactor, viewController: viewController)
	}
}
