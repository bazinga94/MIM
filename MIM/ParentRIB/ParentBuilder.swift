//
//  ParentBuilder.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs

protocol ParentDependency: Dependency {
	// TODO: Declare the set of dependencies required by this RIB, but cannot be
	// created by this RIB.
	var message: String { get }
}

final class ParentComponent: Component<ParentDependency> {
	// TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
	var message: String {
		dependency.message
	}
}

// MARK: - Builder

protocol ParentBuildable: Buildable {
	func build(withListener listener: ParentListener) -> ParentRouting
}

final class ParentBuilder: Builder<ParentDependency>, ParentBuildable {

	override init(dependency: ParentDependency) {
		super.init(dependency: dependency)
	}

	func build(withListener listener: ParentListener) -> ParentRouting {
		let component = ParentComponent(dependency: dependency)
		let viewController = ParentViewController()
		let interactor = ParentInteractor(
			message: component.message,
			presenter: viewController
		)
		interactor.listener = listener
		return ParentRouter(interactor: interactor, viewController: viewController)
	}
}
