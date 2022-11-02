//
//  FriendsTVC.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/31.
//

import UIKit

final class FriendsTVC: UITableViewCell {
    
    // MARK: - UI
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
    }
    
    private let captionLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        $0.textColor = .subtitleGray
    }
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods
extension FriendsTVC {
    func initCell(model: FriendsModel) {
        profileImageView.image = model.profileImage
        userNameLabel.text = model.userName
        captionLabel.text = model.caption
    }
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews(profileImageView, userNameLabel, captionLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(10)
        }
        
        captionLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.top.equalTo(userNameLabel.snp.bottom).offset(4)
        }
    }
}
