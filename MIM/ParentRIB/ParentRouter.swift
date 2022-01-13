//
//  ParentRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs

protocol ParentInteractable: Interactable, ChildListener {
	var router: ParentRouting? { get set }
	var listener: ParentListener? { get set }
}

protocol ParentViewControllable: ViewControllable {
	// TODO: Declare methods the router invokes to manipulate the view hierarchy.
	func present(_ viewController: ViewControllable, animated: Bool)
	func dismiss(_ viewController: ViewControllable, animated: Bool)
}

final class ParentRouter: ViewableRouter<ParentInteractable, ParentViewControllable>, ParentRouting {

	private var childBuilder: ChildBuildable

	private var childRouter: ChildRouting?

	// TODO: Constructor inject child builder protocols to allow building children.

	init(
		interactor: ParentInteractable,
		viewController: ParentViewControllable,
		childBuilder: ChildBuildable
	) {
		self.childBuilder = childBuilder
		super.init(interactor: interactor, viewController: viewController)
		interactor.router = self
	}
}

// MARK: - ParentRouting
extension ParentRouter {
	func attachChildRIB() {
		let router = childBuilder.build(withListener: interactor)
		childRouter = router
		attachChild(router)
		viewController.present(router.viewControllable, animated: true)
	}

	func detachChildRIB() {

	}
}
