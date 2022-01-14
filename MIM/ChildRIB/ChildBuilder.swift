//
//  ChildBuilder.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs

protocol ChildDependency: Dependency {
	// TODO: Declare the set of dependencies required by this RIB, but cannot be
	// created by this RIB.
	var message: String { get }
}

final class ChildComponent: Component<ChildDependency> {

	// TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
	fileprivate var message: String {
		dependency.message
	}
}

// MARK: - Builder

protocol ChildBuildable: Buildable {
	func build(withListener listener: ChildListener, text: String) -> ChildRouting
}

final class ChildBuilder: Builder<ChildDependency>, ChildBuildable {

	override init(dependency: ChildDependency) {
		super.init(dependency: dependency)
	}

	func build(withListener listener: ChildListener, text: String) -> ChildRouting {
//		let component = ChildComponent(dependency: dependency)
		let viewController = ChildViewController()
		let interactor = ChildInteractor(
//			message: component.message,
			message: text,	// TODO: 이게 올바른 데이터 전달 방법인지 모르겠음..
			presenter: viewController
		)
		interactor.listener = listener
		return ChildRouter(interactor: interactor, viewController: viewController)
	}
}
