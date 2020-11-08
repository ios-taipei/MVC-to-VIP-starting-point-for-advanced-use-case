//
//  MeetupEventListInteractor.swift
//  ITApp
//
//  Created by Chiaote Ni on 2020/10/28.
//  Copyright (c) 2020 iOS@Taipei in iPlayground. All rights reserved.
//
//  This file was generated by iOS@Taipei's Clean Architecture Xcode Templates, which
//  is goaled to help you apply clean architecture to your iOS projects,
//

/*
 Interactor: 任務指派者，叫worker幫ViewController做事
 ex: 透過worker拉API/DB資料，回傳資料的排序，開啟部分監聽，圖片壓縮，邏輯運算...等等
 反正跟UI完全無關的全部塞這就對了www
 */

import Foundation

protocol MeetupEventListBusinessLogic {
    func fetchMeetupEvents(request: MeetupEventList.FetchEvents.Request)
}

final class MeetupEventListInteractor: MeetupEventListBusinessLogic {
    
    var presenter: MeetupEventListPresentationLogic?
    
    private let fetchMeetupEventWorker: MeetupEventListAPIWorker // 拉活動列表的worker
    
    init(jsonAPIWorker: JsonAPIWorker = .init()) {
        fetchMeetupEventWorker = .init(jsonAPIWorker: jsonAPIWorker)
    }
    
    func fetchMeetupEvents(request: MeetupEventList.FetchEvents.Request) {
        //TODO: 拉活動資料，並依照日期分成 最近活動/活動紀錄 兩種資料list (請worker拉資料)
        presenter?.presentMeetupEvents(response: <#T##MeetupEventList.FetchEvents.Response#>)
    }
}

// MARK: - Constants
extension MeetupEventListInteractor {
    
    private enum Constant {
        static let oneDay: TimeInterval = 3600 * 24
    }
}