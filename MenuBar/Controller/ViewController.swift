//
//  ViewController.swift
//  MenuBar
//
//  Created by Shawn Li on 6/1/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    var menuIsOpen = false
    
    @IBOutlet weak var menuBtnLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewMenu: UITableView!
    
    @IBAction func toggleMenuBtnTapped(_ sender: UIButton)
    {
        menuIsOpen = !menuIsOpen
        
         UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: { self.configureAnimation() }, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView()
    {
        tableViewMenu.delegate = self
        tableViewMenu.dataSource = self
        tableViewWidthConstraint.constant = 0
        
        tableViewMenu.register(MenuCell.self, forCellReuseIdentifier: "cell")
        tableViewMenu.backgroundColor = .darkGray
        tableViewMenu.separatorStyle = .none
        tableViewMenu.rowHeight = 80
    }
    
    func configureAnimation()
    {
        tableViewWidthConstraint.constant = menuIsOpen ? 250 : 0
        menuBtnLeftConstraint.constant = menuIsOpen ? 270 : 20
        self.view.layoutIfNeeded()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        
        cell.optionsLabel.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.iconImageView.image = MenuOptions.allCases[indexPath.row].iconImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

