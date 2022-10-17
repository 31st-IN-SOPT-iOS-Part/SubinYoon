//
//  SignUpViewController.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import UIKit
import Combine

final class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: SignUpViewModel!
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - UI
    private let titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        $0.textColor = .black
    }
    
    private let emailTextFieldView = AuthTextFieldView(placeholder: "이메일 또는 전화번호", isSecureTextEntry: false)
    
    private let passwordTextFieldView = AuthTextFieldView(placeholder: "비밀번호", isSecureTextEntry: true)
    
    private let passwordCheckTextFieldView = AuthTextFieldView(placeholder: "비밀번호 확인", isSecureTextEntry: true)
    
    private lazy var textFieldStackView = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, passwordCheckTextFieldView]).then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    private lazy var signUpButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "새로운 카카오계정 만들기", attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .medium), .foregroundColor: UIColor.black]), for: .normal)
        $0.backgroundColor = .buttonGray
        $0.isEnabled = false
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, textFieldStackView, signUpButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(110)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(150)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.top.equalTo(textFieldStackView.snp.bottom).offset(20)
            make.height.equalTo(45)
        }
    }
    
    private func bind() {
        let input = SignUpViewModel.Input(emailText: emailTextFieldView.$text, passwordText: passwordTextFieldView.$text, passwordCheckText: passwordCheckTextFieldView.$text)
        let output = viewModel.transform(from: input)
        
        output.isSignUpValid.sink { [weak self] isValid in
            self?.signUpButton.backgroundColor = isValid ? UIColor.buttonYellow : UIColor.buttonGray
            self?.signUpButton.isEnabled = isValid
        }.store(in: &self.cancellable)
    }
    
    @objc private func signUpButtonDidTap() {
        let authCompleteViewController = ModuleFactory.shared.makeAuthCompleteViewController(email: emailTextFieldView.text, password: passwordTextFieldView.text)
        authCompleteViewController.modalPresentationStyle = .fullScreen
        present(authCompleteViewController, animated: true, completion: nil)
    }
}
