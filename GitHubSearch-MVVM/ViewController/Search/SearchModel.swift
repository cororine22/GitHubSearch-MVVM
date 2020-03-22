//
//  SearchModel.swift
//  GitHubSearch-MVVM
//
//  Created by 北本杏菜 on 2020/03/21.
//  Copyright © 2020 北本杏菜. All rights reserved.
//

import Foundation
import RxSwift

final class SearchModel {
    let session = Session()
    
    func fetchUser(query: String) -> Single<[User]> {
        Single.create(subscribe: { [weak self] observer in
            let request = SearchUsersRequest(query: query)
            self?.session.send(request, completion: { result in
                switch result {
                case .success(let responce, _):
                    observer(.success(responce.items))
                case .failure(let error):
                    print(error)
                    observer(.success([]))
                }
            })
            return Disposables.create()
        })
    }
}
