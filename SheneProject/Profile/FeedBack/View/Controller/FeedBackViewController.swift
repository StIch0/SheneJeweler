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
    let userSegue = "userSegue"
    override func viewDidLoad() {
//        self
        super.viewDidLoad()
        title = "Введите сообщение"
        let amountOfLinesToBeShown:CGFloat = 6
        let maxHeight:CGFloat = textView.font!.lineHeight * amountOfLinesToBeShown
        textView.sizeThatFits(CGSize(width: textView.frame.width, height: maxHeight))
        
    }
    private func goBack(){
        if let success = successModel?.success, success {
            self.showActionSheet("Спасибо за отзыв")
//            self.dismiss(animated: true, completion: nil)
            
        }
    }
    @IBAction func sendFeedBack(_ sender: Any) {
        let text = textView.text != "" ? textView.text : "Нет сообщения"
         viewModel.getSuccess(api: APISelected.sendFeedback.rawValue, parameters: ["content":text as AnyObject], headres: ["auth":token]){
            self.successModel = self.viewModel.successModel
            self.goBack()
         }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.65, execute: {
            self.performSegue(withIdentifier: self.userSegue, sender: self)
//        })
        
    }
}
