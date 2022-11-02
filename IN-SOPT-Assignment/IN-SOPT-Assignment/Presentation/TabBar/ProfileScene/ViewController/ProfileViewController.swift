//
//  ProfileViewController.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import UIKit
import Combine

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: ProfileViewModel!
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - UI
    private lazy var cancelButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.closeIcn, for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
    }
    
    private let userImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.textColor = .white
    }
    
    private let horizontalLine = UIView().then {
        $0.backgroundColor = .lineLightGray
    }
    
    private let chatView = BottomButtonView(imageName: ImageLiterals.talkIcn, title: "나와의 채팅")
    private let editProfileView = BottomButtonView(imageName: ImageLiterals.editIcn, title: "프로필 편집")
    private let kakaoStoryView = BottomButtonView(imageName: ImageLiterals.storyIcn, title: "카카오스토리")
    
    private lazy var bottomStackView = UIStackView(arrangedSubviews: [chatView, editProfileView, kakaoStoryView]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .friendTabBackground
        
        view.addSubviews(cancelButton, userImageView, userNameLabel, horizontalLine, bottomStackView)
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(14)
        }
        
        userImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.centerY.equalTo(view.safeAreaLayoutGuide).multipliedBy(1.4)
            make.width.height.equalTo(96)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(userImageView.snp.bottom).offset(8)
        }
        
        horizontalLine.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(userNameLabel.snp.bottom).offset(40)
            make.height.equalTo(1)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.top.equalTo(horizontalLine.snp.bottom).offset(10)
            make.height.equalTo(72)
        }
    }
    
    private func bind() {
        userImageView.image = viewModel.getUserImage()
        userNameLabel.text = viewModel.getUserName()
    }
    
    @objc private func cancelButtonDidTap() {
        self.dismiss(animated: true)
    }
}
