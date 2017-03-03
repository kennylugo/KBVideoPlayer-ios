//
//  VideoPlayerViewController.swift
//  VideoCamera
//
//  Created by Kenny Batista on 2/21/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit
import AVFoundation

public class KBVideoPlayerViewController: UIViewController {
    
//[Principium: Media playback properties]
    //url to get media from, media could either be on a remote server or locally
    var url: URL!
    
    // On initialization, it will instantiate the url into an AV asset
    var asset: AVURLAsset!
    
    // On initialization, it will convert the asset into a PlayerItem that can be passed to an AVPlayer for playback
    var item: AVPlayerItem!
    
    // player, will playback media when specified
    var player: AVPlayer!
    
    //player layer, used to modify attributes such as corner radius
    var playerLayer: AVPlayerLayer!
    
    // This view will contain the layer ( which displays the media ) that receives the output from the player
    @IBOutlet weak var videoProgressContainerView: UIView!
    
    
    @IBOutlet weak var VideoPlayerView: UIView!
//[Finis: Media playback properties]
    
    
    
    
    
    
//[Principium: Time properties]
    // Will contain the media's playback remaining time
    var timeObserver: AnyObject!

    // Will display the remaining time when instantiated
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    // This progress view will display the current elapsed time
    @IBOutlet weak var progressView: UIProgressView!
//[Finis: Time/Progress properties]
    
    
    

    
    
//[Principium: Playback controls properties/methods]
    
    // The following three outlets below are used to bring the subviews above the player layer
    @IBOutlet weak var backwardsButtonOutlet: UIButton!
    
    @IBOutlet weak var playOrPauseButtonOutlet: UIButton!
    
    @IBOutlet weak var forwardButtonOutlet: UIButton!
    
    // Will allow the compiler to decide wether to play or pause the media when play/pause button is tapped
    var playPauseBool: Bool!
// -------------------------------------------
    
    // Goes back 5 seconds in media when tapped
    @IBAction func seekFiveSecondsBackwardButton(_ sender: Any) {
        seekBackward()
    }
    
    // Pauses/Plays media when tapped
    @IBAction func playOrPauseButton(_ sender: Any) {
        pauseOrPlay()
    }
    
    
    
    // Goes forward 5 seconds in media when tapped
    @IBAction func seekFiveSecondsForwardButton(_ sender: Any) {
        seekForward()
    }
    
    
//[Finis: Playback controls properties/methods]
   
    
    
 
    // Initialize objects
    public init(urlToPlayMediaFrom: URL){
        self.url = URL(string: String(describing: urlToPlayMediaFrom))
        self.asset = AVURLAsset(url: url)
        self.item = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: item)
        self.playerLayer = AVPlayerLayer(player: player)
        
        // We use the bundle to locate the file
        let podBundle = Bundle(for: KBVideoPlayerViewController.self)
        let bundleURL = podBundle.url(forResource: "KBVideoPlayer", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)!
        
        super.init(nibName: "KBVideoPlayerView", bundle: bundle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//[Principium: Loading views method/properties]
    public override func viewDidLoad() {
        super.viewDidLoad()
        //Run the load view method
        loadView()
        
        // Play media once view loads to memory
        player.play()
        // We set the bool to false, so that when we tap on the pause/play button the compiler decides
        playPauseBool = false
        
        
        // This property will be used to elapse time by second
        let timeInterval: CMTime = CMTimeMakeWithSeconds(1.0, 10)
        
        // We use an observer to watch playback seconds
        timeObserver = player.addPeriodicTimeObserver(forInterval: timeInterval, queue: DispatchQueue.main, using: {
            elapsedTime in
            // We print the elapsed time
            print("elapsedTime now", CMTimeGetSeconds(elapsedTime))
            // We pass the elapsed seconds to the observer method, which we'll use to update time remaining labels/ progress
            self.observeTime(elapsedTime: elapsedTime)
        }) as AnyObject!
    }
    
    
    
    public override func loadView() {
        super.loadView()
        
        // This view will contain the playing video layer
        VideoPlayerView.layer.addSublayer(playerLayer)
        // We make it's background color clear so that we only display
        VideoPlayerView.backgroundColor = UIColor.clear
        
        // Set video player properties
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.frame = VideoPlayerView.bounds
        playerLayer.backgroundColor = UIColor.clear.cgColor
        playerLayer.cornerRadius = 10
        playerLayer.masksToBounds = true
        
        // Add UI objects to the subview
        VideoPlayerView.addSubview(timeRemainingLabel)
        VideoPlayerView.addSubview(forwardButtonOutlet)
        VideoPlayerView.addSubview(backwardsButtonOutlet)
        VideoPlayerView.addSubview(playOrPauseButtonOutlet)
        VideoPlayerView.addSubview(videoProgressContainerView)
        videoProgressContainerView.layer.cornerRadius = 7
        videoProgressContainerView.addSubview(progressView)
        
        //Shadows
        VideoPlayerView.layer.shadowColor = UIColor.black.cgColor
        VideoPlayerView.layer.shadowOpacity = 0.7
        VideoPlayerView.layer.shadowOffset = CGSize.zero
        VideoPlayerView.layer.shadowRadius = 5

    }
//[Finis: Loading views method/properties]
    
    
    
    
//[Principium: Time obeserving/updating method/properties]
     func observeTime(elapsedTime: CMTime) {
        // Media duration
        let duration = CMTimeGetSeconds((player.currentItem?.duration)!)
        
        // Turn the CMTime passed in into seconds
        let elapsedTime = CMTimeGetSeconds(elapsedTime)
        
        // Update time label
        updateTimeLabel(elapsedTime: elapsedTime, duration: duration)
        
        // Track progresss on the progress view
        progressView.progress = Float(elapsedTime / duration)
        
    }
    
     func updateTimeLabel(elapsedTime: Float64, duration: Float64) {
        //        let timeRemaining: Float64 = CMTimeGetSeconds(player.currentItem!.duration) - elapsedTime
        let currentTime = CMTimeGetSeconds((player.currentItem?.currentTime())!)
        timeRemainingLabel.text = String(format: "%02d:%02d", ((lround(currentTime) / 60) % 60), lround(currentTime) % 60)
        
    }
//[Finis: Time obeserving/updating method/properties]

//[Principium: Playback controls method/properties]
     func currentPlayBackTime() -> CMTime {
        return (player.currentItem?.currentTime())!
    }
    
     func seekForward(){
        print(#function)
        
        let preSubtractedCurrentTime = CMTimeGetSeconds((player.currentItem?.currentTime())!)
        let subtractedTime = preSubtractedCurrentTime + 5.0
        let convertedSubtractedTime = CMTimeMakeWithSeconds(subtractedTime, 1)
        self.player.seek(to: convertedSubtractedTime)
    }
    
     func seekBackward(){
        print(#function)
        
        let preSubtractedCurrentTime = CMTimeGetSeconds((player.currentItem?.currentTime())!)
        let subtractedTime = preSubtractedCurrentTime - 5.0
        let convertedSubtractedTime = CMTimeMakeWithSeconds(subtractedTime, 1)
        self.player.seek(to: convertedSubtractedTime)
    }
    
     func pauseOrPlay(){
        print(#function)
        if playPauseBool == false {
            playPauseBool = true
            playOrPauseButtonOutlet.setImage(UIImage(named: "Play.png"), for: .normal)
            player.pause()
        } else if playPauseBool == true {
            playPauseBool = false
            playOrPauseButtonOutlet.setImage(UIImage(named: "Pause.png"), for: .normal)
            player.play()
        }
    }
//[Finis: Playback controls method/properties]
}
