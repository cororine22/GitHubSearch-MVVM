//
//  SearchViewController.swift
//  GitHubSearch-MVVM
//
//  Created by 北本杏菜 on 2020/03/20.
//  Copyright © 2020 北本杏菜. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class SearchViewController: UIViewController {
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerNib(classType: GitHubUserCell.self)
        }
    }
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = SearchViewModel(
            searchBarText: searchBar.rx.text.asObservable(),
            searchButtonClicked: searchBar.rx.searchButtonClicked.asObservable()
        )
        viewModel.items
            .drive(tableView.rx.items(type: GitHubUserCell.self)) { row, element, cell in
                cell.configure(input: element)
            }
            .disposed(by: bag)
    }


}

