package com.topmind.common
{
import flash.media.Microphone;
import flash.utils.ByteArray;

import org.as3wavsound.WavSound;
import org.bytearray.micrecorder.MicRecorder;
import org.bytearray.micrecorder.encoder.WaveEncoder;

public class Recorder
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>Recorder</code>实例.
     *
     */
    public function Recorder()
    {
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var micRecorder:MicRecorder;
    private var mic:Microphone;
    private var out:ByteArray;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function record():void{
        if (micRecorder == null){
            mic = Microphone.getMicrophone();
            micRecorder = new MicRecorder(new WaveEncoder(), mic);
        }
        micRecorder.record();
    }
    
    public function stop():void{
        micRecorder.stop();
        out = micRecorder.output;
    }
    
    public function replay():void{
        var sound:WavSound = new WavSound(out);
        sound.play();
    }
}
}