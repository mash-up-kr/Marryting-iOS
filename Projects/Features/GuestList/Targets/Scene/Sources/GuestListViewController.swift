//
//  GuestListViewController.swift
//  GuestList
//
//  Created by Gunoo on 2022/07/09.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SnapKit
import DesignSystem
import Kingfisher
import CardSideManager
import GuestListRoutingProtocol
import GuestListRouter

protocol GuestListDisplayLogic: AnyObject {
    func displayGuests(viewModel: GuestList.FetchGuests.ViewModel)
}

public class GuestListViewController: UIViewController, GuestListDisplayLogic {
    var interactor: GuestListBusinessLogic?
    public var router: (GuestListRoutingLogic & GuestListDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = GuestListInteractor()
        let presenter = GuestListPresenter()
        let router = GuestListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Store Properties
    
    private var guestCardIndex: Int = 0
    
    private var guestCardViewModels: [GuestCardViewModel] = []
    
    // MARK: UI
    
    lazy var navigationView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var logoImageView: UIImageView = {
        let v = UIImageView()
        v.image = .create(.logo)
        return v
    }()
    
    lazy var likeListButton: UIImageView = {
        let v = UIImageView()
        v.image = .create(.ic_heart)
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapLikeListButton)))
        return v
    }()
    
    lazy var myInfoButton: UIImageView = {
        let v = UIImageView()
        v.image = .create(.ic_edit)
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapMyInfoButton)))
        return v
    }()
    
    lazy var firstTitleLabel: UILabel = {
        let v = UILabel()
        v.font = .montserrat(weight: .medium, size: ._30)
        v.textColor = .black
        v.text = "Who is your"
        return v
    }()
    
    lazy var secondTitleLabel: UILabel = {
        let v = UILabel()
        v.font = .montserrat(weight: .bold, size: ._30)
        v.textColor = .black
        v.text = "MARRY-TING"
        return v
    }()
    
    lazy var guestSwipeableView: ZLSwipeableView = {
        let v = ZLSwipeableView()
        v.shouldSwipeView = { _, _, _ in true }
        return v
    }()

    lazy var reportButton: UIButton = {
        let v = UIButton(type: .system)
        v.isHidden = true
        v.tintColor = Pallete.Light.grey400.color
        v.setImage(.create(.ic_report), for: .normal)
        v.addTarget(self, action: #selector(reportButtonDidTap), for: .touchUpInside)
        return v
    }()
    
    var guestCardView: GuestCardView? {
        if self.guestCardViewModels.isEmpty { return nil }
        if self.guestCardIndex >= self.guestCardViewModels.count {
            self.guestCardIndex = 0
        }
        let v = GuestCardView(frame: self.guestSwipeableView.bounds)
        v.viewModel = self.guestCardViewModels[self.guestCardIndex]
        v.backgroundColor = self.getGuestCardViewColor(for: self.guestCardIndex)
        v.delegate = self
        self.guestCardIndex += 1
        v.addGestureRecognizer( UITapGestureRecognizer(target: self, action: #selector(guestCardViewDidTap)))
        return v
    }

    private func getGuestCardViewColor(for index: Int) -> UIColor? {
        switch index % 4 {
        case 0:
            return .white
        case 1:
            return Pallete.Light.main300.color
        case 2:
            return Pallete.Light.subPurple.color
        case 3:
            return Pallete.Light.subGreen.color
        default:
            return .white
        }
    }

    @objc
    private func didTapLikeListButton() {
        router?.routeToMyGuestListScene()
    }

    @objc
    private func guestCardViewDidTap() {
        guard self.guestCardIndex >= 0 else { return }
        router?.routeToGuestDetailScene(targetId: self.guestCardIndex)
    }

    @objc
    func didTapMyInfoButton() {
        router?.routeToMyProfile()
    }

    // MARK: View lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.fetchGuests()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.guestSwipeableView.nextView = {
            return self.guestCardView
        }
    }
    
    private func setUI() {
        self.view.backgroundColor = Pallete.Light.background.color
        
        self.view.addSubview(self.navigationView)
        self.view.addSubview(self.firstTitleLabel)
        self.view.addSubview(self.secondTitleLabel)
        self.view.addSubview(self.guestSwipeableView)
        self.view.addSubview(self.reportButton)
        self.navigationView.addSubview(self.logoImageView)
        self.navigationView.addSubview(self.likeListButton)
        self.navigationView.addSubview(self.myInfoButton)
        
        self.navigationView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        self.firstTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.navigationView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        self.secondTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.firstTitleLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        self.guestSwipeableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalTo(self.secondTitleLabel.snp.bottom).offset(32)
            make.bottom.equalToSuperview().inset(84)
        }
        self.logoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalTo(81)
        }
        self.likeListButton.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.trailing.equalTo(self.myInfoButton.snp.leading)
            make.centerY.equalToSuperview()
        }
        self.myInfoButton.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        self.reportButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
    
    // MARK: Display Logic
    
    func displayGuests(viewModel: GuestList.FetchGuests.ViewModel) {
        self.guestCardViewModels = viewModel.guestCardViewModels
        
        DispatchQueue.main.async {
            self.guestSwipeableView.removeFromSuperview()
            self.view.addSubview(self.guestSwipeableView)
            self.guestSwipeableView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(32)
                make.top.equalTo(self.secondTitleLabel.snp.bottom).offset(32)
                make.bottom.equalToSuperview().inset(84)
            }
            self.reportButton.isHidden = false
        }
    }

    @objc
    private func reportButtonDidTap() {
        let alertViewController = UIAlertController(
            title: "신고하기",
            message: "다음 하객의 사진이나 설명이 불쾌해요.",
            preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alertViewController.addAction(UIAlertAction(title: "신고할래요", style: .default, handler: { [weak self] _ in
            let reportAlertViewController = UIAlertController(title: "신고됐어요.", message: nil, preferredStyle: .alert)
            reportAlertViewController.addAction(UIAlertAction(title: "확인", style: .default))
            self?.present(reportAlertViewController, animated: true)
        }))

        self.present(alertViewController, animated: true)
    }
}

extension GuestListViewController: GuestCardViewDelegate {
    func didTapLikeButton(id: Int) {
        router?.routeToLikeRequestScene(targetId: id)
    }
}
