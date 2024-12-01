//
//  HomeViewController.swift
//  TestingHomework
//
//  Created by User-UAM on 11/30/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Elements
    public let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "welcomeLabel"
        return label
    }()
    
    public let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "profileImageView"
        return imageView
    }()
    
    public let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = "itemsTableView"
        tableView.rowHeight = UITableView.automaticDimension // Activar la altura automática
        tableView.estimatedRowHeight = 100 // Establecer la altura estimada
        return tableView
    }()
    
    // MARK: - Data Source
    public let items = ["First Item", "Second Item", "Third Item"]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupTableView()
    }
    
    // MARK: - UI Setup
    public func setupUI() {
        view.addSubview(welcomeLabel)
        view.addSubview(profileImageView)
        view.addSubview(tableView)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    public func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier)
    }
}

// MARK: - TableView Delegate & DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: items[indexPath.row])
        
        // Accessibility identifiers for specific cells
        if indexPath.row == 0 {
            cell.accessibilityIdentifier = "firstCell"
        } else if indexPath.row == items.count - 1 {
            cell.accessibilityIdentifier = "lastCell"
        }
        
        return cell
    }
}

