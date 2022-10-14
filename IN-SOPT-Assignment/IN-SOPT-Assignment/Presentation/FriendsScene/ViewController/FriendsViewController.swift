//
//  FriendsViewController.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import UIKit
import Combine

final class FriendsViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: FriendsViewModel!
    private var cancellable: Set<AnyCancellable> = []

    // MARK: - UI
    private lazy var naviFriendButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "친구", attributes: [.font: UIFont.systemFont(ofSize: 22, weight: .semibold), .foregroundColor: UIColor.black]), for: .normal)
    }
    
    private lazy var naviSettingButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.settingIcn, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 21, height: 21)
    }
    
    private lazy var headerView = UIView()
    
    private let userImageView = UIImageView().then {
        $0.image = ImageLiterals.profileImg
        $0.contentMode = .scaleAspectFit
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
        setTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Functions
    private func configureUI() {
        navigationBarUI()
        
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        headerView.addSubviews(userImageView, userNameLabel)

        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(58)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    private func navigationBarUI() {
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: naviFriendButton), animated: false)
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: naviSettingButton), animated: false)
    }
    
    private func bind() {
        userNameLabel.text = viewModel.getUserName()
    }
    
    private func setTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(headerViewDidTap))
        headerView.addGestureRecognizer(tap)
    }
    
    @objc private func headerViewDidTap() {
        let profileViewController = ProfileViewController()
        profileViewController.viewModel = ProfileViewModel(userModel: viewModel.userModel)
        
        profileViewController.modalPresentationStyle = .fullScreen
        present(profileViewController, animated: true, completion: nil)
    }
}
