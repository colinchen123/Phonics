package com.topmind.common
{
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.media.Microphone;
import flash.utils.ByteArray;

import org.as3wavsound.WavSound;
import org.as3wavsound.WavSoundChannel;
import org.bytearray.micrecorder.MicRecorder;
import org.bytearray.micrecorder.encoder.WaveEncoder;
[Event(name="soundComplete", type="flash.events.Event")]
public class Recorder extends EventDispatcher
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
    private var channel:WavSoundChannel;
    
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
        if (micRecorder)
        {
            micRecorder.stop();
            out = micRecorder.output;
        }
    }
    
    public function stopPlay():void{
        if (channel){
            channel.removeEventListener(Event.SOUND_COMPLETE, channel_completeHandler);
            channel.stop();
            channel = null;
        }
    }
    
    public function replay():void{
        stopPlay();
        if (out != null)
        {
            var sound:WavSound = new WavSound(out);
            channel = sound.play();
            channel.addEventListener(Event.SOUND_COMPLETE, channel_completeHandler);
        }else{
            dispatchEvent(new Event(Event.SOUND_COMPLETE));
        }
    }
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function channel_completeHandler(event:Event):void{
        dispatchEvent(event.clone());
    }
}
}