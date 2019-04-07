package nbs.apps.com.util;

import java.io.*;
import java.util.Base64;

public class UtilBase64Image {
    public static String encoder(String imagePath) {
        File file = new File(imagePath);
        try (FileInputStream imageInFile = new FileInputStream(file)) {
            // Reading a Image file from file system
            String base64Image = "";
            byte imageData[] = new byte[(int) file.length()];
            imageInFile.read(imageData);
            base64Image = Base64.getEncoder().encodeToString(imageData);
            return base64Image;
        } catch (FileNotFoundException e) {
            System.out.println("Image not found" + e);
        } catch (IOException ioe) {
            System.out.println("Exception while reading the Image " + ioe);
        }
        return null;
    }



    public static void decoder(String base64Image, String pathFile) {
        try (FileOutputStream imageOutFile = new FileOutputStream(pathFile)) {
            // Converting a Base64 String into Image byte array
            byte[] imageByteArray = Base64.getDecoder().decode(base64Image);
            imageOutFile.write(imageByteArray);
        } catch (FileNotFoundException e) {
            System.out.println("Image not found" + e);
        } catch (IOException ioe) {
            System.out.println("Exception while reading the Image " + ioe);
        }
    }

    public static String saveImage(String base64Image, String pathFile, String fileName) {

        File dir = new File(pathFile);
        dir.mkdirs();
        File f1 = new File(pathFile+ "/"+fileName);
        FileOutputStream fout = null;
        try {
           fout = new FileOutputStream(f1);
            byte[] imageByteArray = Base64.getDecoder().decode(base64Image);
            fout.write(imageByteArray);
            return f1.getAbsolutePath();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(fout != null)
            {
                try {
                    fout.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return null;
    }
}
