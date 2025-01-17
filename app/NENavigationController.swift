
// Copyright (c) 2022 NetEase, Inc.  All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the LICENSE file.

import UIKit

class NENavigationController: UINavigationController {

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            if children.count > 1 {
                viewController.hidesBottomBarWhenPushed = false
            }
        }
        super.pushViewController(viewController, animated: true)
    }

}
