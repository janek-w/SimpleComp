Processor 
Type SynthChain ID SimpleComp Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script �
Content.makeFrontInterface(500, 370);


const var GainReduction = Content.getComponent("GainReduction");

const var Dynamics1 = Synth.getEffect("Dynamics1");



const var t = Engine.createTimerObject();
t.setTimerCallback(function()
{
	var v = Dynamics1.getAttribute(Dynamics1.CompressorReduction);
	
	v = Engine.getDecibelsForGainFactor(v);
	
	GainReduction.setValue(v);
});

t.startTimer(30);

const var SimpleGain2 = Synth.getEffect("Simple Gain2");
const var SimpleGain1 = Synth.getEffect("Simple Gain1");

const var OutputMeter1 = Content.getComponent("OutputMeter1");
const var OutputMeter2 = Content.getComponent("OutputMeter2");

const var InputMeterLeft = Content.getComponent("InputMeterLeft");
const var InputMeterRight = Content.getComponent("InputMeterRight");



const var x = Engine.createTimerObject();
x.setTimerCallback(function()
{
	var w = SimpleGain2.getCurrentLevel(true);
	w = Engine.getDecibelsForGainFactor(w);
	var left = SimpleGain2.getCurrentLevel(false);
	left = Engine.getDecibelsForGainFactor(left);
	
	OutputMeter1.setValue(w);
	OutputMeter2.setValue(left);
	
	var right1 = SimpleGain1.getCurrentLevel(true);
	right1 = Engine.getDecibelsForGainFactor(right1);
	var left1 = SimpleGain1.getCurrentLevel(false);
	left1 = Engine.getDecibelsForGainFactor(left1);
	
	InputMeterRight.setValue(left1);
	InputMeterLeft.setValue(right1);
});

x.startTimer(30);





const var Bypass = Content.getComponent("Bypass");
const var makeUp = Synth.getEffect("makeUp");

Content.getComponent("Bypass").setControlCallback(onScriptButton2Control);

inline function onBypassControl(component, value)
{
    SimpleGain1.setBypassed(value);
    Dynamics1.setBypassed(value);
    makeUp.setBypassed(value);
    SimpleGain2.setBypassed(value);
};

Content.getComponent("Bypass").setControlCallback(onBypassControl);

const var Info = Content.getComponent("Info");
const var about = Content.getComponent("about");
const var Closer = Content.getComponent("Closer");
const var white = Content.getComponent("white");


inline function onInfoControl(component, value)
{
    about.showControl(true);
    Closer.showControl(true);
    white.showControl(true);
};

Content.getComponent("Info").setControlCallback(onInfoControl);


inline function onCloserControl(component, value)
{
	about.showControl(false);
	Closer.showControl(false);
	white.showControl(false);
};

Content.getComponent("Closer").setControlCallback(onCloserControl);
function onNoteOn()
{
	
}
 function onNoteOff()
{
	
}
 function onController()
{
	
}
 function onTimer()
{
	
}
 function onControl(number, value)
{
	
}
  EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptSlider id Threshold value 	         Control type ScriptSlider id InputMeterLeft value 	      Y� Control type ScriptSlider id GainReduction value 	<��k�wL� Control type ScriptSlider id Ratio value 	      @ Control type ScriptSlider id attack value 	      �? Control type ScriptSlider id 	release value 	      I@ Control type ScriptSlider id InputMeterRight value 	      Y� Control type ScriptSlider id OutputMeter1 value 	      Y� Control type ScriptSlider id OutputMeter2 value 	      Y� Control type ScriptSlider id MakeupGain value 	         Control type ScriptSlider id 	OutGain value 	      �> Control type ScriptSlider id 
OutGain1 value 	   ���� Control type ScriptButton id Bypass value 	         Control type ScriptButton id Info value 	      �? Control type ScriptButton id Closer value 	         UIData  ContentProperties DeviceType 	Desktop Component type ScriptImage id bg x 	        y 	        width 	     @@height 	      w@fileName  {PROJECT_FOLDER}Background.png  Component type ScriptSlider id Threshold x 	      Y@y 	     @g@width 	      X@height 	     �W@filmstripImage {PROJECT_FOLDER}knobs.png numStrips 	      I@mode 	Decibel max 	        stepSize 	   ����?suffix  dB middlePosition 	      (�processorId Dynamics1 parameterId CompressorThreshold showValuePopup Below min 	      N� Component type ScriptSlider id InputMeterLeft x 	      J@y 	     �E@width 	      &@height 	     @o@filmstripImage {PROJECT_FOLDER}meter.png numStrips 	      I@showTextBox text left mode 	Decibel min 	      Y�max 	        stepSize 	   ����?suffix  dB middlePosition 	      2�enabled  Component type ScriptSlider id GainReduction x 	     �a@y 	     Ps@width 	     �k@height 	      ;@style Horizontal max 	        stepSize 	   ����?suffix  dB middlePosition 	      $�min 	      4�enabled itemColour 	>72�    bgColour 	��f�    itemColour2 	   N    showValuePopup Above  Component type ScriptSlider id Ratio x 	      i@y 	     @g@width 	     �W@height 	      X@filmstripImage {PROJECT_FOLDER}knobs.png numStrips 	      I@processorId Dynamics1 parameterId CompressorRatio middlePosition 	      @min 	      �?max 	      0@showValuePopup Below suffix  : 1 defaultValue 	      @stepSize 	   ����? Component type ScriptSlider id attack x 	     �b@y 	     �U@width 	     �X@height 	     @X@filmstripImage {PROJECT_FOLDER}knobs.png numStrips 	      I@mode Time max 	      Y@stepSize 	   ����?suffix  ms middlePosition 	      >@processorId Dynamics1 parameterId CompressorAttack showValuePopup Below defaultValue 	      �? Component type ScriptSlider id 	release x 	     @o@y 	     �U@width 	     �X@height 	     �W@filmstripImage {PROJECT_FOLDER}knobs.png numStrips 	      I@mode Time max 	     �r@stepSize 	   ����?suffix  ms middlePosition 	      Y@processorId Dynamics1 parameterId CompressorRelease showValuePopup Below defaultValue 	      I@ Component type ScriptSlider id InputMeterRight x 	     @P@y 	     �E@width 	      7@height 	     @p@filmstripImage {PROJECT_FOLDER}meter.png numStrips 	      I@showTextBox text right mode 	Decibel min 	      Y�max 	        stepSize 	   ����?suffix  dB middlePosition 	      2�enabled  Component type ScriptSlider id OutputMeter1 x 	     �z@y 	     �E@width 	      ,@height 	     �p@filmstripImage {PROJECT_FOLDER}meter.png numStrips 	      I@showTextBox text right mode 	Decibel min 	      Y�max 	        stepSize 	   ����?suffix  dB middlePosition 	      2�enabled  Component type ScriptSlider id OutputMeter2 x 	     P{@y 	     �E@width 	      ,@height 	     @p@filmstripImage {PROJECT_FOLDER}meter.png numStrips 	      I@showTextBox text right mode 	Decibel min 	      Y�max 	        stepSize 	   ����?suffix  dB middlePosition 	      2�enabled  Component type ScriptSlider id MakeupGain x 	     �r@y 	     @g@width 	     �W@height 	      X@filmstripImage {PROJECT_FOLDER}knobs.png numStrips 	      I@processorId makeUp parameterId Gain middlePosition 	      @stepSize 	   ����?max 	      2@mode 	Decibel showValuePopup Below  Component type ScriptSlider id 	OutGain x 	     �|@y 	     �E@stepSize 	   ����?filmstripImage {PROJECT_FOLDER}fader.png numStrips 	      ?@width 	      ?@height 	      p@dragDirection 
Vertical mouseSensitivity 	   ����?processorId Simple Gain2 parameterId Gain mode 	Decibel min 	      Y�max 	      (@middlePosition 	      4�showValuePopup Left  Component type ScriptSlider id 
OutGain1 x 	      0@y 	     �E@stepSize 	   ����?filmstripImage {PROJECT_FOLDER}fader.png numStrips 	      ?@width 	      ?@height 	      p@dragDirection 
Vertical mouseSensitivity 	   ����?mode 	Decibel min 	      Y�max 	      (@middlePosition 	      4�showValuePopup Right processorId Simple Gain1 parameterId Gain  Component type ScriptButton id Bypass x 	     `}@y 	     �u@width 	      4@height 	      4@filmstripImage *{PROJECT_FOLDER}eq gui on off.blend1.png scaleFactor 	   @33�? Component 	type ScriptImage id white x 	        y 	        width 	     @@height 	     �u@fileName {PROJECT_FOLDER}white.png alpha 	ffffff�?visible  Component type ScriptButton id Info x 	      $@y 	     �u@width 	      4@height 	      3@filmstripImage ({PROJECT_FOLDER}eq gui info.blend1.png scaleFactor 	   @33�? Component type ScriptImage id about x 	      I@y 	      *@width 	      y@height 	     �r@fileName  {PROJECT_FOLDER}about Page.png visible  Component 	type ScriptButton id Closer x 	      z@y 	      3@width    height     filmstripImage {PROJECT_FOLDER}closer.png scaleFactor 0.4 visible  Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 1 Solo 0 Folded 0  ChildProcessors  Processor Type SimpleGain ID Simple Gain1 Bypassed Gain 	   ����Delay 	        Width 	      Y@Balance 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type 
Dynamics ID Dynamics1 Bypassed GateEnabled 	        GateThreshold 	        GateAttack 	      �?GateRelease 	    \�b@CompressorEnabled 	      �?CompressorThreshold 	        CompressorRatio 	      @CompressorAttack 	      �?CompressorRelease 	      I@LimiterEnabled 	        LimiterThreshold 	        LimiterAttack 	      �?LimiterRelease 	      $@CompressorMakeup 	        LimiterMakeup 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SimpleGain ID makeUp Bypassed Gain 	        Delay 	        Width 	      Y@Balance 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SimpleGain ID Simple Gain2 Bypassed Gain 	   �,_�>Delay 	        Width 	      Y@Balance 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Noise ID Noise Generator1 Bypassed Gain 	   @�K�?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleEnvelope ID DefaultEnvelope1 Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	      @Release 	     ��@LinearMode 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name 	Macro 1 value 0 midi_cc -1  macro name 	Macro 2 value 0 midi_cc -1  macro name 	Macro 3 value 0 midi_cc -1  macro name 	Macro 4 value 0 midi_cc -1  macro name 	Macro 5 value 0 midi_cc -1  macro name 	Macro 6 value 0 midi_cc -1  macro name 	Macro 7 value 0 midi_cc -1  macro name 	Macro 8 value 0 midi_cc -1  MidiAutomation   MPEData Enabled  