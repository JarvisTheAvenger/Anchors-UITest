//
//  UsersVC.swift
//  Anchors
//
//  Created by Rahul on 08/05/21.
//

import UIKit

class UsersVC: UIViewController {
    
    lazy var usersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = "userTableView"
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var users = [User]()
    
    override func loadView() {
        super.loadView()
        setupView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        usersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "userCell")
        setupDataSource()
    }
    
    func setupDataSource() {
        guard let file = Bundle.main.url(forResource: "Users", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: file)
            let response = try JSONDecoder().decode(Response.self, from: data)
            users = response.users
            usersTableView.reloadData()
        } catch {
            debugPrint(error)
        }
    }

}

//MARK: - Anchors View Related
extension UsersVC {
    func setupView() {
        view.addSubview(usersTableView)
        
        NSLayoutConstraint.activate([
            usersTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            usersTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            usersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            usersTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

//MARK: -  UITableViewDataSource, UITableViewDelegate
extension UsersVC : UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { users.count }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 63 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(users[indexPath.row])
        return cell
    }
}
