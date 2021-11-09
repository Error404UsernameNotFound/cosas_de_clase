package player;


import java.io.File;

import javazoom.jlgui.basicplayer.*;

public class MusicPlayer {
	private BasicPlayer basicPlayer = null;
	private double vol;
	private double volMax;
	

	private File cancionActual; //TODO Tener como atributo SIEMPRE la cancion actual, este sonando o no
								//TODO servira para controlar que al borrar una cancion no siga sonando, por ejemplo, o que empiece otra sola al acabar la primera
	
	public MusicPlayer(){
		basicPlayer = new BasicPlayer();
	}
	
	public double getVol() {
		return vol;
	}

	public void setVol(double vol) {
		this.vol = vol;
	}

	public double getVolMax() {
		return volMax;
	}

	public void setVolMax(double volMax) {
		this.volMax = volMax;
	}
	
	public void play (File file){
		try {
			basicPlayer.open(file);
			basicPlayer.play();
			actualizaSonido();
		}
		catch (Exception e){}
	}
	
	public void actualizaSonido() {
		setVolume(vol, volMax); 
	}
	
	public void stop(){
		try {
			basicPlayer.stop();
		}
		catch (BasicPlayerException e){
		}
	}
	
	public void setVolume(double vol, double volMax){
		try{
			
			basicPlayer.setGain(vol/volMax);
		}
		catch (BasicPlayerException e){
		}
	}
}
