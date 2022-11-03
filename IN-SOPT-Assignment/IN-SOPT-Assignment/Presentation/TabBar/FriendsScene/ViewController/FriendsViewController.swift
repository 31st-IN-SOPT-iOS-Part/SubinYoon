//
//  FriendsViewController.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/14.
//

import UIKit
import Combine

final class FriendsViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    var viewModel: FriendsViewModel!
    private var viewWillAppear = PassthroughSubject<Void, Error>()
    private var friendsModelList = [FriendsModel]()
    private var cancellable: Set<AnyCancellable> = []

    // MARK: - UI
    private lazy var naviFriendButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "친구", attributes: [.font: UIFont.systemFont(ofSize: 22, weight: .semibold), .foregroundColor: UIColor.black]), for: .normal)
    }
    
    private lazy var naviSettingButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.settingIcn, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 21, height: 21)
    }
    
    private let friendsListTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: CGFloat.leastNonzeroMagnitude))
    }
    
    
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
        
        view.addSubview(friendsListTableView)

        friendsListTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func navigationBarUI() {
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: naviFriendButton), animated: false)
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: naviSettingButton), animated: false)
    }
    
    private func bind() {
        let input = FriendsViewModel.Input(viewWillAppear: viewWillAppear)
        let output = viewModel.transform(from: input)
        
        output.friendsModel.sink { _ in
        } receiveValue: { models in
            self.friendsModelList = models
        }.store(in: &cancellable)
    }
    
    private func setDelegate() {
        friendsListTableView.delegate = self
        friendsListTableView.dataSource = self
    }
    
    private func registerCells() {
        friendsListTableView.register(FriendsTableViewHeader.self, forHeaderFooterViewReuseIdentifier: FriendsTableViewHeader.className)
        friendsListTableView.register(FriendsTVC.self, forCellReuseIdentifier: FriendsTVC.className)
    }
    
    @objc private func headerViewDidTap(gestureRecognizer: UIGestureRecognizer) {
        let profileViewController = ModuleFactory.shared.makeProfileViewController(userModel: FriendsModel())
        profileViewController.modalPresentationStyle = .fullScreen
        present(profileViewController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate
extension FriendsViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendsTableViewHeader.className)
                as? FriendsTableViewHeader else { return UIView() }
        headerView.initHeader(model: viewModel.getUserModel())

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerViewDidTap))
        tapGesture.delegate = self
        headerView.addGestureRecognizer(tapGesture)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            self.friendsModelList.remove(at: indexPath.row)
            self.friendsListTableView.reloadData()
            success(true)
        }
        delete.backgroundColor = .systemRed
        
        let config = UISwipeActionsConfiguration(actions: [delete])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

// MARK: - UITableViewDataSource
extension FriendsViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsModelList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FriendsTVC.className, for: indexPath)
                as? FriendsTVC else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.initCell(model: friendsModelList[indexPath.row])

        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileViewController = ModuleFactory.shared.makeProfileViewController(userModel: friendsModelList[indexPath.row])
        profileViewController.modalPresentationStyle = .fullScreen
        present(profileViewController, animated: true, completion: nil)
    }
}
