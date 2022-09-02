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

    lazy var starImageView1: UIImageView = {
        let v = UIImageView()
        v.image = .create(.ic_star)
        return v
    }()

    lazy var starImageView2: UIImageView = {
        let v = UIImageView()
        v.image = .create(.ic_star)
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
    
    var guestSwipeableView: ZLSwipeableView = ZLSwipeableView()

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
        
        let topId = self.guestSwipeableView.topView()?.tag ?? 0
        
        GuestListModule.shared.guestListIndex = topId
        
        if self.guestCardIndex >= self.guestCardViewModels.count {
            self.guestCardIndex = 0
        }
        let v = GuestCardView(frame: self.guestSwipeableView.bounds)
        v.tag = guestCardViewModels[self.guestCardIndex].id
        v.viewModel = self.guestCardViewModels[self.guestCardIndex]
        v.backgroundColor = self.getGuestCardViewColor(for: self.guestCardIndex)
        v.delegate = self
        self.guestCardIndex += 1
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(guestCardViewDidTap(_:))))
        return v
    }

    private lazy var emptyView: EmptyView = {
        let v = EmptyView()
        v.isHidden = true
        return v
    }()

    lazy var tutorialView: UIImageView = {
        let v = UIImageView(asset: .tutorial_11promax)
        if DeviceManager.getDeviceKind() == ._9_16 {
            v.image = .create(.tutorial_8plus)
        }
        v.contentMode = .scaleAspectFill
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tutorialViewDidTap)))
        return v
    }()

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
    private func guestCardViewDidTap(_ sender: UITapGestureRecognizer) {
        let targetID = sender.view?.tag ?? 0
        router?.routeToGuestDetailScene(targetId: targetID)
    }

    @objc
    func didTapMyInfoButton() {
        router?.routeToMyProfile()
    }

    @objc
    func tutorialViewDidTap() {
        UIView.animate(
            withDuration: 0.22,
            delay: 0,
            options: .allowAnimatedContent,
            animations: { [weak self] in
                self?.tutorialView.alpha = 0
            }, completion: { [weak self] _ in
                self?.tutorialView.isHidden = true
            })
    }

    // MARK: View lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setNotificationCenter()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.guestCardIndex = 0
        self.interactor?.fetchGuests()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.guestSwipeableView.nextView = { [weak self] in
            return self?.guestCardView
        }
    }

    private func judgeTutorial() {
        if UserDefaults.standard.bool(forKey: "tutorial") == false {
            UserDefaults.standard.set(true, forKey: "tutorial")
            self.view.addSubview(self.tutorialView)
            self.tutorialView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            self.tutorialView.alpha = 1
            self.tutorialView.isHidden = false
        }
    }

    private func setUI() {
        self.view.backgroundColor = Pallete.Light.background.color
        
        self.view.addSubview(self.navigationView)
        self.view.addSubview(self.starImageView1)
        self.view.addSubview(self.starImageView2)
        self.view.addSubview(self.firstTitleLabel)
        self.view.addSubview(self.secondTitleLabel)
        self.view.addSubview(self.reportButton)
        self.view.addSubview(self.emptyView)

        self.navigationView.addSubview(self.likeListButton)
        self.navigationView.addSubview(self.myInfoButton)
        
        self.navigationView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        self.starImageView1.snp.makeConstraints { make in
            make.trailing.equalTo(self.secondTitleLabel.snp.leading)
            make.bottom.equalTo(self.firstTitleLabel.snp.firstBaseline)
            make.width.height.equalTo(40)
        }
        self.starImageView2.snp.makeConstraints { make in
            make.leading.equalTo(self.firstTitleLabel.snp.trailing).offset(18)
            make.centerY.equalTo(self.secondTitleLabel.snp.bottom).offset(-10)
            make.width.height.equalTo(40)
        }
        self.firstTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.navigationView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        self.secondTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.firstTitleLabel.snp.bottom)
            make.centerX.equalToSuperview()
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
        self.emptyView.snp.makeConstraints { make in
            make.top.equalTo(self.navigationView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(routeToMyGuestListSceneFromLikeRequestCompleteScene), name: .init("routeToMyGuestListSceneFromLikeRequestCompleteScene"), object: nil)
    }

    @objc
    private func routeToMyGuestListSceneFromLikeRequestCompleteScene(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Int],
              let routeTo = userInfo["routeTo"] else { return }

        switch routeTo {
        case 0: // 0 : 하객 리스트
            self.router?.routeToSelf()
        case 1: // 1 : 내가 좋아요한 하객 리스트
            self.router?.routeToSelf()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.router?.routeToMyGuestListScene()
            }
        default:
            break
        }
    }
    // MARK: Display Logic
    
    func displayGuests(viewModel: GuestList.FetchGuests.ViewModel) {
        self.guestCardViewModels = viewModel.guestCardViewModels
        
        DispatchQueue.main.async {
            self.guestSwipeableView.removeFromSuperview()
            self.guestSwipeableView = ZLSwipeableView()
            self.guestSwipeableView.allowedDirection = .All
            if self.guestCardViewModels.count == 1 {
                self.guestSwipeableView.numberOfActiveView = 1
                self.guestSwipeableView.allowedDirection = .None
            }
            else {
                if self.guestCardViewModels.count < 4 {
                    self.guestSwipeableView.numberOfActiveView = UInt(self.guestCardViewModels.count)
                }
                else {
                    self.guestSwipeableView.numberOfActiveView = 4
                }
            }
            self.guestSwipeableView.onlySwipeTopCard = true
            self.view.addSubview(self.guestSwipeableView)
            self.guestSwipeableView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(32)
                make.top.equalTo(self.secondTitleLabel.snp.bottom).offset(32)
                make.bottom.equalToSuperview().inset(84)
            }
            self.firstTitleLabel.isHidden = viewModel.guestCardViewModels.isEmpty
            self.secondTitleLabel.isHidden = viewModel.guestCardViewModels.isEmpty
            self.emptyView.isHidden = !viewModel.guestCardViewModels.isEmpty
            self.reportButton.isHidden = viewModel.guestCardViewModels.isEmpty
            self.judgeTutorial()
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
