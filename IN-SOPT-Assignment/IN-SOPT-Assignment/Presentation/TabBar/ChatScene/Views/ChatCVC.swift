//
//  ChatCVC.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/02.
//

import UIKit

final class ChatCVC: UICollectionViewCell {
    
    // MARK: - UI
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
    }
    
    private let messageLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        $0.textColor = .subtitleGray
    }
    
    private let timeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        $0.textColor = .subtitleGray
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods
extension ChatCVC {
    func initCell(model: ChatModel) {
        profileImageView.image = model.profileImage
        userNameLabel.text = model.userName
        messageLabel.text = model.message
        timeLabel.text = model.time
    }
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews(profileImageView, userNameLabel, messageLabel, timeLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(10)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.top.equalTo(userNameLabel.snp.bottom).offset(4)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
