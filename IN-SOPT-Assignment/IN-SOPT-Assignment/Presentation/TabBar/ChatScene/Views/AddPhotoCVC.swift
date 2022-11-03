//
//  AddPhotoCVC.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/03.
//

import UIKit

final class AddPhotoCVC: UICollectionViewCell {
    
    // MARK: - UI
    private let cameraImageView = UIImageView().then {
        $0.image = ImageLiterals.cameraIcn
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
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
extension AddPhotoCVC {
    private func setUI() {
        self.backgroundColor = .black.withAlphaComponent(0.1)
    }
    
    private func setLayout() {
        addSubview(cameraImageView)
        
        cameraImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(35)
        }
    }
}
