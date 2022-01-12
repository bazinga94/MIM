//
//  ChildRIBViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/12.
//

import RIBs
import RxSwift
import UIKit

protocol ChildRIBPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ChildRIBViewController: UIViewController, ChildRIBPresentable, ChildRIBViewControllable {

    weak var listener: ChildRIBPresentableListener?
}
