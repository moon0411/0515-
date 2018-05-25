//
//  ViewController.swift
//  Qna
//
//  Created by 李沐軒 on 2018/5/20.
//  Copyright © 2018 李沐軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var questions = [Question]()
    var grade = 0
    var questionNumber = 0
    
    
    @IBAction func replayButtonPressed(_ sender: Any) {
        gradeView.isHidden = true
        grade = 0
        questionNumber = 0
        updateUI()
    }
    
    
    
        func updateUI() {
            let newQuestion = questions[questionNumber]
            questionLabel.text = newQuestion.description
            var i = 0
            for label in choiceLabels {
                label.text = newQuestion.choices[i]
                i = i + 1
        }
    }
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        let question = questions[questionNumber]
        let number = sender.tag
        if question.choices[number] == question.answer {
            grade = grade + 10
        }
        gradeLabel.text = "\(grade)"
        questionNumber = questionNumber + 1
        if questionNumber == questions.count {
            gradeView.isHidden = false
        } else {
            updateUI()
        }
        }
    
    
    
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet var choiceLabels: [UILabel]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var gradeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradeView.isHidden = true
        
        let question1 = Question(description: "唐伯虎的家傳絕學？", answer: "唐家霸王槍", choices: ["鬼影擒拿手", "唐家霸王槍", "書生奪命劍"])
        questions.append(question1)
        let question2 = Question(description: "紫霞在至尊寶心裡留下什麼東西?", answer: "一滴眼淚", choices: ["九把刀", "999玫瑰", "一滴眼淚"])
        questions.append(question2)
        let question3 = Question(description: "何金銀出了什麼絕招打敗斷水流大師兄?", answer: "隔山打牛", choices: ["隔山打牛", "無敵風火輪", "一定要靠眼神"])
        questions.append(question3)
        
        
        questionLabel.text = question1.description
        
         /*  內容等同下方for迴圈
        choiceLabels[0].text = questions[0].choices[0]
        choiceLabels[1].text = questions[0].choices[1]
        choiceLabels[2].text = questions[0].choices[2]
        */
        
         var i = 0
         for label in choiceLabels {
             label.text = question1.choices[i]
             i = i + 1
         }
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

