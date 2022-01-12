//
//  ParentRIBViewController.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/12.
//

import RIBs
import RxSwift
import UIKit

protocol ParentRIBPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ParentRIBViewController: UIViewController, ParentRIBPresentable, ParentRIBViewControllable {

    weak var listener: ParentRIBPresentableListener?
}
