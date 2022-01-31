//
//  RootRouter.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

/*
 Riblet 트리를 만들고 View, ViewController 간에 라우팅을 담당
 자식 Riblet을 만드는 경우, 자식 Builder에서 build 메소드를 통해 Router를 만들고
 attachChild 메소드를 통해 instance를 참조시킴 + activate, load 메소드 실행
 ViewController를 등장 시키는건 개발자의 몫이다.
 */

import RIBs

protocol RootInteractable: Interactable, ParentListener {
	var router: RootRouting? { get set }
	var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
	// TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

	// MARK: - Properties

	private let parentBuilder: ParentBuildable

	// MARK: - Con(De)structor
	// TODO: Constructor inject child builder protocols to allow building children.
	init(
		parentBuilder: ParentBuildable,
		interactor: RootInteractable,
		viewController: RootViewControllable
	) {
		self.parentBuilder = parentBuilder
		super.init(interactor: interactor, viewController: viewController)
		interactor.router = self
	}

	// MARK: - Overridden: LaunchRouter

	override func didLoad() {
		super.didLoad()

		attachParentRIB()
	}

	// MARK: - Private methods

	private func attachParentRIB() {
		let router = parentBuilder.build(withListener: interactor)
		attachChild(router)
		viewController.present(router.viewControllable, animated: true, completion: nil)
		/*
		 .viewControllable을 사용하는 이유 -> UIKit을 import 하지 않기 위해, UIViewController를 한번 감싼 Interface임.
		 */
	}
}

