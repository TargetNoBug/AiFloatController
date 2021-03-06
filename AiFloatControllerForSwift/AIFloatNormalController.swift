//
//  AIFloatNormalController.swift
//  AiFloatControllerForSwift
//
//  Created by Aiewing on 2019/11/4.
//  Copyright © 2019 Aiewing. All rights reserved.
//

import UIKit

class AIFloatNormalController: AiFloatController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadUI()
        loadData()
        loadLayout()
    }
    
    override func scrollViewDidScroll(_ offsetY: CGFloat) {
        navBarImgView.frame = headerView.frame
        // 如果到顶了就不需要变化了
        if headerView.frame.maxY <= AiNavigationBarHeight {
            navBarImgView.frame = CGRect(x: 0, y: -headerView.frame.size.height + AiNavigationBarHeight, width: AiScreenWidth, height: headerView.frame.size.height)
        }
    }
    
    func loadUI() {
        initFloatController(.BecomeLarge, headerView: headerView, pullLargeView: nil, floatView: floatView, scrollViews: [tableView], overlyingHeight: 20)
        
        navBarView.bgImgView.addSubview(navBarImgView)
        navBarView.bgImgView.backgroundColor = .clear
    }
    
    func loadData() {
        tableView.titleArr = titleArr
        let image = UIImage(named: "小埋.jpeg")
        if let aImage = image {
            headerView.image = aImage.applyLightEffect()
            navBarImgView.image = headerView.image
        }
    }
    
    func loadLayout() {
        navBarImgView.frame = headerView.bounds
    }
    
    lazy var headerView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: AiScreenWidth, height: AiScreenWidth * 0.6)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var navBarImgView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var floatView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: AiScreenWidth, height: 50)
        view.backgroundColor = .green
        view.addRoundedCorners([.topLeft, .topRight], radius: CGSize(width: 20, height: 20))
        return view
    }()

    lazy var tableView: AiTableView = {
        let view = AiTableView(frame: CGRect(x: 0, y: 0, width: AiScreenWidth, height: AiScreenHeight), style: .plain)
        return view
    }()
    
    lazy var titleArr: [String] = {
        var arr = [String]()
        for index in 0...100 {
            arr.append("第\(index)行")
        }
        return arr
    }()
}
