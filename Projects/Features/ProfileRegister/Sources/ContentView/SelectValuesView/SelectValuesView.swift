//
//  SelectValuesView.swift
//  ProfileRegisterTests
//
//  Created by Yoojin Park on 2022/07/23.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem

protocol SelectValuesViewDelegate: AnyObject {
    func sendAnswers(answers: [AnswerViewModel])
}

final class SelectValuesView: UIView {
    
    var question: [QuestionViewModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private var selectedAnswers: [AnswerViewModel] = []
    weak var delegate: SelectValuesViewDelegate?
    
    // MARK: UI Properties
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.contentInset.bottom = 108 - 32 // 32: cell안의 아래 빈 공간
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    // MARK: CustomView Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    
    // MARK: Configure UI
    
    private func configureUI() {
        backgroundColor = Pallete.Dark.background.color
        
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension SelectValuesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SelectValuesCell()
        cell.delegate = self
        cell.setQuestion(question[indexPath.row])
        return cell
    }
}

extension SelectValuesView: SelectValuesCellDelegate {
    func sendAnswer(answer: AnswerViewModel) {
        selectedAnswers = selectedAnswers.filter { $0.questionId != answer.questionId }
        selectedAnswers.append(answer)
        delegate?.sendAnswers(answers: selectedAnswers)
    }
}
