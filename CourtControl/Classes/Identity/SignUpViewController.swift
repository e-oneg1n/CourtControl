//
//  SignUpViewController.swift
//  CourtControl
//
//  Created by e_oneg1n on 30.04.2020.
//  Copyright © 2020 Homecoding. All rights reserved.
//

import UIKit
import Networking

class SignUpViewController: UITableViewController {
    
    private let signUpService: SignUpServiceProtocol
    
    init(signUpService: SignUpServiceProtocol) {
        self.signUpService = signUpService
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Створити Аккаунт"
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 60
        self.tableView.register(SignUpInfoCell.self, forCellReuseIdentifier: SignUpInfoCell.reuseIdentifier)
        self.tableView.register(SignUpActionCell.self, forCellReuseIdentifier: SignUpActionCell.reuseIdentifier)
    }
}

// MARK: - Table view data source

extension SignUpViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 4 : 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            if let infoCell = tableView.dequeueReusableCell(withIdentifier: SignUpInfoCell.reuseIdentifier,
                                                            for: indexPath) as? SignUpInfoCell {
                infoCell.configure()
                return infoCell
            }
        case 1:
            if let actionCell = tableView.dequeueReusableCell(withIdentifier: SignUpActionCell.reuseIdentifier,
                                                              for: indexPath) as? SignUpActionCell {
                actionCell.delegate = self
                actionCell.configure()
                return actionCell
            }
        default:
            return defaultCell
        }
        
        return defaultCell
    }
}

extension SignUpViewController: SignUpActionCellDelegate {
    
    func signUpButtonDidTap() {
        signUpService.signUp(with: SignUpInfo(accountName: "ios_test2", password: "passw0rd", email: "ios_test2@gmail.com")) { result in
            switch result {
            case .success:
                print("OK")
            case .failure:
                print("NOT OK")
            }
        }
    }
}
