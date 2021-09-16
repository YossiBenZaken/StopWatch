//
//  ViewController.swift
//  StopWatch
//
//  Created by Yosef Ben Zaken on 16/09/2021.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBAction func startTimer(_ sender: Any) {
        if(isPlaying){
            return
        }
        startBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    @IBAction func pauseTimer(_ sender: Any) {
        startBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    @IBAction func resetTimer(_ sender: Any) {
        startBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timerLabel.text = String(counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = String(counter)
        pauseBtn.isEnabled = false;
    }
    @objc func UpdateTimer() {
        counter += 0.1
        timerLabel.text = String(format: "%.1f", counter)
    }
    
}

