//
//  SignUpInfo.swift
//  Networking
//
//  Created by e_oneg1n on 14.05.2020.
//  Copyright © 2020 Homecoding. All rights reserved.
//

public struct SignUpInfo: Encodable {
    
    public let accountName: String
    public let password: String
    public let email: String
    
    public init(accountName: String,
                password: String,
                email: String) {
        self.accountName = accountName
        self.password = password
        self.email = email
    }
    
    private enum CodingKeys : String, CodingKey {
        case accountName = "username", password, email
    }
}
