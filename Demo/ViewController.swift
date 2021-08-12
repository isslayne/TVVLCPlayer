//
//  ViewController.swift
//  Demo
//
//  Created by Jérémy Marchand on 03/03/2018.
//  Copyright © 2018 Jérémy Marchand. All rights reserved.
//

import UIKit
import TVVLCPlayer
import TVVLCKit

class ViewController: UIViewController {
    let demoVideoURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/88/Big_Buck_Bunny_alt.webm")!
//    let demoVideoURL = URL(string: "http://39.135.53.199/ott.fj.chinamobile.com/PLTV/88888888/224/3221226998/index.m3u8")!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let playerVC = segue.destination as? VLCPlayerViewController {
            let player = VLCMediaPlayer()
            player.media = VLCMedia(url: demoVideoURL)
            playerVC.player = player
        }
    }
}
