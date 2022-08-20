//
//  SelectValuesCell.swift
//  ProfileRegisterTests
//
//  Created by Yoojin Park on 2022/07/23.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem

protocol SelectValuesCellDelegate: AnyObject {
    func sendAnswer(answer: Answer)
}
class SelectValuesCell: UITableViewCell {
    weak var delegate: SelectValuesCellDelegate?
    
    let situationLabel: UILabel = {
        let label = UILabel()
        label.font = .body2()
        label.textColor = Pallete.Dark.grey100.color
        return label
    }()
    
    let container: AnswerSelectionContainer = {
        let container = AnswerSelectionContainer()
        return container
    }()
    
    // MARK: CustomView Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    override func prepareForReuse() {
    //    }
    
    // MARK: Configure UI
    
    private func configureUI() {
        backgroundColor = .clear
        
        // 코드베이스로 할때 아래 코드 없으면 안에 버튼 작동 X
        contentView.isUserInteractionEnabled = false
        
        container.delegate = self
        
        addSubview(situationLabel)
        
        situationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        addSubview(container)
        
        container.snp.makeConstraints { make in
            make.top.equalTo(situationLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-32)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setQuestion(_ question: Question) {
        container.question = question
    }
}

extension SelectValuesCell: AnswerSelectionContainerDelegate {
    func answerSelectionBoxDidTap(_ selection: Answer) {
        delegate?.sendAnswer(answer: selection)
    }
}
