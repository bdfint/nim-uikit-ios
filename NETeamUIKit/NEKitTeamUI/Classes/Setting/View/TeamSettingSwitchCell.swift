
// Copyright (c) 2022 NetEase, Inc.  All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the LICENSE file.

import UIKit

public class TeamSettingSwitchCell: BaseTeamSettingCell {
    
    var tSwitch: UISwitch = {
        let q = UISwitch()
        q.translatesAutoresizingMaskIntoConstraints = false
        q.onTintColor = NEConstant.hexRGB(0x337EFF)
        return q
    }()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func configure(_ anyModel: Any) {
        super.configure(anyModel)
        if let open = model?.switchOpen {
            tSwitch.isOn = open
        }
    }
    
    func setupUI(){
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 36),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -84)
        ])
        
        contentView.addSubview(tSwitch)
        NSLayoutConstraint.activate([
            tSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tSwitch.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -36)
        ])
        tSwitch.addTarget(self, action: #selector(switchChange(_:)), for: .touchUpInside)
    }
    
    @objc func switchChange(_ s: UISwitch) {
        if let block = model?.swichChange {
            block(s.isOn)
        }
    }

}
