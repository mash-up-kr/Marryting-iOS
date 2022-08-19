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
import BSImagePicker
import Photos

protocol ProfileRegisterDisplayLogic: AnyObject {
    func displaySomething(viewModel: ProfileRegister.Something.ViewModel)
}

public final class ProfileRegisterViewController: UIViewController, ProfileRegisterDisplayLogic {
    var interactor: ProfileRegisterBusinessLogic?
    var router: (NSObjectProtocol & ProfileRegisterRoutingLogic & ProfileRegisterDataPassing)?
    var images: [UIImage] = []
    var checkedAsset = [PHAsset]()
    var fetchResult = PHFetchResult<PHAsset>()
    var thumbnailSize: CGSize {
        let scale = UIScreen.main.scale
        return CGSize(width: (UIScreen.main.bounds.width / 3) * scale, height: 100 * scale)
    }
    
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
    
    private let pageSize = 4
    private let sideSpace = 32
    
    private var pageNum = 1 {
        didSet {
            changePage()
        }
    }
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
        pageControl.numberOfPages = pageSize
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
        button.isEnabled = true
        button.addTarget(self, action: #selector(pressPrevButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var rightButton: MTButton = {
        let button = MTButton.create(.mainDark)
        button.addTarget(self, action: #selector(pressNextButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var selectTagListView: SelectTagListView = {
        let view = SelectTagListView()
        return view
    }()
    
    lazy var enterUserInfoView: EnterUserInfoView = {
        let view = EnterUserInfoView()
        return view
    }()
    
    lazy var selectValuesView: SelectValuesView = {
        let view = SelectValuesView()
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
    }
    
    // MARK: Configure UI
    
    private func configureUI() {
        configureUIObjectsLayout()
        changePage()
        PHPhotoLibrary.shared().register(self)
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
    }
    
    private func changePage() {
        changeTopUI()
        
        loadViewIfNeeded()
        
        contentView.subviews.forEach({ $0.removeFromSuperview() })
        
        contentView.addSubview(contentViewArr[pageNum - 1])

        contentViewArr[pageNum - 1].snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func changeTopUI() {
        let titleText = titleStringList[pageNum - 1]
        let titlehighlightText = titlehighlightStringList[pageNum - 1]
        let attributedStr = NSMutableAttributedString(string: titleText)
        attributedStr.addAttribute(.foregroundColor,
                                   value: UIColor.white,
                                   range: (titleText as NSString).range(of: titleText))
        attributedStr.addAttribute(.foregroundColor,
                                   value: Pallete.Dark.subGreen.color ?? UIColor.white,
                                   range: (titleText as NSString).range(of: titlehighlightText))
        titleLabel.attributedText = attributedStr
        subTitleLabel.text = subTitleStringList[pageNum - 1]
        if pageNum == 1 {
            leftButton.isHidden = true
        } else {
            leftButton.isHidden = false
        }
        if pageNum == pageSize {
            rightButton.title = "DONE"
        } else {
            rightButton.title = "NEXT"
        }
        pageControl.currentPage = pageNum - 1
    }
    
    func displaySomething(viewModel: ProfileRegister.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    // MARK: Action
    
    @objc func pressPrevButton(_ sender: UIButton) {
        if pageNum > 1 {
            pageNum -= 1
        }
    }
    
    @objc func pressNextButton(_ sender: UIButton) {
        if pageNum < pageSize {
            pageNum += 1
        }
    }
}

extension ProfileRegisterViewController: RegisterProfileImageViewDelegate {
    func tapRegisterimageButton(_ sender: UIButton, completion: @escaping ([UIImage]) -> Void) {
        var seletedAsset: [PHAsset] = []
        var deseletedAsset: [PHAsset] = []
        
        let imagePicker = ImagePickerController(selectedAssets: checkedAsset)
        imagePicker.settings.selection.max = 5
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]

        self.presentImagePicker(imagePicker, select: { asset in
            seletedAsset.append(asset)
        }, deselect: { asset in
            deseletedAsset.append(asset)
        }, cancel: { assets in
        }, finish: { [weak self] _ in
            guard let self = self else { return }
            seletedAsset.forEach {
                self.checkedAsset.append($0)
            }
            deseletedAsset.forEach {
                guard let index = self.checkedAsset.firstIndex(of: $0) else { return }
                self.checkedAsset.remove(at: index)
            }
            // TODO: - 이미 가지고 있던 이미지는 다시 불러오지 않도록 수정
            self.images = []
            self.checkedAsset.forEach {
                self.images.append($0.getAssetThumbnail())
            }
            completion(self.images)
        })
    }
}

extension ProfileRegisterViewController: PHPhotoLibraryChangeObserver {
    public func photoLibraryDidChange(_ changeInstance: PHChange) {
        // 기본 라이브러리 쓰고 있지 않아서 필요 없어 보임
        getCanAccessImages()
    }
    
    private func getCanAccessImages() {
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        
        let fetchOptions = PHFetchOptions()
        self.fetchResult = PHAsset.fetchAssets(with: fetchOptions)
        self.fetchResult.enumerateObjects { [weak self] (asset, _, _) in
            self?.checkedAsset.append(asset)
            // 이미지 불러와서 images에 저장
        }
    }
}

// ---- PHAsset + Extension ----
extension PHAsset {
    func getAssetThumbnail() -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(
            for: self,
            targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight),
            contentMode: .aspectFit,
            options: option,
            resultHandler: {(result, info) -> Void in
                thumbnail = result ?? UIImage()
            }
        )
        return thumbnail
    }
}
