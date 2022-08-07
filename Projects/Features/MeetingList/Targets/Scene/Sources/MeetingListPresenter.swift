//
//  MeetingListPresenter.swift
//  
//
//  Created by 박건우 on 2022/08/06.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MeetingListPresentationLogic {
    func presentMeetings(response: MeetingList.List.Response)
}

final class MeetingListPresenter: MeetingListPresentationLogic {
    weak var viewController: MeetingListDisplayLogic?
    
    // MARK: Presentation Logic
    
    func presentMeetings(response: MeetingList.List.Response) {
        
        var meetings: [MeetingCellViewModel] = []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        for (index, meeting) in response.meetings.enumerated() {
            meetings.append(MeetingCellViewModel(
                id: meeting.id,
                index: "\(index + 1)",
                groomName: meeting.groomName,
                brideName: meeting.brideName,
                date: dateFormatter.string(from: meeting.date)
            ))
        }
        
        viewController?.displayMeetings(viewModel: .init(meetings: meetings))
    }
    
}
