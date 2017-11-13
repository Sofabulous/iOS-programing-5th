//
//  ViewController.swift
//  Quiz
//
//  Created by yukun on 2017/10/5.
//  Copyright © 2017年 SouthWest University-yukun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLable:UILabel!
    @IBOutlet var answerLable:UILabel!
    //model对象
    let questions:[String] = ["cognac（白兰地）由什么制成？","绝对零度是指多少摄氏度？","Vermont（佛蒙特州）的首府是哪里？"]
    let answers:[String] = ["葡萄","-273ºC","(Montpelier)蒙彼利埃"]
    var currentQuestionIndex = 0
    @IBAction func showNextQuestion(sender:AnyObject){
        currentQuestionIndex += 1
        currentQuestionIndex %= questions.count
        let question:String = questions[currentQuestionIndex]
        questionLable.text = question
        answerLable.text = "???"
    }
    @IBAction func showAnswer(sender:AnyObject){
        let answer:String = answers[currentQuestionIndex]
        answerLable.text = answer
    }
    override func viewDidLoad() {
            super.viewDidLoad()
            questionLable.text = questions[currentQuestionIndex]
    }
}

