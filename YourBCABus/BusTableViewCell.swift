//
//  BusTableViewCell.swift
//  YourBCABus
//
//  Created by Anthony Li on 10/22/18.
//  Copyright © 2018 YourBCABus. All rights reserved.
//

import UIKit

class BusTableViewCell: UITableViewCell {
    private var starListener: NotificationToken?
    
    var bus: Bus? {
        didSet {
            configureView()
            if let id = bus?._id {
                starListener = NotificationCenter.default.observe(name: NSNotification.Name(BusManager.NotificationName.starredBusesChange.rawValue), object: nil, queue: nil, using: { [unowned self] notification in
                    if notification.userInfo?[BusManager.NotificationUserInfoKey.busID] as? String == id {
                        self.configureStarButton(starred: BusManager.shared.isStarred(bus: id))
                    }
                })
            }
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationView: BusLocationView!
    @IBOutlet weak var starButton: UIButton?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureView() {
        if let bus = bus {
            nameLabel.text = bus.name == nil ? "(no name)" : bus.name!
            descriptionLabel.text = bus.location == nil ? "Not at BCA" : "Arrived at BCA"
            locationView.location = bus.location
            configureStarButton(starred: BusManager.shared.isStarred(bus: bus._id))
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func toggleStar(sender: UIButton?) {
        if let id = bus?._id {
            BusManager.shared.toggleStar(for: id)
        }
    }
    
    func configureStarButton(starred: Bool) {
        starButton?.tintColor = starred ? UIColor(named: "Accent") : UIColor.lightGray
    }

}
