//
//  MeetingListViewController.swift
//  
//
//  Created by 박건우 on 2022/08/06.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import DesignSystem
import SnapKit
import MeetingListRoutingProtocol
import MeetingListRouter

protocol MeetingListDisplayLogic: AnyObject {
    func displayMeetings(viewModel: MeetingList.List.ViewModel)
    func displayGuestListScene()
    func displayAuthCode()
}

public final class MeetingListViewController: UIViewController, MeetingListDisplayLogic {
    var interactor: MeetingListBusinessLogic?
    public var router: (MeetingListRoutingLogic & MeetingListDataPassing)?
    
    // MARK: Object lifecycle
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MeetingListInteractor()
        let presenter = MeetingListPresenter()
        let router = MeetingListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: UI
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .init(width: UIScreen.main.bounds.width, height: 230)
        layout.headerReferenceSize = .init(width: UIScreen.main.bounds.width, height: 308)
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.backgroundColor = .clear
        v.register(MeetingCollectionViewCell.self)
        v.register(
            MeetingHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: String(describing: MeetingHeaderView.self)
        )
        v.delegate = self
        v.dataSource = self
        return v
    }()
    
    lazy var addButton: MTButton = {
        let button = MTButton.create(.mainDark)
        button.title = "ADD"
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        return button
    }()
    
    private var meetingViewModels: [MeetingCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: View lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchMeetings()
    }
    
    private func setUI() {
        view.backgroundColor = Pallete.Light.background.color
        
        view.addSubview(collectionView)
        view.addSubview(addButton)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        addButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: Display Logic
    
    func displayMeetings(viewModel: MeetingList.List.ViewModel) {
        meetingViewModels = viewModel.meetings
    }

    func displayAuthCode() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.router?.routeToAuthCodeScene()
        }
    }

    func displayGuestListScene() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
//            self?.router?.routeToGuestListScene()
        }
    }

    @objc func didTapAddButton() {
        router?.routeToAuthCodeScene()
    }
}

// MARK: UICollectionViewDataSource

extension MeetingListViewController: UICollectionViewDataSource {
    
    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return meetingViewModels.count
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(MeetingCollectionViewCell.self, for: indexPath)
        cell.viewModel = meetingViewModels[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: String(describing: MeetingHeaderView.self),
            for: indexPath
        )
        headerView.frame.size.height = 308
        return headerView
    }
}

// MARK: UICollectionViewDelegate

extension MeetingListViewController: UICollectionViewDelegate {
    
    
}

// MARK: MeetingCollectionViewCellDelegate

extension MeetingListViewController: MeetingCollectionViewCellDelegate {
    
    func didTapMeetingEnterButton(id: Int) {
        interactor?.selectItem(request: .init(meetingId: id))
        router?.routeToGuestListScene()
    }
}
