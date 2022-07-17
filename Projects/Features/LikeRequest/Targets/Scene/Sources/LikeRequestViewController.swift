//
//  LikeRequestViewController.swift
//  LikeRequest
//
//  Created by Gunoo on 2022/07/16.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import DesignSystem
import SnapKit
import LikeRequestRoutingProtocol
import LikeRequestRouter

protocol LikeRequestDisplayLogic: AnyObject {
    func displayIntroduceContents(viewModel: LikeRequest.FetchIntroduceContents.ViewModel)
}

public class LikeRequestViewController: UIViewController, LikeRequestDisplayLogic {
    var interactor: LikeRequestBusinessLogic?
    public var router: (LikeRequestRoutingLogic & LikeRequestDataPassing)?
    
    // MARK: Object lifecycle
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = LikeRequestInteractor()
        let presenter = LikeRequestPresenter()
        let router = LikeRequestRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: UI
    
    lazy var navigationView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var backButton: UIImageView = {
        let v = UIImageView()
        v.image = .create(.ic_arrow_back)
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBackButton)))
        return v
    }()
    
    lazy var marryLabel: UILabel = {
        let v = UILabel()
        v.font = .montserrat(weight: .bold, size: ._34)
        v.textColor = Pallete.Light.grey700.color
        v.text = "MARRY-"
        return v
    }()
    
    lazy var ringLabel: UILabel = {
        let v = UILabel()
        v.font = .montserrat(weight: .bold, size: ._34)
        v.textColor = Pallete.Light.main300.color
        v.text = "RING"
        return v
    }()
    
    lazy var ringImageView: UIImageView = {
        let v = UIImageView()
        v.image = .create(.ic_ring)
        return v
    }()
    
    lazy var introduceLabel: UILabel = {
        let v = UILabel()
        v.font = .h4()
        v.textColor = Pallete.Light.grey600.color
        v.numberOfLines = 2
        return v
    }()
    
    lazy var bubbleImageView: UIImageView = {
        let v = UIImageView()
        v.image = .create(.img_bubble)
        return v
    }()
    
    lazy var bubbleBackImageView: UIImageView = {
        let v = UIImageView()
        v.image = .create(.img_bubble_back)
        return v
    }()
    
    lazy var bubbleContentsLabel: UILabel = {
        let v = UILabel()
        var attributedText: NSMutableAttributedString = .init(string: "")
        attributedText.append(NSAttributedString(string: "당신의 ", attributes: [
            .font: UIFont.h5(), .foregroundColor: Pallete.Light.grey500.color ?? UIColor.gray
        ]))
        attributedText.append(NSAttributedString(string: "진심", attributes: [
            .font: UIFont.h5(), .foregroundColor: Pallete.Light.main300.color ?? UIColor.gray
        ]))
        attributedText.append(NSAttributedString(string: "을 담아보세요!", attributes: [
            .font: UIFont.h5(), .foregroundColor: Pallete.Light.grey500.color ?? UIColor.gray
        ]))
        v.attributedText = attributedText
        return v
    }()
    
    lazy var messageTextView: UITextView = {
        let v = UITextView()
        v.layer.borderWidth = 1
        v.layer.borderColor = Pallete.Light.grey100.color?.cgColor
        v.layer.cornerRadius = 8
        v.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        v.delegate = self
        v.text = messageTextViewPlaceHolder
        v.textColor = .lightGray
        v.font = .h3()
        return v
    }()
    
    lazy var pageCounterLabel: UILabel = {
        let v = UILabel()
        v.font = .montserrat(weight: .regular, size: ._14)
        v.textColor = Pallete.Light.grey300.color
        v.text = "0/20"
        return v
    }()
    
    lazy var enlargeIconImageView: UIImageView = {
        let v = UIImageView()
        v.image = .create(.ic_enlarge)
        return v
    }()
    
    lazy var doneButton: TextImageMTButton = {
        let v = TextImageMTButton(customButtonType: .mainLight)
        v.title = "DONE"
        v.isEnabled = false
        return v
    }()
    
    // MARK: View lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setNofification()
        self.interactor?.fetchIntroduceContents()
    }
    
    private func setUI() {
        self.view.backgroundColor = Pallete.Light.background.color
        self.view.addSubview(self.navigationView)
        self.view.addSubview(self.marryLabel)
        self.view.addSubview(self.ringLabel)
        self.view.addSubview(self.ringImageView)
        self.view.addSubview(self.introduceLabel)
        self.view.addSubview(self.bubbleBackImageView)
        self.view.addSubview(self.bubbleImageView)
        self.view.addSubview(self.messageTextView)
        self.view.addSubview(self.pageCounterLabel)
        self.view.addSubview(self.enlargeIconImageView)
        self.view.addSubview(self.doneButton)
        self.navigationView.addSubview(self.backButton)
        self.bubbleImageView.addSubview(self.bubbleContentsLabel)
        
        self.navigationView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        self.backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        self.marryLabel.snp.makeConstraints { make in
            make.top.equalTo(self.navigationView.snp.bottom).offset(42)
            make.leading.equalToSuperview().inset(32)
        }
        self.ringLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.marryLabel)
            make.leading.equalTo(self.marryLabel.snp.trailing)
        }
        self.ringImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.ringLabel)
            make.leading.equalTo(self.ringLabel.snp.trailing).offset(2)
            make.height.width.equalTo(40)
        }
        self.introduceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.marryLabel.snp.bottom).offset(13)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        self.bubbleBackImageView.snp.makeConstraints { make in
            make.bottom.equalTo(self.messageTextView.snp.top).offset(-15)
            make.trailing.equalToSuperview().inset(32)
            make.height.equalTo(60)
            make.width.equalTo(209)
        }
        self.bubbleImageView.snp.makeConstraints { make in
            make.top.equalTo(self.bubbleBackImageView).offset(-5)
            make.leading.equalTo(self.bubbleBackImageView).offset(-4)
            make.height.equalTo(63)
            make.width.equalTo(209)
        }
        self.bubbleContentsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(20)
        }
        self.messageTextView.snp.makeConstraints { make in
            make.height.equalTo(173)
            make.leading.trailing.equalToSuperview().inset(32)
            make.bottom.equalTo(self.doneButton.snp.top).offset(-40)
        }
        self.pageCounterLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.messageTextView).offset(-20)
            make.trailing.equalTo(self.messageTextView).offset(-20)
        }
        self.enlargeIconImageView.snp.makeConstraints { make in
            make.height.width.equalTo(8)
            make.trailing.bottom.equalTo(self.messageTextView).offset(-4)
        }
        self.doneButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setNofification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    // MARK: Display Logic
    
    func displayIntroduceContents(viewModel: LikeRequest.FetchIntroduceContents.ViewModel) {
        DispatchQueue.main.async {
            self.introduceLabel.text = viewModel.introduceContents
        }
    }
    
    @objc func didTapBackButton() {
        self.messageTextView.resignFirstResponder()
        router?.removeFromParent()
    }
    
    /// 배경 터치시 messageTextView 포커싱 해제
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.messageTextView.resignFirstResponder()
    }
    
    /// 키보드 Show 시에 위치 조정
    @objc func keyboardWillShow(notification: NSNotification) {
        self.messageTextView.layer.borderColor = Pallete.Light.grey400.color?.cgColor
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                self.marryLabel.snp.updateConstraints { make in
                    make.top.equalTo(self.navigationView.snp.bottom).offset(42 - keyboardHeight)
                }
                self.doneButton.snp.updateConstraints { make in
                    make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(10 + keyboardHeight)
                }
                self.view.layoutIfNeeded()
            })
        }
    }
    
    /// 키보드 Hide 시에 위치 조정
    @objc func keyboardWillHide(notification: NSNotification) {
        self.messageTextView.layer.borderColor = Pallete.Light.grey100.color?.cgColor
        UIView.animate(withDuration: 1) {
            self.marryLabel.snp.updateConstraints { make in
                make.top.equalTo(self.navigationView.snp.bottom).offset(42)
            }
            self.doneButton.snp.updateConstraints { make in
                make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            }
            self.view.layoutIfNeeded()
        }
    }
}

extension LikeRequestViewController: UITextViewDelegate {
    private var messageTextViewPlaceHolder: String {
        return "ex) 그대가 찾는 사람,\n바로 저입니다."
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == messageTextViewPlaceHolder {
            textView.text = nil
            textView.textColor = Pallete.Light.grey800.color
        }
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = messageTextViewPlaceHolder
            textView.textColor = .lightGray
        }
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text,
              let newRange = Range(range, in: oldString) else {
            self.doneButton.isEnabled = true
            return true
        }
        let newString = oldString
            .replacingCharacters(in: newRange, with: inputString)
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let characterCount = newString.count
        guard characterCount <= 20 else {
            return false
        }
        if characterCount == 0 {
            self.doneButton.isEnabled = false
        } else {
            self.doneButton.isEnabled = true
        }
        self.pageCounterLabel.text = "\(characterCount)/20"
        return true
    }
}