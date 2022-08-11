//
//  ProfileRegisterCompleteViewController.swift
//  
//
//  Created by Woody on 2022/08/09.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import DesignSystem
import SnapKit
import ProfileRegisterCompleteRoutingProtocol
import ProfileRegisterCompleteRouter
import Lottie

protocol ProfileRegisterCompleteDisplayLogic: AnyObject {
    func displayMyName(viewModel: ProfileRegisterComplete.FetchMyName.ViewModel)
}

public final class ProfileRegisterCompleteViewController: UIViewController, ProfileRegisterCompleteDisplayLogic {
    var interactor: ProfileRegisterCompleteBusinessLogic?
    public var router: (ProfileRegisterCompleteRoutingLogic & ProfileRegisterCompleteDataPassing)?
    
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
        let interactor = ProfileRegisterCompleteInteractor()
        let presenter = ProfileRegisterCompletePresenter()
        let router = ProfileRegisterCompleteRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: UI

    lazy var animationView: AnimationView = {
        let v = AnimationView(name: "complete", bundle: .module)
        v.play()
        return v
    }()

    lazy var completeMessageLabel: UILabel = {
        let v = UILabel()
        var attributedText: NSMutableAttributedString = .init(string: "")
        attributedText.append(NSAttributedString(string: "Nice!\n", attributes: [
            .font: UIFont.h2(name: .montserrat), .foregroundColor: Pallete.Light.main300.color ?? UIColor.gray
        ]))
        attributedText.append(NSAttributedString(string: "Completed", attributes: [
            .font: UIFont.h2(name: .montserrat), .foregroundColor: Pallete.Light.grey800.color ?? UIColor.gray
        ]))
        v.attributedText = attributedText
        v.numberOfLines = 2
        return v
    }()

    lazy var completeSubMessageLabel: UILabel = {
        let v = UILabel()
        v.font = .h4()
        v.textColor = Pallete.Light.grey500.color
        v.numberOfLines = 2
        return v
    }()

    lazy var completeSubMessage2StackView: UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.spacing = 2
        v.alignment = .center
        v.distribution = .fill
        return v
    }()

    lazy var completeSubMessage2Label: UILabel = {
        let v = UILabel()
        v.font = .h4()
        v.textColor = Pallete.Light.grey300.color
        v.numberOfLines = 1
        v.text = "행복을 빌어요"
        return v
    }()

    lazy var cloverImageView: UIImageView = {
        let v = UIImageView(asset: .ic_clover)
        return v
    }()
    
    lazy var gotoMeetingListSceneButton: TextImageMTButton = {
        let v = TextImageMTButton()
        v.customButtonType = .mainLight
        v.title = "LET’S GO"
        v.addTarget(self, action: #selector(didTapGotoMeetingListSceneButton), for: .touchUpInside)
        return v
    }()

    // MARK: View lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        interactor?.fetchMyName()
    }
    
    private func setUI() {

        view.backgroundColor = .white

        view.addSubview(animationView)
        view.addSubview(completeMessageLabel)
        view.addSubview(completeSubMessageLabel)
        view.addSubview(completeSubMessage2StackView)
        view.addSubview(gotoMeetingListSceneButton)
        completeSubMessage2StackView.addArrangedSubviews(completeSubMessage2Label, cloverImageView)
        animationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(animationView.snp.width)
        }
        completeMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        completeSubMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(completeMessageLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        completeSubMessage2StackView.snp.makeConstraints { make in
            make.top.equalTo(completeSubMessageLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(32)
        }
        cloverImageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        gotoMeetingListSceneButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
        }
    }

    // MARK: Display Logic

    func displayMyName(viewModel: ProfileRegisterComplete.FetchMyName.ViewModel) {
        completeSubMessageLabel.text = "\(viewModel.name)을 이렇게 소개할게요.\n메리팅을 찾으러 가볼까요?"
    }

    @objc
    private func didTapGotoMeetingListSceneButton() {
        router?.routeToMeetingListScene()
    }
}
