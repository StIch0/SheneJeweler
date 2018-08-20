//
//  DetailNewsViewController.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class DetailNewsViewController: UIViewController {
    
    @IBOutlet weak var caption : UILabel!
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var content : UITextView!
    weak var detailViewModel : DetailViewModel!
    var scrollView : UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(detailViewModel: detailViewModel)
    }
    private func loadData(detailViewModel : DetailViewModel){
        print("\(detailViewModel.img)")
        guard let url = detailViewModel.img else { return }
        caption.text = detailViewModel.caption
        img.sd_setImage(with: URL(string : "\(API_BASE_URL)/\(url)"))
        content.text = detailViewModel.content
    }
}
