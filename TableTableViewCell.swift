//
//  TableTableViewCell.swift
//  ContatosIP67
//
//  Created by ios8106 on 3/26/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit

class TableTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoContato: UIImageView!
    @IBOutlet weak var nomeContato: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fotoContato.layer.cornerRadius = fotoContato.bounds.height / 2
        
        fotoContato.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
