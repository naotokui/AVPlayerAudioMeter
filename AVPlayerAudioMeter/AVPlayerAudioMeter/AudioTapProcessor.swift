//
//  AudioTapProcessor.swift
//  AVPlayerAudioMeter
//
//  Created by Nao Tokui on 10/13/14.
//  Copyright (c) 2014 NT. All rights reserved.
//

import Foundation
import AVFoundation

class AudioTapProcessor {
    let audioAssetTrack : AVAssetTrack?
    var _audioMix: AVAudioMix?
    
    convenience init(playerItem:AVPlayerItem){
        if let tracks:[AVPlayerItemTrack] = playerItem.tracks as? [AVPlayerItemTrack] {
            for track:AVPlayerItemTrack! in tracks {
                if track.assetTrack.mediaType == AVMediaTypeAudio {
                    self.init(audioAssetTrack: track.assetTrack)
                    return
                }
            }
        }
        self.init(audioAssetTrack: nil)
    }
    
    init(audioAssetTrack: AVAssetTrack?){
        self.audioAssetTrack = audioAssetTrack
        
    }
    
    var audioMix: AVAudioMix?  {
        if _audioMix != nil {
            return _audioMix
        }
        if audioAssetTrack == nil {
            return nil
        }
            
        _audioMix = AVMutableAudioMix()
//        let audioMixInputParameters = AVMutableAudioMixInputParameters(track: audioAssetTrack) as AVMutableAudioMixInputParameters?
//        if audioMixInputParameters != nil {
//            var callbacks : MTAudioProcessingTapCallbacks
//                    
//            callbacks.version       = kMTAudioProcessingTapCallbacksVersion_0 as Int32
//            callbacks.clientInfo    = self;
//            callbacks.init          = tap_InitCallback
//            callbacks.finalize      = tap_FinalizeCallback
//            callbacks.prepare       = tap_PrepareCallback as MTAudioProcessingTapPrepareCallback
//            callbacks.unprepare     = tap_UnprepareCallback
//            callbacks.process       = tap_ProcessCallback
//        }
    
        return _audioMix
    }
}
