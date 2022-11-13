//
//  ChatCollectionViewHeader.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/02.
//

import UIKit

final class ChatCollectionViewHeader: UICollectionReusableView {
    
    // MARK: - UI Components
    private let imageView = UIImageView().then {
        $0.image = ImageLiterals.subinImage
        $0.contentMode = .scaleToFill
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 6
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods
extension ChatCollectionViewHeader {
    private func setUI() {
        backgroundColor = .white
    }
    
    private func setLayout() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
