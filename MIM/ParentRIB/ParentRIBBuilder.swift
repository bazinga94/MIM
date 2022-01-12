//
//  ParentRIBBuilder.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/12.
//

import RIBs

protocol ParentRIBDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ParentRIBComponent: Component<ParentRIBDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ParentRIBBuildable: Buildable {
    func build(withListener listener: ParentRIBListener) -> ParentRIBRouting
}

final class ParentRIBBuilder: Builder<ParentRIBDependency>, ParentRIBBuildable {

    override init(dependency: ParentRIBDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ParentRIBListener) -> ParentRIBRouting {
        let component = ParentRIBComponent(dependency: dependency)
        let viewController = ParentRIBViewController()
        let interactor = ParentRIBInteractor(presenter: viewController)
        interactor.listener = listener
        return ParentRIBRouter(interactor: interactor, viewController: viewController)
    }
}
