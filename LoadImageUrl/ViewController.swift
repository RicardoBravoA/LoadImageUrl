//
//  ViewController.swift
//  LoadImageUrl
//
//  Created by Ricardo Bravo Acuña on 16/06/16.
//  Copyright © 2016 Ricardo Bravo Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "https://i.imgur.com/GTtxYVu.png")
        let urlRequest = NSURLRequest(URL: url!)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest) { (data, response, error) in
            if error != nil {
                print("Error al descargar la imagen")
            }else{
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let imageData = UIImage(data: data!)
                    self.image.image = imageData
                })
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

