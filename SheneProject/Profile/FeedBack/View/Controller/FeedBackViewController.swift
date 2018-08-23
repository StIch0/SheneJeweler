//
//  FeedBackViewController.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 22/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
class FeedBackViewController : UIViewController {
    var successModel : SuccessModel?
    var viewModel = FeedBackViewModel()
    var token : String = ""
    @IBOutlet weak var textView : UITextView!
//    let userSegue = "userSegue"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Введите сообщение"
        let amountOfLinesToBeShown:CGFloat = 6
        let maxHeight:CGFloat = textView.font!.lineHeight * amountOfLinesToBeShown
        textView.sizeThatFits(CGSize(width: textView.frame.width, height: maxHeight))
        
    }
    @IBAction func sendFeedBack(_ sender: Any) {
        let text = textView.text != "" ? textView.text : "Нет сообщения"
         viewModel.getSuccess(api: APISelected.sendFeedback.rawValue, parameters: ["content":text as AnyObject], headres: ["auth":token],{
            self.successModel = self.viewModel.successModel
            if let success = self.successModel?.success, success {
                self.showActionSheet("Спасибо за отзыв")
            }
         },{
            error in
            self.showActionSheet(error)
         })
//            self.performSegue(withIdentifier: self.userSegue, sender: self)
        
    }
}
