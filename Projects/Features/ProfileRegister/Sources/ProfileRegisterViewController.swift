//
//  ProfileRegisterViewController.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/09.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SnapKit
import DesignSystem
import Photos
import CropViewController

protocol ProfileRegisterDisplayLogic: AnyObject {
    func displayLocalUserInfoPage(viewModel: ProfileRegister.FetchFirstPage.ViewModel)
    func displayImagePage(viewModel: ProfileRegister.FetchImagePage.ViewModel)
    func displayImage(viewModel: ProfileRegister.UploadImage.ViewModel)
    func displayDeleteImage(viewModel: ProfileRegister.DeleteImage.ViewModel)
    func displayKeywordPage(viewModel: ProfileRegister.FetchKeywordPage.ViewModel)
    func displayQuestionPage(viewModel: ProfileRegister.FetchQuestionPage.ViewModel)
    func displayRegisterProfileComplete()
}

public final class ProfileRegisterViewController: UIViewController, ProfileRegisterDisplayLogic, UINavigationControllerDelegate {
    var interactor: ProfileRegisterBusinessLogic?
    public var router: (NSObjectProtocol & ProfileRegisterRoutingLogic & ProfileRegisterDataPassing)?
    
    private let imagePicker = UIImagePickerController()
    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = ProfileRegisterInteractor()
        let presenter = ProfileRegisterPresenter()
        let router = ProfileRegisterRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Properties

    private let sideSpace = 32

    private let picker = UIImagePickerController()


    private let titleStringList: [String] = ["당신의 기본정보를\n알려주세요", "당신의 매력적인 모습을\n보여주세요", "당신을 키워드로\n표현해보세요", "내가 쓰는\n나의 성향 소개서"]
    private let titlehighlightStringList: [String] = ["기본정보", "매력적인", "키워드", "성향"]
    private let subTitleStringList: [String] = ["곧 만날 상대에게 이렇게 소개할게요", "2장 이상의 다양한 모습을 보고싶어요", "5개의 키워드로 당신을 알려주세요", "꼭 기억해서 맞춤 추천해드릴게요"]

    lazy var contentViewArr: [UIView] = [enterUserInfoView, registerProfileImageView, selectTagListView, selectValuesView]

    // MARK: UI Properties

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .h3()
        return label
    }()

    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .body1()
        label.textColor = .systemGray3
        return label
    }()

    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 50, height: 8))
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        // iOS 14.0부터 양옆에 생긴 padding 값 제거
        if #available(iOS 14.0, *) {
            pageControl.backgroundStyle = .minimal
            pageControl.allowsContinuousInteraction = false
        }
        return pageControl
    }()

    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var buttonView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var leftButton: MTButton = {
        let button = MTButton.create(.mainSmallDark)
        button.title = "PRE"
        button.isHidden = true
        button.isEnabled = true
        button.addTarget(self, action: #selector(pressPrevButton(_:)), for: .touchUpInside)
        return button
    }()

    lazy var rightButton: MTButton = {
        let button = MTButton.create(.mainDark)
        button.title = "NEXT"
        button.isEnabled = false
        button.addTarget(self, action: #selector(pressNextButton(_:)), for: .touchUpInside)
        return button
    }()

    lazy var selectTagListView: SelectTagListView = {
        let view = SelectTagListView()
        view.delegate = self
        return view
    }()

    lazy var enterUserInfoView: EnterUserInfoView = {
        let view = EnterUserInfoView()
        view.delegate = self
        view.nameTextField.delegate = self
        view.genderTextField.delegate = self
        view.birthTextField.delegate = self
        view.addressTextField.delegate = self
        view.jobTextField.delegate = self
        return view
    }()

    lazy var selectValuesView: SelectValuesView = {
        let view = SelectValuesView()
        view.delegate = self
        return view
    }()

    lazy var registerProfileImageView: RegisterProfileImageView = {
        let view = RegisterProfileImageView()
        view.delegate = self
        return view
    }()

    // MARK: View lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        imagePicker.delegate = self
    }

    // MARK: Configure UI

    private func configureUI() {
        configureUIObjectsLayout()
    }

    private func configureUIObjectsLayout() {
        self.view.backgroundColor = Pallete.Dark.background.color

        view.addSubview(pageControl)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(contentView)
        view.addSubview(buttonView)
        buttonView.addSubview(leftButton)
        buttonView.addSubview(rightButton)

        self.pageControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(sideSpace)
            make.top.equalToSuperview().offset(84)
        }

        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(sideSpace)
            make.trailing.equalToSuperview().offset(-sideSpace)
            make.top.equalTo(pageControl.snp.bottom).offset(20)
        }

        self.subTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(sideSpace)
            make.trailing.equalToSuperview().offset(-sideSpace)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }

        self.contentView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(subTitleLabel.snp.bottom).offset(42)
            make.bottom.equalToSuperview()
        }

        self.buttonView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(sideSpace)
            make.trailing.equalToSuperview().offset(-sideSpace)
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(56)
        }

        self.leftButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        self.rightButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        self.updatePage(1)
    }

    private func updatePage(_ pageNumber: Int) {
        self.updateTopView(pageNumber)
        self.updateContentView(pageNumber)
    }

    private func updateContentView(_ pageNumber: Int) {
        DispatchQueue.main.async {
            UIView.transition(with: self.contentView, duration: 0.33, options: .transitionCrossDissolve, animations: {
                self.contentView.subviews.forEach { $0.removeFromSuperview() }
                self.contentView.addSubview(self.contentViewArr[pageNumber-1])
                self.contentViewArr[pageNumber-1].snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }, completion: nil)
        }
    }

    private func updateTopView(_ pageNumber: Int) {
        DispatchQueue.main.async {
            let titleText = self.titleStringList[pageNumber - 1]
            let titlehighlightText = self.titlehighlightStringList[pageNumber - 1]
            let attributedStr = NSMutableAttributedString(string: titleText)
            attributedStr.addAttribute(.foregroundColor,
                                       value: UIColor.white,
                                       range: (titleText as NSString).range(of: titleText))
            attributedStr.addAttribute(.foregroundColor,
                                       value: Pallete.Dark.subGreen.color ?? UIColor.white,
                                       range: (titleText as NSString).range(of: titlehighlightText))

            self.titleLabel.attributedText = attributedStr
            self.subTitleLabel.text = self.subTitleStringList[pageNumber - 1]
            self.pageControl.currentPage = pageNumber - 1
        }
    }

    // MARK: Action

    @objc func pressPrevButton(_ sender: UIButton) {
        interactor?.fetchPrevPage()

    }

    @objc func pressNextButton(_ sender: UIButton) {
        interactor?.fetchNextPage()
    }

    func displayLocalUserInfoPage(viewModel: ProfileRegister.FetchFirstPage.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.updatePage(viewModel.pageNumber)
            self?.leftButton.isHidden = true
            self?.rightButton.isEnabled = (!viewModel.enterUserInfoViewModel.name.isEmpty &&
                                           !viewModel.enterUserInfoViewModel.address.isEmpty &&
                                           !viewModel.enterUserInfoViewModel.birth.isEmpty &&
                                           !viewModel.enterUserInfoViewModel.gender.isEmpty &&
                                           !viewModel.enterUserInfoViewModel.career.isEmpty)
            self?.enterUserInfoView.viewModel = viewModel.enterUserInfoViewModel
        }
    }

    func displayImagePage(viewModel: ProfileRegister.FetchImagePage.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.updatePage(viewModel.pageNumber)
            self?.rightButton.isEnabled = !viewModel.images.isEmpty
            self?.leftButton.isHidden = false
        }
    }

    func displayImage(viewModel: ProfileRegister.UploadImage.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.registerProfileImageView.images.append(viewModel.image)
            self?.rightButton.isEnabled = (self?.registerProfileImageView.images.count ?? 0) > 1
        }
    }

    func displayDeleteImage(viewModel: ProfileRegister.DeleteImage.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.registerProfileImageView.images = viewModel.images
            self?.rightButton.isEnabled = (self?.registerProfileImageView.images.count ?? 0) > 1
        }
    }

    func displayKeywordPage(viewModel: ProfileRegister.FetchKeywordPage.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.updatePage(viewModel.pageNumber)
            self?.selectTagListView.viewModel = .init(
                selectedKeywordList: viewModel.selectedKeywords.map { .init(keywordID: $0.id, keyword: $0.keyword)},
                keywordList: viewModel.keywords.map { .init(keywordID: $0.id, keyword: $0.keyword) }
            )
            self?.rightButton.isEnabled = (viewModel.selectedKeywords.count == 5)
            self?.rightButton.title = "NEXT"
        }
    }

    func displayQuestionPage(viewModel: ProfileRegister.FetchQuestionPage.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.updatePage(viewModel.pageNumber)
            self?.selectValuesView.selectedAnswers = viewModel.selectedAnswers
            self?.selectValuesView.question = viewModel.questionViewModels
            self?.rightButton.isEnabled = viewModel.selectedAnswers.count == 3
            self?.rightButton.title = "DONE"
        }
    }

    func displayRegisterProfileComplete() {
        DispatchQueue.main.async {
            self.router?.routeToRegisterComplete()
        }
    }

}

// MARK: RegisterProfileImageViewDelegate

extension ProfileRegisterViewController: RegisterProfileImageViewDelegate {
    func tapRegisterimageButton(_ sender: UIButton) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    DispatchQueue.main.async {
                        alertController.addAction(UIAlertAction(title: NSLocalizedString("Camera", comment: ""), style: .default) { [weak self] _ in
                            guard let self = self else { return }
                            self.imagePicker.sourceType = .camera
                            self.present(self.imagePicker, animated: true, completion: nil)
                        })
                    }
                }
            })
            alertController.addAction(UIAlertAction(title: "Gallery", style: .default) { [weak self] action in
                guard let self = self else { return }
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.allowsEditing = false
                self.present(self.imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { _ in
            }))
            
            alertController.modalPresentationStyle = .popover
            
            self.present(alertController, animated: true, completion: nil)
        }
    }

    func imageRemoved(image: UIImage) {
        self.interactor?.imageRemoved(image)
    }
}

extension ProfileRegisterViewController: UIImagePickerControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        DispatchQueue.main.async {
            guard let image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) else { return }
            
            let cropController = CropViewController(image: image)
            cropController.delegate = self
            
            cropController.customAspectRatio = CGSize(width: 3.0, height: 4.0)
            cropController.aspectRatioLockEnabled = true // The crop box is locked to the aspect ratio and can't be resized away from it
            cropController.resetAspectRatioEnabled = false // When tapping 'reset', the aspect ratio will NOT be reset back to default
            cropController.aspectRatioPickerButtonHidden = true
            
            picker.dismiss(animated: true, completion: {
                self.present(cropController, animated: true, completion: nil)
            })
        }
    }
}

extension ProfileRegisterViewController: CropViewControllerDelegate {
    public func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.interactor?.uploadImage(.init(image: image))
        DispatchQueue.main.async {
            cropViewController.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: EnterUserInfoViewDelegate

extension ProfileRegisterViewController: EnterUserInfoViewDelegate {
    func sendUserInfo(_ userInfo: ProfileRegister.DidTapFirstPageNext.Request, allEntered: Bool) {
        interactor?.didTapUserInfoPageNextButton(userInfo)
        DispatchQueue.main.async {
            self.rightButton.isEnabled = allEntered
        }
    }
}

// MARK: SelectTagListViewDelegate

extension ProfileRegisterViewController: SelectTagListViewDelegate {
    func sendKeywords(keyword keywords: [SelectTagListKeywordModel]) {
        interactor?.selectKeywords(.init(keywords: keywords))
        DispatchQueue.main.async {
            self.rightButton.isEnabled = keywords.count == 5
        }
    }
}

// MARK: SelectValuesViewDelegate

extension ProfileRegisterViewController: SelectValuesViewDelegate {
    func sendAnswers(answers: [AnswerViewModel]) {
        interactor?.selectAnswers(.init(answers: answers))
        DispatchQueue.main.async {
            self.rightButton.isEnabled = answers.count == 3
        }
    }
}

// MARK: UITextFieldDelegate

extension ProfileRegisterViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let utf8Char = string.cString(using: .utf8)
        let isBackSpace = strcmp(utf8Char, "\\b")
        if string.hasCharacters() || isBackSpace == -92{
            return true
        }
        return false
    }
}

