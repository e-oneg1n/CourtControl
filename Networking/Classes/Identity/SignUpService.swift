//
//  SignUpService.swift
//  Networking
//
//  Created by e_oneg1n on 13.05.2020.
//  Copyright © 2020 Homecoding. All rights reserved.
//

import Alamofire

public protocol SignUpServiceProtocol {
    
    func signUp(with info: SignUpInfo, completion: @escaping (Result<Void, Error>) -> Void)
}

public struct SignUpService: SignUpServiceProtocol {
    
    public init() {}
    
    public func signUp(with info: SignUpInfo, completion: @escaping (Result<Void, Error>) -> Void) {
        let host = "http://80.211.169.108:8080"
        let signUpPath = "/api/account/register"
        
        guard let signUpURL = URL(string: host + signUpPath) else {
            print("Sign Up URL isn't valid")
            return
        }
        let headers = HTTPHeaders(arrayLiteral:
            HTTPHeader(name: "Content-Type", value: "application/json")
        )
        
        AF.request(signUpURL,
                   method: .post,
                   parameters: info,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success:
                    print("Account has been created")
                    completion(.success(()))
                case .failure(let error):
                    if case error.responseCode = 409 {
                        print("Account has already exist")
                    } else {
                        print("API error occurs: \(error.errorDescription ?? "")")
                    }
                    completion(.failure(error))
                }
        }
    }
}
