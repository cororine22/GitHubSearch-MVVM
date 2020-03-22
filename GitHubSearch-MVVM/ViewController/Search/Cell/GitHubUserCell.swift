//
//  GitHubUserTableViewCell.swift
//  GitHubSearch-MVVM
//
//  Created by 北本杏菜 on 2020/03/21.
//  Copyright © 2020 北本杏菜. All rights reserved.
//

import UIKit

final class GitHubUserCell: UITableViewCell {
    struct Input: Equatable {
        let imageURL: URL
        let name: String
    }
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    private var task: URLSessionTask?
    
    func configure(input: Input){
        task = {
            let url = input.imageURL
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let imageData = data else {
                    return
                }
                DispatchQueue.global().async { [weak self] in
                    guard let image = UIImage(data: imageData) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.iconImageView.image = image
                        self?.setNeedsLayout()
                    }
                }
            }
            task.resume()
            return task
        }()
        nameLabel.text = input.name
    }
    
}
