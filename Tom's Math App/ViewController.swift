//
//  ViewController.swift
//  Tom's Math App
//
//  Created by David Brunow on 7/23/15.
//  Copyright (c) 2015 ShepherdDog. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var tv: UITextView!
    @IBOutlet weak var showProblemsButton: UIButton!
    
    
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageView = UIImageView(image: UIImage(named: "texas"))
        imageView.frame = CGRectMake(tv.bounds.width / 2 - 50, 0, 200, 200)
        /*
        var showProblemsButton = UIButton(frame: CGRectMake(CGFloat(0), CGFloat(0), CGFloat(100), view.bounds.height - 50))
        
        showProblemsButton.setTitle("Show Problems", forState: UIControlState.Normal)
        
        view.addSubview(showProblemsButton)
        */
        //tv.addSubview(imageView)
        
        
        //showProblemsButton.addTarget(self, action: "showProblems", forControlEvents: UIControlEvents.TouchUpInside)
        //self.tv.hidden = true
        self.tv.attributedText = createAttributedText()
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        println("I'm disappearing!")
    }
    
    func showProblems()
    {
        appDelegate.problemViewController = ProblemViewController()
        
        presentViewController(appDelegate.problemViewController!, animated: true, completion: nil)
    }
    
    func createAttributedText() -> NSMutableAttributedString
    {
        var content : NSMutableAttributedString!
        // set up first paragraph string with attributes
        let s1 = "\nLanguage communicates ideas. " + "Arithmetric and its extension Algebra are languages that communicate ideas about Numbers."
        content = NSMutableAttributedString(string: s1, attributes: [NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 15)!, NSForegroundColorAttributeName: UIColor(red: 0.251, green: 0.000, blue: 0.520, alpha: 1.0)])
        // paragraph attributes and style for first paragraph
        
        let para = NSMutableParagraphStyle()
        para.headIndent = 10
        para.firstLineHeadIndent = 10
        para.tailIndent = -10
        para.lineBreakMode = .ByWordWrapping
        para.alignment = .Center
        para.paragraphSpacing = 15
        
        content.addAttribute(
            NSParagraphStyleAttributeName,
            value:para, range:NSRange(location: 1,length: 1))
        // set up second paragraph string with attributes and add second paragraph style
        
        let problemEquation = appDelegate.problems.first!.generateQuestion()
        let problemAnswer = appDelegate.problems.first!.answer
        
        var content2 : NSMutableAttributedString!
        let s2 = "Algebra is a simple language with a vocabulary, symbols, and grammer that extends the symbols and rules of Arithmetric." +
            "The symbols in algebra are abbreviations for words, similar to the symbols on Twitter - a language every teenager can tweet in their sleep." +
            "\n\nThe sum of two and three is five. " +
            "\n             2  +  3  =  5" +
            "\nThe difference in five and three is two. " +
        "\n             5  -  3  =  2" + "\nHere is the generated equation: \(problemEquation) = \(problemAnswer)"
        content2 = NSMutableAttributedString(string: s2, attributes: [
            NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
            ] )
        
        /*content2.addAttributes([
            NSFontAttributeName: UIFont(name:"HoeflerText-Black", size: 24)! ,
            NSExpansionAttributeName: 0.3,
            NSKernAttributeName: -4
            ], range:NSMakeRange(0,1))
        */
        let para2 = NSMutableParagraphStyle()
        para2.headIndent = 10
        para2.firstLineHeadIndent = 10
        para2.tailIndent = -10
        para2.lineBreakMode = .ByWordWrapping
        para2.alignment = .Justified
        para2.paragraphSpacing = 15
        // combine paragraph one and two into single string
        
        let end = content.length
        content.replaceCharactersInRange(NSMakeRange(end,0),withString:"\n")
        content.appendAttributedString(content2)
        
        return content
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

