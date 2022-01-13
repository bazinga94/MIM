//
//  RootRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs
import UIKit

protocol RootInteractable: Interactable, ParentListener {
	var router: RootRouting? { get set }
	var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
	// TODO: Declare methods the router invokes to manipulate the view hierarchy.
	func present(_ viewController: ViewControllable, animated: Bool)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

	// MARK: - Properties

	private let parentBuilder: ParentBuildable

	// MARK: - Con(De)structor

	init(
		parentBuilder: ParentBuildable,
		interactor: RootInteractable,
		viewController: RootViewControllable
	) {
		self.parentBuilder = parentBuilder
		super.init(interactor: interactor, viewController: viewController)
		interactor.router = self
	}

//	// TODO: Constructor inject child builder protocols to allow building children.
//	override init(interactor: RootInteractable, viewController: RootViewControllable) {
//		super.init(interactor: interactor, viewController: viewController)
//		interactor.router = self
//	}

	// MARK: - Overridden: LaunchRouter

	override func didLoad() {
		super.didLoad()

		attachImageRIB()
	}

	// MARK: - Private methods

	private func attachImageRIB() {
		let router = parentBuilder.build(withListener: interactor)
		attachChild(router)
		viewController.present(router.viewControllable, animated: false)
	}
}

