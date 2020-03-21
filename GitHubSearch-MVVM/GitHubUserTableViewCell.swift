//
//  GitHubUserTableViewCell.swift
//  GitHubSearch-MVVM
//
//  Created by 北本杏菜 on 2020/03/21.
//  Copyright © 2020 北本杏菜. All rights reserved.
//

import UIKit

final class GitHubUserTableViewCell: UITableViewCell {
    struct Input{
        let image: UIImage
        let name: String
    }
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func configure(input: Input){
        iconImageView.image = input.image
        nameLabel.text = input.name
    }
    
}
