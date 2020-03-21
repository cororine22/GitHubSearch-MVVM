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
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.rx.text.asObservable()

    }


}

