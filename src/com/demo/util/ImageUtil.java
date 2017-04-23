package com.demo.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageUtil {
	 public static void resize(String oldFilePath,String newFilePath, int height, int width, boolean bb) {  
	        try {  
	            double ratio = 0; //缩放比例      
	            File f = new File(oldFilePath); 
	            File newF = new File(newFilePath); 
	            BufferedImage bi = ImageIO.read(f);     
	            Image itemp = bi.getScaledInstance(width, height, BufferedImage.SCALE_SMOOTH);     
	            //计算比例     
	            if ((bi.getHeight() > height) || (bi.getWidth() > width)) {     
	                if (bi.getHeight() > bi.getWidth()) {     
	                    ratio = (new Integer(height)).doubleValue() / bi.getHeight();     
	                } else {     
	                    ratio = (new Integer(width)).doubleValue() / bi.getWidth();     
	                }     
	                AffineTransformOp op = new AffineTransformOp(AffineTransform.getScaleInstance(ratio, ratio), null);     
	                itemp = op.filter(bi, null);     
	            }     
	            if (bb) {     
	                BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);     
	                Graphics2D g = image.createGraphics();     
	                g.setColor(Color.white);     
	                g.fillRect(0, 0, width, height);     
	                if (width == itemp.getWidth(null))     
	                    g.drawImage(itemp, 0, (height - itemp.getHeight(null)) / 2, itemp.getWidth(null), itemp.getHeight(null), Color.white, null);     
	                else    
	                    g.drawImage(itemp, (width - itemp.getWidth(null)) / 2, 0, itemp.getWidth(null), itemp.getHeight(null), Color.white, null);     
	                g.dispose();     
	                itemp = image;     
	            }  
	            ImageIO.write((BufferedImage) itemp, "jpg", newF);     
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
	    }  
}
