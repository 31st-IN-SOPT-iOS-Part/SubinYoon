//
//  AuthCompleteViewController.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import UIKit

final class AuthCompleteViewController: UIViewController {
    // MARK: - Properties
    var viewModel: AuthCompleteViewModel!
    
    // MARK: - UI
    private let welcomeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private lazy var completeButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "확인", attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .medium), .foregroundColor: UIColor.black]), for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .buttonYellow
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
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
        
        view.addSubviews(welcomeLabel, completeButton)
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
        }
        
        completeButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(120)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(45)
        }
    }
    
    private func bind() {
        welcomeLabel.text = viewModel.getUserEmail()
    }
    
    @objc private func completeButtonDidTap() {
        let friendsViewController = ModuleFactory.shared.makeFriendsViewController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(friendsViewController, animated: false)
    }
}
