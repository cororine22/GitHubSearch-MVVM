//
//  SearchViewModel.swift
//  GitHubSearch-MVVM
//
//  Created by 北本杏菜 on 2020/03/21.
//  Copyright © 2020 北本杏菜. All rights reserved.
//

import Foundation
import RxSwift

final class SearchViewModel {
    let items: Observable<[GitHubUserTableViewCell.Input]>
    
    init(searchBarText: Observable<String>){

        let model = SearchModel()
        items = searchBarText
            .flatMap{ text -> Observable<[User]> in
                let sigleUser = model.fetchUser(query: text)
                return sigleUser.asObservable()
            }
            .map { users -> [GitHubUserTableViewCell.Input] in
                users.map {GitHubUserTableViewCell.Input( )}
            }
    }
    
}
 
