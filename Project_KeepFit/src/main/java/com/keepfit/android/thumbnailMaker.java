package com.keepfit.android;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;

public class thumbnailMaker {
	
	public thumbnailMaker () {}
	
	public BufferedImage resizing(BufferedImage image, int height, int width) {
	    Image tmp = image.getScaledInstance(width, height, Image.SCALE_SMOOTH);
	    BufferedImage resized = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
	    Graphics2D g2d = resized.createGraphics();
	    g2d.drawImage(tmp, 0, 0, null);
	    g2d.dispose();
	    
	    return resized;
	}

}
