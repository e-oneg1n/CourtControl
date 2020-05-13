//
//  SignUpActionCell.swift
//  CourtControl
//
//  Created by e_oneg1n on 06.05.2020.
//  Copyright © 2020 Homecoding. All rights reserved.
//

import UIKit

protocol SignUpActionCellDelegate: AnyObject {
    
    func signUpButtonDidTap()
}

final class SignUpActionCell: UITableViewCell, ReuseIdentifying {
    
    private let signUpButton = UIButton(type: .system)
    
    weak var delegate: SignUpActionCellDelegate?

    func configure() {
        contentView.addSubview(signUpButton)
  
        configureSignUpButton()
        layoutSignUpButton()
    }
    
    private func configureSignUpButton() {
        signUpButton.setTitle("Зареєструватися", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    private func layoutSignUpButton() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

        signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        signUpButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    @objc
    private func signUp() {
        delegate?.signUpButtonDidTap()
    }
}
