//
//  ChatViewController.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/31.
//

import UIKit
import Combine

final class ChatViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: ChatViewModel!
    var viewWillAppear = PassthroughSubject<Void, Error>()
    private var chatModelList = [ChatModel]()
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - UI
    private lazy var naviChatButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "채팅", attributes: [.font: UIFont.systemFont(ofSize: 22, weight: .medium), .foregroundColor: UIColor.black]), for: .normal)
    }
    
    private lazy var naviOpenChatButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "오픈채팅", attributes: [.font: UIFont.systemFont(ofSize: 22, weight: .semibold), .foregroundColor: UIColor.subtitleGray]), for: .normal)
    }
    
    private lazy var naviPlusButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.plusIcn, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 21, height: 21)
        $0.addTarget(self, action: #selector(plusButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var naviSettingButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.settingIcn, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 21, height: 21)
    }
    
    private lazy var chatListCollectionView: UICollectionView = {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppear.send()
    }
    
    // MARK: - Functions
    private func configureUI() {
        navigationBarUI()
        
        view.backgroundColor = .white
        
        view.addSubview(chatListCollectionView)
        
        chatListCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func navigationBarUI() {
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 8
        
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: naviChatButton), spacer, UIBarButtonItem(customView: naviOpenChatButton)]
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: naviSettingButton), spacer, UIBarButtonItem(customView: naviPlusButton)]
    }
    
    private func bind() {
        let input = ChatViewModel.Input(viewWillAppear: viewWillAppear)
        let output = viewModel.transform(from: input)
        
        output.chatModel.sink { _ in
        } receiveValue: { models in
            self.chatModelList = models
            self.chatListCollectionView.reloadData()
        }.store(in: &cancellable)
    }
    
    private func setDelegate() {
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
    }
    
    private func registerCells() {
        chatListCollectionView.register(ChatCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChatCollectionViewHeader.className)
        chatListCollectionView.register(ChatCVC.self, forCellWithReuseIdentifier: ChatCVC.className)
    }
    
    @objc func plusButtonDidTap() {
        let uploadPhotoViewController = ModuleFactory.shared.makeUploadPhotoViewController()
        uploadPhotoViewController.modalPresentationStyle = .overFullScreen
        present(uploadPhotoViewController, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ChatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatModelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCVC.className, for: indexPath)
                as? ChatCVC else { return UICollectionViewCell() }
        cell.initCell(model: chatModelList[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout
extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ChatCollectionViewHeader.className, for: indexPath)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: 80)
    }
}
