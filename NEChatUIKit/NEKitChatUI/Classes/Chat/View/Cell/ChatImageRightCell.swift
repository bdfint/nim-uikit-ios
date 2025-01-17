
// Copyright (c) 2022 NetEase, Inc.  All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the LICENSE file.

import UIKit
import NIMSDK

class ChatImageRightCell: ChatBaseRightCell {
    public let contentImageView = UIImageView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonUI() {
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.contentMode = .scaleAspectFill
        contentImageView.addCustomCorner(conrners: [.topLeft, .bottomLeft, .bottomRight], radius: 8, backcolor: .white)
        contentImageView.clipsToBounds = true

        bubbleImage.addSubview(contentImageView)
        NSLayoutConstraint.activate([
            self.contentImageView.rightAnchor.constraint(equalTo: bubbleImage.rightAnchor, constant: 0),
            self.contentImageView.leftAnchor.constraint(equalTo: bubbleImage.leftAnchor, constant: 0),
            self.contentImageView.topAnchor.constraint(equalTo: bubbleImage.topAnchor, constant: 0),
            self.contentImageView.bottomAnchor.constraint(equalTo: bubbleImage.bottomAnchor, constant: 0)
        ])
    }
    
    override func setModel(_ model: MessageContentModel) {
        super.setModel(model)
        if let m = model as? MessageImageModel,let imageUrl = m.imageUrl {
            if imageUrl.hasPrefix("http") {
                contentImageView.sd_setImage(with: URL.init(string: imageUrl), placeholderImage: nil, options: .retryFailed, progress: nil, completed: nil)
            }else {
                contentImageView.image = UIImage(contentsOfFile: imageUrl)
            }
        }
        
//        if let imageObject = model.message?.messageObject as? NIMImageObject  {
//            if let filePath = imageObject.path {
//                contentImageView.image = UIImage.init(contentsOfFile: filePath)
//            }else{
//                contentImageView.sd_setImage(with: URL.init(string: imageObject.url ?? ""), placeholderImage: nil, options: .retryFailed, progress: nil, completed: nil)
//            }
//        }
    }

}
