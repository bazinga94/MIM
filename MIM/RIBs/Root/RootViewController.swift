//
//  RootViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {
	/*
	 TODO: Declare properties and methods that the view controller can invoke to perform business logic, such as signIn(). This protocol is implemented by the corresponding interactor class.
	 */
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

	// MARK: - RootPresentable

	weak var listener: RootPresentableListener?

	// MARK: - Overridden: UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .white
	}
}
