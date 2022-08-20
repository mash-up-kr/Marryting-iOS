//
//  SelectionContainer.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/22.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem

public protocol AnswerSelectionContainerDelegate: AnyObject {
    func answerSelectionBoxDidTap(_ selection: Answer)
}


public class AnswerSelectionContainer: UIView {

    public weak var delegate: AnswerSelectionContainerDelegate?

    public var question: Question = Question.dummy {
        didSet {
            titleLabel.text = question.question
            
            selectionBox1.viewModel = .init(isSelect: false, answer: question.answer1)
            selectionBox2.viewModel = .init(isSelect: false, answer: question.answer2)
        }
    }

    private lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.font = .body2()
        v.textColor = Pallete.Dark.grey100.color
        return v
    }()

    private lazy var selectionBox1: AnswerSelectionBox = {
        let v = AnswerSelectionBox()
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerSelectionBox1DidTap)))
        return v
    }()

    private lazy var selectionBox2: AnswerSelectionBox = {
        let v = AnswerSelectionBox()
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerSelectionBox2DidTap)))
        return v
    }()

    private var selection: AnswerSelection = .none {
        didSet {
            let answer: Answer
            switch selection {
            case .first:
                answer = Answer(answer: question.answer1, questionId: question.questionId)
                selectionBox1.isSelect = true
                selectionBox2.isSelect = false
            case .second:
                answer = Answer(answer: question.answer2, questionId: question.questionId)
                selectionBox1.isSelect = false
                selectionBox2.isSelect = true
            default:
                selectionBox1.isSelect = false
                selectionBox2.isSelect = false
                return
            }
            self.delegate?.answerSelectionBoxDidTap(answer)
        }
    }

    @objc private func answerSelectionBox1DidTap() {
        self.selection = .first
    }

    @objc private func answerSelectionBox2DidTap() {
        self.selection = .second
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    private func setUI() {
        self.addSubviews(self.titleLabel, self.selectionBox1, self.selectionBox2)

        self.snp.makeConstraints { make in
            make.height.equalTo(168)
        }
        self.titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        self.selectionBox1.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(66)
        }
        self.selectionBox2.snp.makeConstraints { make in
            make.top.equalTo(self.selectionBox1.snp.bottom).offset(6)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(66)
        }
    }
}
