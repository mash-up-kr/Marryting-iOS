//
//  GuestDetailViewController.swift
//
//
//  Created by Woody on 2022/07/20.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import CarouselLayout
import DesignSystem
import GuestDetailRouter
import GuestDetailRoutingProtocol
import UIKit

import SnapKit

protocol GuestDetailDisplayLogic: AnyObject {
    func displayGuest(viewModel: GuestDetail.GetGuest.ViewModel)
    func displayChangeMeetingButton(viewModel: GuestDetail.GetMeetingCount.ViewModel)
}

struct GuestDetailViewModel {
    var name: String
    var age: Int
    var address: String
    var career: String
    var isLiked: Bool
    var images: [UserProfileImagewCellViewModel]
    var keywords: KeywordsViewModel
    var answers: WhoIAmViewModel
}

public final class GuestDetailViewController: UIViewController, GuestDetailDisplayLogic {
    var interactor: GuestDetailBusinessLogic?
    public var router: (GuestDetailRoutingLogic & GuestDetailDataPassing)?

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
        let interactor = GuestDetailInteractor()
        let presenter = GuestDetailPresenter()
        let router = GuestDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: UI

    private let navigationView: UIView = {
        return $0
    }(UIView())

    private lazy var backButton: UIImageView = {
        $0.image = .create(.ic_arrow_back)
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonDidTap)))
        return $0
    }(UIImageView())

    private lazy var changeMeetingButton: UIButton = {
        let v = UIButton(type: .system)
        v.setTitleColor(Pallete.Light.grey500.color, for: .normal)
        v.setTitle("결혼식 변경", for: .normal)
        v.layer.cornerRadius = 8
        v.layer.borderWidth = 1
        v.layer.borderColor = Pallete.Light.grey100.color?.cgColor
        v.isHidden = true
        v.addTarget(self, action: #selector(changeMeetingButtonDidTap), for: .touchUpInside)
        return v
    }()

    private let scrollView: UIScrollView = {
        return $0
    }(UIScrollView())

    private let contentView: UIView = {
        let v = UIView()
        v.backgroundColor = Pallete.Light.background.color
        return v
    }()

    private let topHeaderStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alignment = .leading
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 0
        return $0
    }(UIStackView())

    private lazy var profileStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.distribution = .fill
        v.alignment = .firstBaseline
        v.spacing = 5
        return v
    }()

    private lazy var helloLabel: UILabel = {
        let v = UILabel()
        v.textAlignment = .left
        v.text = "Hello!"
        v.textColor = Pallete.Light.grey500.color
        v.font = .h3(name: .montserrat)
        return v
    }()

    private lazy var nameLabel: UILabel = {
        // MARK: 영어이름일경우
        $0.font = .h1()
        $0.textAlignment = .left
        $0.textColor = Pallete.Light.grey800.color
        return $0
    }(UILabel())

    private let ageLabel: UILabel = {
        $0.font = .h2(name: .montserrat)
        $0.textColor = Pallete.Light.grey200.color
        return $0
    }(UILabel())

    private lazy var likeButton: MTButton = {
        $0.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
        $0.addTarget(self, action: #selector(likeButtonDidTouchUpOutside), for: .touchUpOutside)
        $0.addTarget(self, action: #selector(likeButtonDidTouchDown), for: .touchDown)
        return $0
    }(MTButton.create(.iconMainLightSelected))

    private let addressStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 2
        return $0
    }(UIStackView())

    private let addressIconImageView: UIImageView = {
        let v = UIImageView(asset: .ic_sharp_place)
        return v
    }()

    private let addressLabel: UILabel = {
        $0.font = .h5()
        $0.textColor = Pallete.Light.grey600.color
        return $0
    }(UILabel())

    private let addressDescriptionLabel: UILabel = {
        $0.font = .subtitle2()
        $0.textColor = Pallete.Light.grey400.color
        $0.text = "에 살아요"
        return $0
    }(UILabel())

    private let careerStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 2
        return $0
    }(UIStackView())

    private let careerIconImageView: UIImageView = {
        let v = UIImageView(asset: .ic_symbols_work)
        return v
    }()

    private let careerLabel: UILabel = {
        $0.font = .h5()
        $0.textColor = Pallete.Light.grey600.color
        return $0
    }(UILabel())

    private let careerDescriptionLabel: UILabel = {
        $0.font = .subtitle2()
        $0.textColor = Pallete.Light.grey400.color
        $0.text = "로 일해요"
        return $0
    }(UILabel())

    private lazy var collectionView: UICollectionView = {
        let layout = HorizontalCarouselLayout()
        layout.delegate = self
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.backgroundColor = Pallete.Light.background.color
        v.register(UserProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: "UserProfileImageCollectionViewCell")
        v.dataSource = self
        v.delegate = self
        v.layer.masksToBounds = false
        v.contentInset = .init(top: 0, left: collectionViewInset, bottom: 0, right: collectionViewInset)
        v.showsHorizontalScrollIndicator = false
        v.decelerationRate = .fast
        return v
    }()

    private lazy var pageControl: UIPageControl = {
        let v = UIPageControl()
        v.isUserInteractionEnabled = false
        v.currentPageIndicatorTintColor = Pallete.Light.grey800.color
        v.pageIndicatorTintColor = Pallete.Light.grey300.color
        return v
    }()

    private lazy var keywordContainerView: IntroductionContainerView = {
        let v = IntroductionContainerView(containView: KeywordsView())
        v.title = "KEYWORD"
        return v
    }()

    private lazy var whoIAmContainerView: IntroductionContainerView = {
        let v = IntroductionContainerView(containView: WhoIAmView())
        v.title = "WHO I AM"
        return v
    }()

    var viewModel: GuestDetailViewModel? {
        didSet {
            self.nameLabel.text = viewModel?.name ?? ""
            self.addressLabel.text = viewModel?.address ?? ""
            self.ageLabel.text = "\(viewModel?.age ?? 0)"
            self.careerLabel.text = viewModel?.career ?? ""
            self.keywordContainerView.viewModel = viewModel?.keywords
            self.whoIAmContainerView.viewModel = viewModel?.answers

            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
                self?.pageControl.numberOfPages = self?.viewModel?.images.count ?? 1
                self?.pageControl.currentPage = 0
                self?.pageControl.subviews.forEach {
                    $0.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                }
            }

            guard let viewModel = viewModel else { return }
            let isLikedImage: UIImage? = viewModel.isLiked ? .create(.ic_heart_highlight) : .create(.ic_heart_enable)
            likeButton.setBackgroundImage(isLikedImage, for: .normal)
            likeButton.setBackgroundImage(isLikedImage, for: .highlighted)
            if viewModel.isLiked {
                likeButton.removeTarget(self, action: nil, for: .touchUpInside)
                likeButton.addTarget(self, action: #selector(likeButtonDidTapWithoutAction), for: .touchUpInside)
            }
        }
    }

    // MARK: Stored Property

    public enum ProfileDetailType {
        case myProfile
        case guestProfile
    }

    private var profileDetailType: ProfileDetailType?

    // MARK: View lifecycle

    public init(profileDetailType: ProfileDetailType = .guestProfile) {
        self.init()
        self.profileDetailType = profileDetailType
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchGuest()
    }

    private func setUI() {
        self.view.backgroundColor = Pallete.Light.background.color

        self.view.addSubviews(self.scrollView, self.navigationView)
        self.contentView.addSubviews(self.likeButton)
        self.contentView.addSubviews(self.topHeaderStackView)
        self.contentView.addSubviews(self.addressStackView, self.careerStackView)
        self.contentView.addSubviews(self.collectionView, self.pageControl)
        self.contentView.addSubviews(self.keywordContainerView, self.whoIAmContainerView)
        self.scrollView.addSubview(self.contentView)
        self.navigationView.addSubview(self.backButton)
        self.navigationView.addSubview(self.changeMeetingButton)
        self.topHeaderStackView.addArrangedSubview(self.profileStackView)
        self.profileStackView.addArrangedSubview(self.nameLabel)
        self.profileStackView.addArrangedSubview(self.ageLabel)
        self.addressStackView.addArrangedSubview(self.addressIconImageView)
        self.addressStackView.addArrangedSubview(self.addressLabel)
        self.addressStackView.addArrangedSubview(self.addressDescriptionLabel)
        self.careerStackView.addArrangedSubview(self.careerIconImageView)
        self.careerStackView.addArrangedSubview(self.careerLabel)
        self.careerStackView.addArrangedSubview(self.careerDescriptionLabel)

        self.navigationView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        self.backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        self.changeMeetingButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.backButton)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(82)
            make.height.equalTo(27)
        }
        self.scrollView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.navigationView.snp.bottom)
        }
        self.contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.scrollView)
            make.height.equalTo(self.scrollView).priority(.low)
        }
        self.topHeaderStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(32)
        }
        self.likeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(32)
            make.centerY.equalTo(self.nameLabel)
            make.width.height.equalTo(48)
        }
        self.addressStackView.snp.makeConstraints { make in
            make.top.equalTo(self.topHeaderStackView.snp.bottom).offset(10)
            make.leading.equalTo(self.topHeaderStackView)
        }
        self.careerStackView.snp.makeConstraints { make in
            make.top.equalTo(self.addressStackView.snp.bottom).offset(4)
            make.leading.equalTo(self.addressStackView)
        }
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.careerStackView.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview()
            let width: CGFloat = UIScreen.main.bounds.width - collectionViewInset * 2
            let height: CGFloat = width * 1.33
            make.height.equalTo(height)
        }
        self.pageControl.snp.makeConstraints { make in
            make.top.equalTo(self.collectionView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        self.keywordContainerView.snp.makeConstraints { make in
            make.top.equalTo(self.collectionView.snp.bottom).offset(98)
            make.leading.trailing.equalToSuperview()
        }
        self.whoIAmContainerView.snp.makeConstraints { make in
            make.top.equalTo(self.keywordContainerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(careerStackView.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview()
            let width: CGFloat = UIScreen.main.bounds.width - collectionViewInset * 2
            let height: CGFloat = width * 1.33
            make.height.equalTo(height)
        }

        if self.profileDetailType == .myProfile { configure() }
    }

    private func configure() {
        self.topHeaderStackView.subviews.forEach { $0.removeFromSuperview() }
        self.topHeaderStackView.addArrangedSubviews(self.helloLabel, self.profileStackView)
        self.likeButton.isHidden = true
        self.changeMeetingButton.isHidden = false
    }

    // MARK: Display Logic

    func displayGuest(viewModel: GuestDetail.GetGuest.ViewModel) {
        self.viewModel = viewModel.guest
    }

    func displayChangeMeetingButton(viewModel: GuestDetail.GetMeetingCount.ViewModel) {
        // MARK: 잠시 숨김 처리 - 기획 상의
//        DispatchQueue.main.async { [weak self] in
//            self?.changeMeetingButton.isHidden = viewModel.isHidden
//        }

    }
}

// MARK: Button Tap

extension GuestDetailViewController {
    @objc
    func backButtonDidTap() {
        router?.removeFromParent()
    }

    @objc
    func likeButtonDidTap() {
        guard let guest = router?.dataStore?.targetGuest else {
            return
        }
        UIView.animate(
            withDuration: 0.05,
            animations: {
                self.likeButton.transform = CGAffineTransform.identity
            }
        )
        router?.routeToLikeRequestScene(targetId: guest.user.id)
    }

    @objc
    func likeButtonDidTouchDown() {
        UIView.animate(
            withDuration: 0.25,
            animations: {
                self.likeButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        )
    }

    @objc
    func likeButtonDidTouchUpOutside() {
        UIView.animate(
            withDuration: 0.05,
            animations: {
                self.likeButton.transform = CGAffineTransform.identity
            }
        )
    }

    @objc
    func likeButtonDidTapWithoutAction() {
        UIView.animate(
            withDuration: 0.05,
            animations: {
                self.likeButton.transform = CGAffineTransform.identity
            }
        )
    }

    @objc
    func changeMeetingButtonDidTap() {
        router?.routeToMeetingListScene()
    }
}

// MARK: UICollectionViewDataSource

extension GuestDetailViewController: UICollectionViewDataSource {
    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel?.images.count ?? 0
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileImageCollectionViewCell", for: indexPath) as? UserProfileImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.viewModel = viewModel?.images[indexPath.item]
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension GuestDetailViewController: UICollectionViewDelegateFlowLayout {
    fileprivate var collectionViewInset: CGFloat {
        return 40
    }

    fileprivate var itemSpacing: CGFloat {
        return -30
    }

    public func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let itemWidth: CGFloat = collectionView.bounds.width - collectionViewInset * 2
        let cellWidthIncludingSpacing = itemWidth + itemSpacing

        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)

        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)
        } else {
            roundedIndex = ceil(index)
        }

        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let width: CGFloat = scrollView.contentOffset.x + collectionViewInset * 2
        let cellWidth: CGFloat = collectionView.bounds.width - collectionViewInset * 2 + itemSpacing
        let newPage = Int(width / cellWidth)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
}

// MARK: HorizontalCarouselLayoutDelegate

extension GuestDetailViewController: HorizontalCarouselLayoutDelegate {
    public func itemSize(
        _ collectionView: UICollectionView
    ) -> CGSize {
        let width: CGFloat = collectionView.bounds.width - collectionViewInset * 2
        let height: CGFloat = width * 1.33
        return .init(width: width, height: height)
    }

    public func minimumLineSpacing(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout
    ) -> CGFloat {
        return itemSpacing
    }
}
