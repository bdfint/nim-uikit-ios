
// Copyright (c) 2022 NetEase, Inc.  All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the LICENSE file.

import UIKit

public class ChatUserHeaderView: UIImageView {

    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = DefaultTextFont(12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI(){
        isUserInteractionEnabled = true
        clipsToBounds = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor
                .constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        backgroundColor = .clear
    }
    
    public func setTitle(_ name: String) {
        titleLabel.text = name.count > 2 ? String(name[name.index(name.endIndex, offsetBy: -2)...]) : name
    }

}
