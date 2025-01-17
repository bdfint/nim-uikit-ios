
// Copyright (c) 2022 NetEase, Inc.  All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the LICENSE file.

import UIKit
import NEKitCore
import NEKitTeamUI
import NEKitChatUI

class IntroduceBrandViewController: NEBaseViewController {

    private var viewModel = IntroduceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getData()
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setupSubviews(){
        view.addSubview(headImage)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            headImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headImage.topAnchor.constraint(equalTo: view.topAnchor,constant: (kNavigationHeight + KStatusBarHeight + 20)),
            headImage.widthAnchor.constraint(equalToConstant: 94),
            headImage.heightAnchor.constraint(equalToConstant: 66)

        ])
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: headImage.bottomAnchor,constant: 45),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    
    //MARK: lazy method
    private lazy var headImage:UIImageView = {
        let image = UIImageView.init(image: UIImage.init(named: "yunxin_logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(VersionCell.self, forCellReuseIdentifier: "VersionCell")
        if #available(iOS 15.0, *) {
            table.sectionHeaderTopPadding = 0.0
        }
        return table
    }()
}

extension IntroduceBrandViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sectionData.count
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.sectionData[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VersionCell", for: indexPath) as? VersionCell {
            cell.configData(model: model)
            if indexPath.row == 0 {
                cell.cellType = .version
            }else {
                cell.cellType = .productIntroduce
            }
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 1 {
            let ctrl = NEAboutWebViewController.init(url: "https://netease.im/m/")
            navigationController?.pushViewController(ctrl, animated: true)
        }

    }
}
