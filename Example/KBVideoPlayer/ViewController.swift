//
//  ViewController.swift
//  KBVideoPlayer
//
//  Created by kennybatista on 02/28/2017.
//  Copyright (c) 2017 kennybatista. All rights reserved.
//

import UIKit
import KBVideoPlayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func PlayVideo(_ sender: Any) {
        let linkToVideo = URL(string: "https://goo.gl/qLRdBp")
        let videoPlayer = KBVideoPlayerViewController(urlToPlayMediaFrom: linkToVideo!)
        self.present(videoPlayer, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

