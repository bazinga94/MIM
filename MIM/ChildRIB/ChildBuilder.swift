//
//  ChildBuilder.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs

protocol ChildDependency: Dependency {
	// TODO: Declare the set of dependencies required by this RIB, but cannot be created by this RIB.
//	var message: String { get }
}

final class ChildComponent: Component<ChildDependency> {

	// TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
//	fileprivate var message: String {
//		dependency.message
//	}
	let message: String

	init(dependency: ChildDependency, message: String) {
		self.message = message
		super.init(dependency: dependency)
	}
}

// MARK: - Builder

protocol ChildBuildable: Buildable {
	func build(withListener listener: ChildListener, message: String) -> ChildRouting
}

final class ChildBuilder: Builder<ChildDependency>, ChildBuildable {

	override init(dependency: ChildDependency) {
		super.init(dependency: dependency)
	}

	func build(withListener listener: ChildListener, message: String) -> ChildRouting {
		let component = ChildComponent(dependency: dependency, message: message)
		let viewController = ChildViewController()
		let interactor = ChildInteractor(
			message: component.message,
			presenter: viewController
		)
		interactor.listener = listener
		return ChildRouter(interactor: interactor, viewController: viewController)
	}
}
