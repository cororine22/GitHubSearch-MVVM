//
//  SearchViewModel.swift
//  GitHubSearch-MVVM
//
//  Created by 北本杏菜 on 2020/03/21.
//  Copyright © 2020 北本杏菜. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    let items: Driver<[GitHubUserCell.Input]>

    init(searchText: ControlProperty<String?>, searchButtonClicked: ControlEvent<Void>) {
        let model = SearchModel()
        
        items = searchButtonClicked
            .withLatestFrom(searchText)
            .compactMap { $0 }
            .flatMap { text -> Single<[User]> in
                model.fetchUser(query: text)
            }
            .map { users -> [GitHubUserCell.Input] in
                users.map { user -> GitHubUserCell.Input in
                    .init(imageURL: user.avatarURL, name: user.login)
                }
            }
            .distinctUntilChanged()
            .asDriver(onErrorDriveWith: .empty())
        
    }
}
 
