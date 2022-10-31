//
//  BottomButtonView.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import UIKit

final class BottomButtonView: UIView {
    
    // MARK: - UI
    private let containterView = UIView()
    
    private let iconImageView = UIImageView().then {
        $0.image = ImageLiterals.profileImgSample
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .white
    }
    
    // MARK: - Initialization
    init(imageName: UIImage, title: String) {
        super.init(frame: .zero)
        configureUI()
        setIcon(imageName: imageName, title: title)
        setTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func configureUI() {
        addSubviews(containterView)
        containterView.addSubviews(iconImageView, titleLabel)
        
        containterView.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(72)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(15)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconImageView.snp.bottom).offset(5)
        }
    }
    
    private func setIcon(imageName: UIImage, title: String) {
        self.iconImageView.image = imageName
        self.titleLabel.text = title
    }
    
    private func setTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(containerViewDidTap))
        containterView.addGestureRecognizer(tap)
    }
    
    @objc private func containerViewDidTap() {
        print("\(titleLabel.text ?? "") view did tap")
    }
}
