//
//  RootComponent+Parent.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs

extension RootComponent: ParentDependency {
	var message: String {
		"Hello RIBs~"
	}
}

