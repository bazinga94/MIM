//
//  AppComponent.swift
//  MIM
//
//  Created by Jongho Lee on 2022/01/13.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
	init() {
		super.init(dependency: EmptyComponent())
	}
}
