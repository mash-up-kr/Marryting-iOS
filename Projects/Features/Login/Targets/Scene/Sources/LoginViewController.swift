//
//  LoginViewController.swift
//  Login
//
//  Created by Woody on 2022/07/17.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import AuthenticationServices
import DesignSystem
import LoginRouter
import LoginRoutingProtocol
import UIKit

import SnapKit

protocol LoginDisplayLogic: AnyObject {
    func displayLoginSucees()
    func displayLoginFail()
}

public class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: UI

    lazy var wholeStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.distribution = .fill
        v.alignment = .center
        v.spacing = 12
        return v
    }()

    lazy var heartImageView: UIImageView = {
        let v = UIImageView(asset: .img_login)
        return v
    }()

    lazy var bottomStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.distribution = .fill
        v.alignment = .center
        v.spacing = 40
        return v
    }()

    lazy var vStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.distribution = .fill
        v.alignment = .center
        v.spacing = 0
        return v
    }()

    lazy var findyourLabel: UILabel = {
        let v = UILabel()
        v.text = "Find your"
        v.font = .montserrat(weight: .medium, size: ._30)
        v.textColor = Pallete.Light.black.color
        return v
    }()

    lazy var marrytingLabel: UILabel = {
        let v = UILabel()
        v.text = "MARRY-TING"
        v.font = .montserrat(weight: .bold, size: ._30)
        v.textColor = Pallete.Light.black.color
        return v
    }()

    lazy var appleLoginButton: UIButton = {
        $0.setBackgroundImage(.create(.btn_apple_button), for: .normal)
        $0.addTarget(self, action: #selector(appleLoginButtonPressed), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))

    @objc private func appleLoginButtonPressed() {
        interactor?.appleLogin()
    }

    // MARK: Routing

    func displayLoginSucees() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in

            // TODO: 라우팅 변경
//            self?.router?.routeToGuestListViewController()
            self?.router?.routeToMeetingListViewController()
        }

    }

    func displayLoginFail() {
        // TODO: Login 실패
    }

    // MARK: View lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }

    private func setUI() {
        self.view.backgroundColor = Pallete.Light.background.color
        self.view.addSubview(self.wholeStackView)
        self.wholeStackView.addArrangedSubviews(self.heartImageView, self.bottomStackView)
        self.bottomStackView.addArrangedSubviews(self.vStackView, self.appleLoginButton)
        self.vStackView.addArrangedSubviews(self.findyourLabel, self.marrytingLabel)

        self.wholeStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        let constraint1 = heartImageView.heightAnchor.constraint(equalTo: heartImageView.widthAnchor, multiplier: 298/360)
        constraint1.priority = UILayoutPriority(1000)
        constraint1.isActive = true

        let constraint2 = appleLoginButton.heightAnchor.constraint(equalTo: appleLoginButton.widthAnchor, multiplier: 56/327)
        constraint2.priority = UILayoutPriority(1000)
        constraint2.isActive = true
    }
}
