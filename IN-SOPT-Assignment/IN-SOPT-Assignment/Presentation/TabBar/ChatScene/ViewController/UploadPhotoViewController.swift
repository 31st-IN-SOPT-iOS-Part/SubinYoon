//
//  UploadPhotoViewController.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/11/03.
//

import UIKit
import Combine
final class UploadPhotoViewController : UIViewController {
    
    // MARK: - Properties
    var viewModel: PhotoViewModel!
    private var selectedPhotoIndex = PassthroughSubject<Int, Error>()
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - UI
    private let headerView = UIView()
    
    private lazy var cancelButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.closeIcn, for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "최근 항목"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    private let photoCountLabel = UILabel().then {
        $0.text = ""
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .buttonYellow
    }
    
    private lazy var uploadButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "전송", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .regular), .foregroundColor: UIColor.black]), for: .normal)
        $0.addTarget(self, action: #selector(uploadButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var photoListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        return collectionView
    }()
        
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
        setDelegate()
        registerCells()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubviews(headerView, photoListCollectionView)
        headerView.addSubviews(cancelButton, titleLabel, photoCountLabel, uploadButton)

        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        uploadButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
        
        photoCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(uploadButton.snp.leading)
            make.centerY.equalToSuperview()
        }
        
        photoListCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    private func bind() {
//        let input = PhotoViewModel.Input(photo: viewModel.photoModel[selectedPhotoIndex])
//        let output = viewModel.transform(from: input)
    
    }
    
    private func setDelegate() {
        photoListCollectionView.delegate = self
        photoListCollectionView.dataSource = self
    }
    
    private func registerCells() {
        photoListCollectionView.register(AddPhotoCVC.self, forCellWithReuseIdentifier: AddPhotoCVC.className)
        photoListCollectionView.register(PhotoListCVC.self, forCellWithReuseIdentifier: PhotoListCVC.className)
    }
    
    @objc private func cancelButtonDidTap() {
        self.dismiss(animated: true)
    }
    
    @objc private func uploadButtonDidTap() {
        print("upload Button Did Tap")
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension UploadPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getPhotoCellCount() + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            guard let addCell = collectionView.dequeueReusableCell(withReuseIdentifier: AddPhotoCVC.className, for: indexPath)
                    as? AddPhotoCVC else { return UICollectionViewCell() }
            return addCell
        } else {
            guard let listCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoListCVC.className, for: indexPath)
                    as? PhotoListCVC else { return UICollectionViewCell() }
            listCell.initCell(model: viewModel.photoModel[indexPath.item - 1])
            return listCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            // 진짜 카메라 띄우기
        } else {
            // 셀 클릭 이벤트
        }
    }
}

// MARK: - UICollectionViewFlowLayout
extension UploadPhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (collectionView.frame.width - 10) / 3
        return CGSize(width: length, height: length)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
