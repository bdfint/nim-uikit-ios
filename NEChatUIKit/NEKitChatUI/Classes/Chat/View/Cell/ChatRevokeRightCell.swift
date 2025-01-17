
// Copyright (c) 2022 NetEase, Inc.  All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the LICENSE file.

import UIKit

//protocol ChatRevokeRightCellDelegate: ChatBaseCellDelegate  {
//    func onReeditMessage(_ cell: UITableViewCell, _ model: MessageContentModel?)
//}

//typealias ReeditBlock = (_ cell: ChatRevokeRightCell, _ model: MessageContentModel?) -> ()

class ChatRevokeRightCell: ChatBaseRightCell {
    public var label = UILabel()
    public var reeditButton = UIButton(type: .custom)
//    public var reeditBlock: ReeditBlock?
//    public override var delegate: ChatBaseCellDelegate?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.ne_greyText
        label.font = UIFont.systemFont(ofSize: 16.0)
        self.bubbleImage.addSubview(label)
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: self.bubbleImage.leftAnchor, constant: 16),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.heightAnchor.constraint(equalToConstant: qChat_min_h),
            label.topAnchor.constraint(equalTo: self.bubbleImage.topAnchor, constant: 0),
            label.bottomAnchor.constraint(equalTo: self.bubbleImage.bottomAnchor, constant: 0)
        ])
        
        reeditButton.translatesAutoresizingMaskIntoConstraints = false
        reeditButton.setImage(UIImage.ne_imageNamed(name: "right_arrow"), for: .normal)
        reeditButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        reeditButton.setTitleColor(UIColor.ne_blueText, for: .normal)
        reeditButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        reeditButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)

        self.bubbleImage.addSubview(reeditButton)
        NSLayoutConstraint.activate([
            reeditButton.leftAnchor.constraint(equalTo: self.label.rightAnchor, constant: 8),
            reeditButton.rightAnchor.constraint(equalTo: self.bubbleImage.rightAnchor, constant: -8),
            reeditButton.topAnchor.constraint(equalTo: self.bubbleImage.topAnchor, constant: 0),
            reeditButton.bottomAnchor.constraint(equalTo: self.bubbleImage.bottomAnchor, constant: 0)
        ])
        reeditButton.addTarget(self, action: #selector(reeditEvent), for: .touchUpInside)
    }
    
    override func setModel(_ model: MessageContentModel) {
        super.setModel(model)
        label.text = localizable("message_has_be_withdrawn")
        reeditButton.setTitle(localizable("message_reedit"), for: .normal)
        //判断可编辑按钮的隐藏，只有文本才可以重新编辑
        reeditButton.isHidden = model.message?.messageType == .text ? false : true
    }
    
    @objc func reeditEvent(button: UIButton) {
        print(#function)
        self.delegate?.didTapReeditButton(self, self.model)
    }
}
