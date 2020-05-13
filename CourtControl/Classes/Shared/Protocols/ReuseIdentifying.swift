//
//  ReuseIdentifying.swift
//  CourtControl
//
//  Created by e_oneg1n on 06.05.2020.
//  Copyright © 2020 Homecoding. All rights reserved.
//

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
