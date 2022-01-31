//
//  RootBuilder.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

/*
 Riblet의 객체들을 생성하고 Router를 반환
 */

import RIBs

protocol RootDependency: Dependency {
	// TODO: Declare the set of dependencies required by this RIB, but cannot be
	// created by this RIB.
}

final class RootComponent: Component<RootDependency> {
	// TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
	let rootViewController: RootViewController

	init(
		dependency: RootDependency,
		rootViewController: RootViewController
	) {
		self.rootViewController = rootViewController
		super.init(dependency: dependency)
	}
}

// MARK: - Builder

protocol RootBuildable: Buildable {
//    func build(withListener listener: RootListener) -> RootRouting
	func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

	override init(dependency: RootDependency) {
		super.init(dependency: dependency)
	}

	func build() -> LaunchRouting {
		let viewController = RootViewController()
		let component = RootComponent(
			dependency: dependency,
			rootViewController: viewController
		)
		let interactor = RootInteractor(presenter: viewController)

		let parentBuilder = ParentBuilder(dependency: component)

		return RootRouter(
			parentBuilder: parentBuilder,
			interactor: interactor,
			viewController: viewController
		)
	}

//    func build(withListener listener: RootListener) -> RootRouting {
//        let component = RootComponent(dependency: dependency)
//        let viewController = RootViewController()
//        let interactor = RootInteractor(presenter: viewController)
//        interactor.listener = listener
//        return RootRouter(interactor: interactor, viewController: viewController)
//    }
}
