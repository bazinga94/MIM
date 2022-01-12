//
//  ChildRIBBuilder.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/12.
//

import RIBs

protocol ChildRIBDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
	var message: String { get }
}

final class ChildRIBComponent: Component<ChildRIBDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ChildRIBBuildable: Buildable {
    func build(withListener listener: ChildRIBListener) -> ChildRIBRouting
}

final class ChildRIBBuilder: Builder<ChildRIBDependency>, ChildRIBBuildable {

    override init(dependency: ChildRIBDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ChildRIBListener) -> ChildRIBRouting {
        let component = ChildRIBComponent(dependency: dependency)
        let viewController = ChildRIBViewController()
        let interactor = ChildRIBInteractor(presenter: viewController)
        interactor.listener = listener
        return ChildRIBRouter(interactor: interactor, viewController: viewController)
    }
}
