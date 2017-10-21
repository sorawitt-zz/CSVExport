//
//  ViewController.swift
//  CsvEx
//
//  Created by Sorawit on 10/21/17.
//  Copyright © 2017 Sorawit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var posts = [Post]()
    var post: Post!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        post = Post()
        post.name = "Sorawit"
        post.school = "NU"
        post.gpa = 4.00
        
        posts.append(post)
        
        post = Post()
        post.name = "Sorawit"
        post.school = "CU"
        post.gpa = 5.00
        posts.append(post)
        
        post = Post()
        post.name = "Sorawit"
        post.school = "MOU"
        post.gpa = 6.00
        posts.append(post)
   
    }

    
    @IBAction func export() {
        
        let fileName = "Tasks.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)


        var csvText = "Name,School,GPA\n"

        for task in posts {
            let newLine = "\(task.name),\(task.school),\(task.gpa)\n"
            csvText.append(newLine)
        }
        
            do {
               try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
                let activityViewController = UIActivityViewController(activityItems: [path], applicationActivities: nil)
        
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
                
                // exclude some activity types from the list (optional)
                activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
                
                // present the view controller
                self.present(activityViewController, animated: true, completion: nil)
                
            } catch {

                print("Failed to create file")
                print("\(error)")
            }
      
    }
}

