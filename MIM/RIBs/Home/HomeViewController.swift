//
//  HomeViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/31.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: AnyObject {
	// TODO: Declare properties and methods that the view controller can invoke to perform
	// business logic, such as signIn(). This protocol is implemented by the corresponding
	// interactor class.
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {
	
	weak var listener: HomePresentableListener?
}
