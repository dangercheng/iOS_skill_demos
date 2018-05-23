//
//  BeforeViewController.swift
//  GraphicsPerformanceOptimization
//
//  Created by DandJ on 2018/5/22.
//  Copyright © 2018年 DandJ. All rights reserved.
//

import UIKit

class BeforeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var items: Array<CellModel>!
    let maxItem = 50
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupItems()
    }
    
    func setupItems() {
        items = []
        for index in 1...maxItem {
            var cellModel = CellModel()
            var imgIndex = index % 8
            if(imgIndex == 0) {
                imgIndex = 8
            }
            cellModel.mainImgName = "main_before_\(imgIndex)"
            cellModel.title = "这里显示的是优化前title_\(index)"
            cellModel.smallImagName = "small_before_\(imgIndex)"
            cellModel.name = "DandJ"
            
            items.append(cellModel)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeforeTableViewCell") as? BeforeTableViewCell
        
        cell?.selectionStyle = .none
        cell?.updateWithModel(cellModel: items[indexPath.row])
        
        return cell!
    }
}
