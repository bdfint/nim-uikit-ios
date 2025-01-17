
// Copyright (c) 2022 NetEase, Inc.  All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the LICENSE file.

import UIKit

class ReplyView: UIView {
    var closeButton = UIButton(type: .custom)
    var line = UIView()
    var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hexString: "#EFF1F2")
        closeButton.setImage(UIImage.ne_imageNamed(name: "close"), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
//        closeButton.addTarget(self, action: #selector(closeButtonEvent), for: .touchUpInside)
        self.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            closeButton.widthAnchor.constraint(equalToConstant: 34)
        ])
        
        line.backgroundColor = UIColor(hexString: "#D8DAE4")
        line.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(line)
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: closeButton.trailingAnchor, constant: -3),
            line.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            line.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            line.widthAnchor.constraint(equalToConstant: 1)
        ])
        
        textLabel.font = UIFont.systemFont(ofSize: 12)
        textLabel.textColor = UIColor(hexString: "#929299")
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: closeButton.trailingAnchor, constant: 8),
            textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func closeButtonEvent(button: UIButton) {
//        self.removeFromSuperview()
//    }
    
    
    


}
