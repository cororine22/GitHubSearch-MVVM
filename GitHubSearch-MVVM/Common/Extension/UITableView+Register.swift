//
//  UITableView+Registe.swift
//  GitHubSearch-MVVM
//
//  Created by 北本杏菜 on 2020/03/22.
//  Copyright © 2020 北本杏菜. All rights reserved.
//

import RxSwift
import RxCocoa

extension UITableView {
    func registerNib<T: UITableViewCell>(classType type: T.Type) {
        let className = String(describing: type)
        let nib = UINib(nibName: className, bundle: Bundle(for: type))
        register(nib, forCellReuseIdentifier: className)
    }
}

extension Reactive where Base: UITableView {
    public func items<Sequence: Swift.Sequence, Cell: UITableViewCell, Source: ObservableType>
        (type: Cell.Type = Cell.self)
        -> (_ source: Source)
        -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
        -> Disposable
        where Source.Element == Sequence {
        return items(cellIdentifier:  String(describing: type), cellType: type)
    }
}
