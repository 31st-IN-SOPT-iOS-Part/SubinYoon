//
//  SignInViewController.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/02.
//

import UIKit
import Combine
import SnapKit
import Then

final class SignInViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: SignInViewModel!
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - UI
    private lazy var headerView = UIView()
    
    private let titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        $0.textColor = .black
    }
    
    private let subtitleLabel = UILabel().then {
        $0.text = """
                  사용하던 카카오계정이 있다면
                  이메일 또는 전화번호로 로그인해 주세요.
                  """
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .textGray
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private let emailTextFieldView = AuthTextFieldView(placeholder: "이메일 또는 전화번호", isSecureTextEntry: false)
    
    private let passwordTextFieldView = AuthTextFieldView(placeholder: "비밀번호", isSecureTextEntry: true)
    
    private lazy var textFieldStackView = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView]).then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    private lazy var signInButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "카카오계정 로그인", attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .medium), .foregroundColor: UIColor.black]), for: .normal)
        $0.backgroundColor = .buttonGray
        $0.isEnabled = false
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var signUpButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "새로운 카카오계정 만들기", attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .medium), .foregroundColor: UIColor.black]), for: .normal)
        $0.backgroundColor = .buttonGray
        $0.isEnabled = false
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var findAccountButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "카카오계정 또는 비밀번호 찾기", attributes: [.font: UIFont.systemFont(ofSize: 13, weight: .medium), .foregroundColor: UIColor.textDarkGray]), for: .normal)
    }
    
    private lazy var buttonStackView = UIStackView(arrangedSubviews: [signInButton, signUpButton, findAccountButton]).then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = SignInViewModel()
        configureUI()
        bind()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubviews(headerView, textFieldStackView, buttonStackView)
        headerView.addSubviews(titleLabel, subtitleLabel)
        
        headerView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.top.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(100)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(textFieldStackView.snp.bottom).offset(35)
            make.height.equalTo(150)
        }
    }
    
    private func bind() {
        let input = SignInViewModel.Input(emailText: emailTextFieldView.$text, passwordText: passwordTextFieldView.$text)
        
        let output = viewModel.transform(from: input)
        
        output.isSignInValid.sink { [weak self] isValid in
            self?.signInButton.backgroundColor = isValid ? UIColor.buttonYellow : UIColor.buttonGray
            self?.signInButton.isEnabled = isValid
        }.store(in: &self.cancellable)
    }
    
    @objc private func signInButtonDidTap() {
        // 환영 뷰로 전환
    }
    
    @objc private func signUpButtonDidTap() {
        // 회원가입 뷰로 전환
    }
}

