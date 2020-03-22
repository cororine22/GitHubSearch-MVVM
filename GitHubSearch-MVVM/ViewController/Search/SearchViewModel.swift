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

    init(searchBarText: Observable<String?>, searchButtonClicked: Observable<Void>) {
        let model = SearchModel()
        
        items = searchButtonClicked
            .withLatestFrom(searchBarText)
            .compactMap{ $0 }
            .flatMap{ text -> Observable<[User]> in
                model.fetchUser(query: text).asObservable()
            }
            .map{ users -> [GitHubUserCell.Input] in
                users.map { user -> GitHubUserCell.Input in
                    .init(imageURL: user.avatarURL, name: user.login)
                }
            }
            .asDriver(onErrorDriveWith: .empty())
        
    }
}
 
