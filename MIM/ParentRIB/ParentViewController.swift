//
//  ParentViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs
import RxSwift
import UIKit

protocol ParentPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ParentViewController: UIViewController, ParentPresentable, ParentViewControllable {

    weak var listener: ParentPresentableListener?
}
