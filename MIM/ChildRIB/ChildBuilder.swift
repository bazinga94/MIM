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
}

final class ChildComponent: Component<ChildDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ChildBuildable: Buildable {
    func build(withListener listener: ChildListener) -> ChildRouting
}

final class ChildBuilder: Builder<ChildDependency>, ChildBuildable {

    override init(dependency: ChildDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ChildListener) -> ChildRouting {
        let component = ChildComponent(dependency: dependency)
        let viewController = ChildViewController()
        let interactor = ChildInteractor(presenter: viewController)
        interactor.listener = listener
        return ChildRouter(interactor: interactor, viewController: viewController)
    }
}
