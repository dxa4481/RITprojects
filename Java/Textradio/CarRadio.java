/**
 * HelloWorld.java
 *
 * File:
 *	$Id: CarRadio.java,v 1.1 2013/03/20 01:42:04 dxa4481 Exp $
 *
 * Revisions:
 *	$Log: CarRadio.java,v $
 *	Revision 1.1  2013/03/20 01:42:04  dxa4481
 *	COMMIIIITTTTTTTTTT
 *
 */

/**
 * This is a car radio. It like, runs like a radio does or something.
 * Here are some more words.
 *
 * @author <<<DYlan Ayrey>>>
 */


import java.util.ArrayList;


public class CarRadio {

	/**
	 * @param args
	 */
	public static final int MIN_VOLUME=0;
	public static final int MAX_VOLUME=20;
	
	private StationData stationdata;
	private int volume;
	private boolean mute;
	private boolean am;
	//true means it's set to am
	private int amfrequency;
	private int fmfrequency;
	private FreqBand amFreqBand = FreqBand.AM;
	private FreqBand fmFreqBand = FreqBand.FM;
	private FreqBand current;
	private boolean power;
	private int setting;
	//0 is unprepared 1 is ready to set 1 2 is ready to set 2
	
	private int[] set1AM = new int[5];
	private int[] set2AM = new int[5];
	private int[] set1FM = new int[5];
	private int[] set2FM = new int[5];


/**
 * 
 * @param stationData
 * this is just hte constructor
 */
	public CarRadio(StationData stationData)
	{
		current=amFreqBand;
		volume=0;
		mute=false;
		am=true;
		amfrequency=520;
		fmfrequency=87900;
		power=false;
		setting=0;
		this.stationdata=stationData;
		
		for (int i=0;i<5;i++){
			set1AM[i]=520;
			set2AM[i]=520;
		}//endfor
		for (int i=0;i<5;i++){
			set1FM[i]=87900;
			set2FM[i]=87900;
		}//endfor										
		
	}//endconstructor
	/**
	 * this turns am or fm on represented by boolean
	 */
	public void amfmBtn() 
	{
		if (power==true)
		{
		am=!am;
		setting=0;
		if (current==amFreqBand)
		{
			current=fmFreqBand;
		}//endif
		else{
			current=amFreqBand;
		}//endif
		}
	}//endamfmbtn
	/**
	 * this is the display function that returns an array of strings
	 */	
	public java.util.ArrayList<java.lang.String> display()
	{
		ArrayList<String>  collection = new ArrayList<String>();
		if(!power){
			collection.add("---------------------");
			collection.add("|                   |");
			collection.add("---------------------");
		}//endif
		else{
			collection.add("---------------------");
			String amfm;
			float currentfreq;
			int othercur;
			if (am==true){
				amfm="AM";
				currentfreq=amfrequency;
				othercur=amfrequency;
			}//endif
			else{
				amfm="FM";
				currentfreq=(float)fmfrequency/1000;
				othercur=fmfrequency;
			}//endelse
			String stationname;
			if (stationdata.lookupFreq(current, othercur) != null){
				stationname=stationdata.lookupFreq(current, othercur);
			}//endif
			else{
				stationname="****";
			}//endelse
			String ospacer;
			if (am==true){
				if (othercur<1000){
				ospacer="  ";
				}//endif
				else{
					ospacer=" ";
				}//endelse
			}//endif
			else{
				ospacer="   ";
			}//endelse
			String output="|  "+amfm+ospacer+currentfreq+"  "+stationname+"  |";
			collection.add(output);
			String vol;
			if (mute){
				vol="--";
			}//endif
			else{
				vol=volume+"";
			}//endelse
			String bla;
			if (setting==0){
				bla="    ";
			}//endif
			else if(setting==1){
				bla="set1";
			}//endelseif
			else{
				bla="set2";
			}//endelse
			String spacer;
			if (volume<10 && mute==false){
				spacer="  ";
			}//endif
			else if (mute==true){
				spacer=" ";
			}//endelseif
			else{
				spacer=" ";
				
			}//endelse
			String output2="|  "+"Vol:"+spacer+vol+"    "+bla+"  |";
			collection.add(output2);
			collection.add("---------------------");
			
		}//endelse
		return collection;
	}//enddisplay	
	/**
	 * toggles mute, stored as boolean
	 */
	public void muteBtn() 
	{
		if(power==true){
			mute= !mute;
		}
	}//endmuteBtn
	/**
	 * toggles power, stored as boolean, turns setting to unset
	 */
	public void powerBtn() 
	{
		power=!power;
		setting=0;
	}//endpowerBtn
	/**
	 * This does all the setting stuff, calls the setting function down below, look down thar!
	 */
	public void preset1Btn() 
	{
		preset(0);
	}//endpreset1Btn	
	/**
	 * This does all the setting stuff, calls the setting function down below, look down thar!
	 */
	public void preset2Btn() 
	{
		preset(1);
	}//endpreset2Btn
	/**
	 * This does all the setting stuff, calls the setting function down below, look down thar!
	 */
	public void preset3Btn() 
	{
		preset(2);
	}//endpreset3Btn	
	/**
	 * This does all the setting stuff, calls the setting function down below, look down thar!
	 */
	public void preset4Btn() 
	{
		preset(3);
	}//endpreset4Btn	
	/**
	 * This does all the setting stuff, calls the setting function down below, look down thar!
	 */
	public void preset5Btn() 
	{
		preset(4);
	}//endpreset5Btn	
	/**
	 * Goes down until a station is found
	 */
	public void seekDownBtn() 
	{
		if (power){
		setting=0;
		int currFreq;
		tuneDownBtn();
		if (am){
			currFreq=amfrequency;
		}//endif
		else{
			currFreq=fmfrequency;
		}//endif
		int primefreq=currFreq;
		while(stationdata.lookupFreq(current, currFreq) == null)
		{
			tuneDownBtn();
			if (am){
				currFreq=amfrequency;
			}//endif
			else{
				currFreq=fmfrequency;
			}//endif
			if (primefreq==currFreq){
				break;
			}//endif
		}//endwhile
		}//endif
	}//endseekDownBtn	
	/**
	 * Goes up until a station is found
	 */
	public void seekUpBtn() 
	{
		if(power){
		setting=0;
		int currFreq;
		
		tuneUpBtn();
		if (am){
			currFreq=amfrequency;
		}//endif
		else{
			currFreq=fmfrequency;
		}//endif
		int primefreq=currFreq;
		while(stationdata.lookupFreq(current, currFreq) == null)
		{
			tuneUpBtn();
			if (am){
				currFreq=amfrequency;
			}//endif
			else{
				currFreq=fmfrequency;
			}//endif
			if (primefreq==currFreq){
				break;
			}//endif
		}//endwhile
		}//endif
	}//endseekUpBtn	
	/**
	 * Toggles set for the urm... preset stuff
	 */
	public void setBtn() 
	{
		if(power == true){
			setting++;
			if (setting ==3){
				setting=0;
			}//endif
		}//endif
	}//endsetBtn	
	/**
	 * decrements AM by 10 and FM by 200
	 */
	public void tuneDownBtn() 
	{
		if (am==true && power==true){
			setting=0;
			amfrequency-=10;
			if (amfrequency < amFreqBand.minFreq()){
				amfrequency=1610;
			}//endif
		}//endif
		if (am==false && power==true){
			setting=0;
			fmfrequency-=200;
			if (fmfrequency < fmFreqBand.minFreq()){
				fmfrequency=107900;
			}//endif
		}//endif		
	}//endtuneDownBtn	
	/**
	 * Increments AM by 10 and FM by 200
	 */
	public void tuneUpBtn() 
	{
		if (am==true && power==true){
			setting=0;
			amfrequency+=10;
			if (amfrequency > amFreqBand.maxFreq()){
				amfrequency=520;
			}//endif
		}//endif
		if (am==false && power==true){
			setting=0;
			fmfrequency+=200;
			if (fmfrequency > fmFreqBand.maxFreq()){
				fmfrequency=87900;
			}//endif
		}//endif
	}//endtuneUpBtn
	/**
	 * Here's all the preset buttons and stuff. uses arrays. 4 arrays per preset button, primary secondary
	 * and am and fm
	 */
	public void preset(int i)
	{
		if(power==true){
			if(setting==0)
			{
				setting=0;
				if(am==true)
				{
					if(set1AM[i]==amfrequency){
						amfrequency=set2AM[i];
					}//endif
					else{
						amfrequency=set1AM[i];
					}//endelse
				}//endif
				else{
					if(set1FM[i]==fmfrequency){
						fmfrequency=set2FM[i];
					}//endif
					else{
						fmfrequency=set1FM[i];
					}//endelse					
				}//endelse
			}//endif
			else if(setting==1){
				setting=0;
				if (am==true){
					set1AM[i]=amfrequency;
				}//endif
				else{
					set1FM[i]=fmfrequency;
				}//endelse
			}//endelseif
			else{
				setting=0;
				if (am==true){
					set2AM[i]=amfrequency;
				}//endif
				else{
					set2FM[i]=fmfrequency;
				}//endelse				
			}//endelse
		}//endif		
	}//endpreset
	/**
	 * Increments volume by 1, cannot exceed 20
	 */
	public void volumeDownBtn() 
	{
		if (power=true)
		{
			if (volume!=0)
				{
					volume--;
				}//endif
		}//endif
	}//endvolumeDownBtn
	/**
	 * Decrements volume by 1 cannot go below 0
	 */
	public void volumeUpBtn() 
	{
		if (power=true)
		{
			if (volume!=20)
				{
					volume++;
				}//endif
		}//endif
	}//endvolumeUpBtn
		
	

	/**
	 * NOT USED. I DIDN'T EVEN USE THIS. PLEASE DON'T TAKE POINTS OFF.
	 */
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
			
	}

}
