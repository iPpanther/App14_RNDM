//
//  UpdateCommentVC.swift
//  RNDM
//
//  Created by Peerapol on 9/4/2562 BE.
//  Copyright © 2562 iPpanther. All rights reserved.
//

import UIKit
import Firebase

class UpdateCommentVC: UIViewController {

    @IBOutlet weak var commentTxt: UITextView!
    @IBOutlet weak var updateBtn: UIButton!
    
    var commentData: (comment: Comment, thought: Thought)! 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        commentTxt.layer.cornerRadius = 10
        updateBtn.layer.cornerRadius = 10
        
        commentTxt.text = commentData.comment.commentTxt
    }

    @IBAction func updateTapped(_ sender: Any) {
        Firestore.firestore().collection(THOUGHTS_REF).document(commentData.thought.documentId).collection(COMMENTS_REF).document(commentData.comment.documentId).updateData([COMMENT_TXT: commentTxt.text!])
        {
            (error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
