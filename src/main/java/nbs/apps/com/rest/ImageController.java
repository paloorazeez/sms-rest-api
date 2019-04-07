package nbs.apps.com.rest;

import nbs.apps.com.rest.model.Image;
import nbs.apps.com.util.UtilBase64Image;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/images")
public class ImageController {

    @RequestMapping(method = RequestMethod.POST)
    public String post(@RequestBody Image image) {
        System.out.println("/POST request with " + image.toString());
        // save Image to C:\\server folder
        String path = "/Users/azeezpaloor/Downloads/Images/server/out/" + image.getName();
        UtilBase64Image.decoder(image.getData(), path);
        return "/Post Successful!";
    }

    @RequestMapping(method = RequestMethod.GET)
    public Image get(@RequestParam("name") String name) {
        System.out.println(String.format("/GET info: imageName = %s", name));
        String imagePath = "/Users/azeezpaloor/Downloads/Images/server/out/" + name;
        String imageBase64 = UtilBase64Image.encoder(imagePath);

        if(imageBase64 != null){
            Image image = new Image(name, imageBase64);
            return image;
        }
        return null;
    }
}
