package com.pacs.main.web.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;


public class Dicom2Png {
	public static void main(String[] args) throws IOException {
		System.out.println("hello");
		try{
			Iterator<ImageReader> iter = ImageIO.getImageReadersByFormatName("DICOM");
			ImageReader reader = (ImageReader) iter.next();
			
			ImageInputStream iis = ImageIO.createImageInputStream(new File("c:/dicom/d1.dic"));

			BufferedImage bi;
			
			reader.setInput(iis);
			bi = ImageIO.read(iis);
			ImageIO.write(bi, "png", new File("c:/dicom/IM156.png"));

		}catch(Exception e){
			e.printStackTrace();
		}
		

		
	}
}
