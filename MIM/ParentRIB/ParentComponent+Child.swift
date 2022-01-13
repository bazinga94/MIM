//
//  ParentComponent+Child.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs

extension ParentComponent: ChildDependency {
	var message: String {
		"Hello RIBs~"
	}
}
