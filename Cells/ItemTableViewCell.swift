//
//  ItemTableViewCell.swift
//  TestingHomework
//
//  Created by User-UAM on 11/30/24.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    static let identifier = "ItemTableViewCell"
    
    public let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.lightGray.cgColor
        return textView
    }()
    
    // MARK: - Setup
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(itemLabel)
        contentView.addSubview(textView)
        
        // Layout constraints for the label and textView
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            itemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            textView.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            textView.heightAnchor.constraint(equalToConstant: 100) // Ajuste de altura del TextView
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: String) {
        itemLabel.text = item
    }
    
    // Método para obtener el texto escrito
    func getTextViewContent() -> String? {
        return textView.text
    }
}
