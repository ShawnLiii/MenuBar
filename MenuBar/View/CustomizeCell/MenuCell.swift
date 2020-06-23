//
//  MenuCell.swift
//  MenuBar
//
//  Created by Shawn Li on 6/1/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    var iconImageView: UIImageView!
    var optionsLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .darkGray
        configureImageView()
        configureOptionsLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureImageView()
    {
        iconImageView = UIImageView()
        iconImageView?.contentMode = .scaleAspectFit
        iconImageView?.clipsToBounds = true
        iconImageView.tintColor = .white
    
        //Add Subview
        addSubview(iconImageView)
        //Add constrains
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func configureOptionsLabel()
    {
        optionsLabel = UILabel()
        optionsLabel.textColor = .white
        optionsLabel.font = UIFont.systemFont(ofSize: 20)

        //Add Subview
        addSubview(optionsLabel)
        //Add constrains
        optionsLabel.translatesAutoresizingMaskIntoConstraints = false
        optionsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        optionsLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
    }
}
