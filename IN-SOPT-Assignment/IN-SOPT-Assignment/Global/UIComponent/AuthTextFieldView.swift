//
//  AuthTextFieldView.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import UIKit
import Combine

final class AuthTextFieldView: UIView {
    
    // MARK: - Properties
    @Published var text: String = ""
    
    // MARK: - UI
    private let textField = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.clearButtonMode = .whileEditing
    }
    
    private let horizontalLine = UIView().then {
        $0.backgroundColor = .lineDarkGray
    }
    
    // MARK: - Initialization
    init(placeholder: String, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        configureUI()
        setDelegate()
        setTextField(isSecureTextEntry: isSecureTextEntry)
        setPlaceholder(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        addSubviews(textField, horizontalLine)
        
        textField.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        horizontalLine.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private func setDelegate() {
        self.textField.delegate = self
    }
    
    private func setTextField(isSecureTextEntry: Bool) {
        self.textField.isSecureTextEntry = isSecureTextEntry
    }
    
    private func setPlaceholder(placeholder: String) {
        self.textField.placeholder = placeholder
    }
}

// MARK: - UITextFieldDelegate
extension AuthTextFieldView: UITextFieldDelegate {    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.text = textField.text ?? ""
    }
}
