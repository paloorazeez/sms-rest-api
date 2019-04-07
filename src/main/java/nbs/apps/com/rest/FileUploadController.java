package nbs.apps.com.rest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/api/files")
public class FileUploadController {

    @Value("${storeImageLocation}")
    private String storeImageLocation;

    @RequestMapping(method = RequestMethod.POST, value = "/upload")
    public void upload(@RequestParam("file")MultipartFile file) throws IOException {

        if(file.isEmpty()){
            return;
        }

        byte[] bytes = file.getBytes();
        System.out.println(bytes);
        String dir = storeImageLocation+"//files";
        Path path = Paths.get(dir+"//"+file.getOriginalFilename());
        Files.write(path, bytes);

    }
}
