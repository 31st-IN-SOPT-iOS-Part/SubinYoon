//
//  PhotoListCVC.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/03.
//

import UIKit

final class PhotoListCVC: UICollectionViewCell {
    
    // MARK: - UI
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
    }
    
    private let countLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.backgroundColor = .clear
        $0.textColor = .black
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 9
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
extension PhotoListCVC {
    func initCell(model: PhotoModel) {
        imageView.image = model.image
    }
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews(imageView, countLabel)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(2)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(2)
            make.trailing.equalTo(imageView).inset(2)
            make.width.height.equalTo(18)
        }
    }
}
