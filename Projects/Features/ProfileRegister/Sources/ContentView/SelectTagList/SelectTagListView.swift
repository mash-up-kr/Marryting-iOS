//
//  SelectTagListView.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem

struct SelectTagListKeywordModel {
    var keywordID: Int
    var keyword: String
}

struct SelectTagListViewModel {
    var selectedKeywordList: [SelectTagListKeywordModel]
    var keywordList: [SelectTagListKeywordModel]
}

protocol SelectTagListViewDelegate: AnyObject {
    func sendKeywords(keyword: [SelectTagListKeywordModel])
}

final class SelectTagListView: UIView {
    // MARK: - Properties

    var viewModel: SelectTagListViewModel? {
        didSet {
            self.checkedKeywords = viewModel?.selectedKeywordList ?? []
            self.tagList = viewModel?.keywordList ?? []
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    var checkedKeywords: [SelectTagListKeywordModel] = []

    private var tagList: [SelectTagListKeywordModel] = []

    
    weak var delegate: SelectTagListViewDelegate?
    
    // MARK: - Objects
    let collectionView: UICollectionView = {
        let layout = CenterAlignedCollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // 빨 보 노 파 초
    
    // MARK: CustomView Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func configureUI() {
        backgroundColor = Pallete.Dark.background.color
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: "tagCell")
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}

// TOOD: 2줄 3줄이 고정인지 물어보고 이 부분 추가 작업
// MARK: - Extension
extension SelectTagListView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tagList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as? TagCell else {
            return UICollectionViewCell()
        }
        
        cell.setData(tagList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TagCell else {
            fatalError()
        }
        
        let isClicked = cell.isClicked
        
        if !isClicked && checkedKeywords.count >= 5 { return }
        
        if isClicked {
            cell.unclick()
        } else {
            switch checkedKeywords.count {
                case 0:
                    cell.click(backgroundColor: Pallete.Light.main300.color?.withAlphaComponent(0.16), borderColor: Pallete.Light.main300.color)
                case 1:
                    cell.click(backgroundColor: Pallete.Light.subPurple.color?.withAlphaComponent(0.16), borderColor: Pallete.Light.subPurple.color)
                case 2:
                    cell.click(backgroundColor: Pallete.Light.subYellow.color?.withAlphaComponent(0.16), borderColor: Pallete.Light.subYellow.color)
                case 3:
                    cell.click(backgroundColor: Pallete.Light.subBlue.color?.withAlphaComponent(0.16), borderColor: Pallete.Light.subBlue.color)
                case 4:
                    cell.click(backgroundColor: Pallete.Light.subGreen.color?.withAlphaComponent(0.16), borderColor: Pallete.Light.subGreen.color)
                default:
                    break
            }
        }
        
        let keyword = tagList[indexPath.row]
        if cell.isClicked {
            checkedKeywords.append(keyword)
        } else {
            checkedKeywords = checkedKeywords.filter { $0.keywordID != keyword.keywordID }
        }
        delegate?.sendKeywords(keyword: self.checkedKeywords)
    }
}

extension SelectTagListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label = UILabel()
        label.font = .body1()
        label.text = tagList[indexPath.row].keyword
        label.sizeToFit()
        
        let size = label.frame.size
        
        return CGSize(width: size.width + 32, height: 40)
    }
}

// MARK: - UICollectionViewCell을 왼쪽 정력 시켜주는 flowLayout
final class CenterAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return [] }
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0 // 초기에 y값을 비교하기 위해서 -로 설정
        
        // 넓이를 화면 전체를 사용하지 않도록 spacing 값에 맞추어 세팅
        attributes.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = layoutAttribute.frame.maxY
        }
        
        // 그룹으로 묶어 중앙 정렬
        let horizontalInset = sectionInset.left + sectionInset.right
        let contentWidth: CGFloat = collectionViewContentSize.width - (horizontalInset / 2)
        let groupedAttributes = Dictionary(grouping: attributes, by: { $0.frame.maxY }) // y 값이 같은 애들끼리 묶음
        groupedAttributes.values.forEach { atts in
            guard let maxXofGroup = atts.map({ $0.frame.maxX }).max() else { return }
            let remainingSpace = (contentWidth - maxXofGroup)
            atts.forEach { $0.frame.origin.x += remainingSpace / 2 }
        }
        
        return attributes
    }
    
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    init(_ builder: @escaping () -> View) {
        view = builder()
    }

    // MARK: - UIViewRepresentable

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SelectTagViewPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = SelectTagListView(frame: .zero)
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
