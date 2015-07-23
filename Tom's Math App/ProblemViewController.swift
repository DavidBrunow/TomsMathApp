//
//  ProblemViewController.swift
//  Tom's Math App
//
//  Created by David Brunow on 7/23/15.
//  Copyright (c) 2015 ShepherdDog. All rights reserved.
//

import UIKit

class ProblemViewController: UIViewController
{
    
    @IBOutlet weak var problemLabelFromStoryboard: UILabel!
    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        var equationLabel = UILabel(frame: CGRectMake(CGFloat(0), CGFloat(0), self.view.bounds.width, CGFloat(200)))
        equationLabel.textAlignment = NSTextAlignment.Center
        if let problem = appDelegate.problems.first
        {
            equationLabel.text = problem.generateQuestion()
        }
        if let problem = appDelegate.problems.first
        {
            problemLabelFromStoryboard.text = problem.generateQuestion()
        }
        
        view.addSubview(equationLabel)
        
        println("here!")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) 
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
