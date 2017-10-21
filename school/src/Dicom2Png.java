
import java.awt.Desktop;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;


public class Dicom2Png {
	public static void main(String[] args) throws IOException {
		System.out.println("hello");
		try{
		/*	Iterator<ImageReader> iter = ImageIO.getImageReadersByFormatName("DICOM");
			ImageReader reader = (ImageReader) iter.next();
			
			ImageInputStream iis = ImageIO.createImageInputStream(new File("d:/pacs/mm.dic"));

			BufferedImage bi;
			
			reader.setInput(iis);
			bi = ImageIO.read(iis);
			ImageIO.write(bi, "png", new File("c:/dicom/tima.png"));*/
			
			if(Desktop.isDesktopSupported())
			{
			  Desktop.getDesktop().browse(new URI("http://localhost:8080/lpacs/inputLogin"));
			}

		}catch(Exception e){
			e.printStackTrace();
		}
		

		
	}
}
