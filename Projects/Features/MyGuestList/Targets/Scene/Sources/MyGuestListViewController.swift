//
//  MyGuestListViewController.swift
//  
//
//  Created by Woody on 2022/07/17.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import DesignSystem
import MyGuestListRouter
import MyGuestListRoutingProtocol
import UIKit

import SnapKit

protocol MyGuestListDisplayLogic: AnyObject {
    func displayMyLikeGuests(viewModel: MyGuestList.FetchMyLikeGuests.ViewModel)
    func displayMatchingGuests(viewModel: MyGuestList.FetchMatchingGuests.ViewModel)
}

public final class MyGuestListViewController: UIViewController, MyGuestListDisplayLogic {
    var interactor: MyGuestListBusinessLogic?
    public var router: (MyGuestListRoutingLogic & MyGuestListDataPassing)?
    
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
        let interactor = MyGuestListInteractor()
        let presenter = MyGuestListPresenter()
        let router = MyGuestListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: UI

    private let navigationView: UIView = {
        let v = UIView()
        return v
    }()

    private lazy var backButton: UIImageView = {
        let v = UIImageView()
        v.image = .create(.ic_arrow_back)
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBackButton)))
        return v
    }()

    private lazy var myGuestMenuView: MyGuestMenuView = {
        $0.delegate = self
        return $0
    }(MyGuestMenuView())

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .init(width: UIScreen.main.bounds.width, height: 400)
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.register(MyLikeGuestCollectionViewCell.self)
        v.register(MatchingGuestCollectionViewCell.self)
        v.delegate = self
        v.dataSource = self
        return v
    }()

    // MARK: Store Properties

    enum DisplayType {
        case myLike
        case matching
    }

    private lazy var displayType: DisplayType = .myLike {
        didSet {
            switch displayType {
            case .myLike:
                interactor?.fetchMyLikeGuests()
            case .matching:
                interactor?.fetchMatchingGuests()
            }
        }
    }

    private lazy var myLikeGuestViewModels: [MyLikeGuestCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.setContentOffset(.zero, animated: false)
                self.collectionView.reloadData()
            }
        }
    }

    private lazy var matchingViewModels: [MatchingGuestCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.setContentOffset(.zero, animated: false)
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
        self.interactor?.fetchMyLikeGuests()
    }
    
    private func setUI() {
        self.view.backgroundColor = Pallete.Light.background.color
        self.collectionView.backgroundColor = Pallete.Light.background.color
        self.view.addSubviews(self.navigationView, self.myGuestMenuView, self.collectionView)
        self.navigationView.addSubview(self.backButton)

        self.navigationView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        self.backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        self.myGuestMenuView.snp.makeConstraints { make in
            make.top.equalTo(self.navigationView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.myGuestMenuView.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }
    
    // MARK: Display Logic

    func displayMyLikeGuests(viewModel: MyGuestList.FetchMyLikeGuests.ViewModel) {
        self.myLikeGuestViewModels = viewModel.myLikeGuestCellViewModels
    }

    func displayMatchingGuests(viewModel: MyGuestList.FetchMatchingGuests.ViewModel) {
        self.matchingViewModels = viewModel.matchingGuestCellViewModels
    }

    @objc func didTapBackButton() {
        router?.removeFromParent()
    }
}

extension MyGuestListViewController: MyGuestMenuViewDelegate {

    func myLikeButtonDidTap() {
        displayType = .myLike
    }

    func matchingButtonDidTap() {
        displayType = .matching
    }
}

// MARK: UICollectionViewDataSource

extension MyGuestListViewController: UICollectionViewDataSource {
    
    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        switch displayType {
        case .myLike:
            return myLikeGuestViewModels.count
        case .matching:
            return matchingViewModels.count
        }
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch displayType {
        case .myLike:
            return myLikeGuestCollectionViewCell(for: indexPath)
        case .matching:
            return matchingGuestCollectionViewCell(for: indexPath)
        }
    }

    private func myLikeGuestCollectionViewCell(
        for indexPath: IndexPath
    ) -> MyLikeGuestCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(MyLikeGuestCollectionViewCell.self, for: indexPath)
        cell.viewModel = myLikeGuestViewModels[indexPath.item]
        return cell
    }

    private func matchingGuestCollectionViewCell(
        for indexPath: IndexPath
    ) -> MatchingGuestCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(MatchingGuestCollectionViewCell.self, for: indexPath)
        cell.viewModel = matchingViewModels[indexPath.item]
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension MyGuestListViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        switch displayType {
        case .myLike:
            return 30
        case .matching:
            return 60
        }

    }

    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch displayType {
        case .myLike:
            return myLikeCellSize()
        case .matching:
            return matchingCellSize(for: indexPath)
        }
    }

    private func myLikeCellSize() -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = width * 4 / 3
        return .init(width: width, height: height)
    }

    private func matchingCellSize(for indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width
        var height: CGFloat = 0
        switch displayType {
        case .myLike:
            height = width * 4 / 3
        case .matching:
            height = width * 4 / 3 + dialogViewHeight(for: indexPath)
        }
        return .init(width: width, height: height)
    }

    // TODO: 코드 개선 필요
    private func dialogViewHeight(for indexPath: IndexPath) -> CGFloat {
        let loveMentLabel: UILabel = {
            // TODO: 영어 멘트일경우 체크
            $0.font = .h4()
            $0.textColor = Pallete.Light.grey700.color
            $0.numberOfLines = 0
            $0.text = matchingViewModels[indexPath.item].dialog.loveMent
            return $0
        }(UILabel())

        loveMentLabel.sizeToFit()

        return loveMentLabel.bounds.height + 32
    }
}
