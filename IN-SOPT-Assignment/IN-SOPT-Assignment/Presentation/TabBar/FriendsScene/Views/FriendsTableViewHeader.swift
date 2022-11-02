//
//  FriendsTableViewHeader.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/01.
//

import UIKit

final class FriendsTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .black
    }
    
    private let captionLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        $0.textColor = .subtitleGray
    }
    
    private let horizontalLine = UIView().then {
        $0.backgroundColor = .black.withAlphaComponent(0.05)
    }
    
    // MARK: - Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setUI()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension FriendsTableViewHeader {
    func initHeader(model: UserModel) {
        profileImageView.image = model.profileImage
        userNameLabel.text = model.userName
        captionLabel.text = model.caption
    }
    
    private func setUI() {
        contentView.backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews(profileImageView, userNameLabel, captionLabel, horizontalLine)
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(58)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(20)
        }
        
        captionLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.top.equalTo(userNameLabel.snp.bottom).offset(4)
        }
        
        horizontalLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(1)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }
    }
}
