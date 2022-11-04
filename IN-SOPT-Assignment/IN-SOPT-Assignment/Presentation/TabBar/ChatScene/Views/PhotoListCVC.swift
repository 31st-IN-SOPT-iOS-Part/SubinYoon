//
//  PhotoListCVC.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/03.
//

import UIKit
import Combine

final class PhotoListCVC: UICollectionViewCell {
    
    // MARK: - Properties
    public var index: Int?
    
    private var isSelectedCell = false
    
    public lazy var imageViewTapped: Driver<(Int, Bool)> = {
        return containerButton.publisher(for: .touchUpInside)
            .map { _ in
                self.isSelectedCell.toggle()
                return (self.index!, self.isSelectedCell)
            }
            .asDriver()
    }()
    
    var cancellable: Set<AnyCancellable> = []

    // MARK: - UI
    private lazy var containerButton = UIButton(type: .system)
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
    }
    
    private let countLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.text = "0"
        $0.isHidden = true
        $0.textAlignment = .center
        $0.backgroundColor = .buttonYellow
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
    
    override func prepareForReuse() {
        self.cancellable = Set<AnyCancellable>()
    }
}

// MARK: - Methods
extension PhotoListCVC {
    func initCell(model: PhotoModel, selectedPhotoIndex: Int?) {
        imageView.image = model.image
        guard let selectedPhotoIndex = selectedPhotoIndex else {
            isSelectedCell = false
            changePhotoState(selectedIndex: nil)
            return
        }
        isSelectedCell = true
        changePhotoState(selectedIndex: selectedPhotoIndex)
    }
    
    private func setUI() {
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        addSubview(containerButton)
        containerButton.addSubviews(imageView, countLabel)
        
        containerButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(3)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(3)
            make.trailing.equalTo(imageView).inset(3)
            make.width.height.equalTo(18)
        }
    }
    
    func changePhotoState(selectedIndex: Int?) {
        self.backgroundColor = isSelectedCell ? .buttonYellow : .clear
        self.countLabel.isHidden = !isSelectedCell
        guard let selectedIndex = selectedIndex else { return }
        self.countLabel.text = "\(selectedIndex + 1)"
    }
}
