package nbs.apps.com.rest;

import nbs.apps.com.model.Event;
import nbs.apps.com.model.School;
import nbs.apps.com.repository.IEventRepository;
import nbs.apps.com.repository.ISchoolRepository;
import nbs.apps.com.util.DateUtil;
import nbs.apps.com.util.UtilBase64Image;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Date;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/events")
public class EventController {

    @Autowired
    private IEventRepository eventRepository;

    @Autowired
    private ISchoolRepository schoolRepository;

    @Value("${storeImageLocation}")
    private String storeImageLocation;

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> save(@RequestBody Event event){

        if(event.getSchool() != null && event.getSchool().getId() !=null)
        {
            School school = schoolRepository.findOne(event.getSchool().getId());
            event.setSchool(school);
        }
        if(!StringUtils.isEmpty(event.getData()))
        {
            String dir = storeImageLocation+"events/"+ DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD);
            String fileName = System.currentTimeMillis()+event.getImagePath();
             fileName = UtilBase64Image.saveImage(event.getData(), dir, fileName);
            event.setImagePath(fileName);
            event.setData(null);
        }
        return new ResponseEntity<>(eventRepository.save(event), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ResponseEntity<Event> findById(@PathVariable("id") Long id)
    {
        Event event = eventRepository.findOne(id);
        if(event == null)
        {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(event);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/findBySchool/{id}")
    public List<Event> findBySchoolId(@PathVariable("id") Long id)
    {
        List<Event> eventList = eventRepository.findBySchoolIdOrderByIdDesc(id);
        for(Event event : eventList)
        {
            if(event.getImagePath() != null && !"".equals(event.getImagePath().trim()))
            {
                String imageBase64 = UtilBase64Image.encoder(event.getImagePath());
                event.setData(imageBase64);
            }
        }
        return eventList;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Event> findAll()
    {
        List<Event> eventList = (List<Event>) eventRepository.findAll();
        for(Event event : eventList)
        {
            if(event.getImagePath() != null && !"".equals(event.getImagePath().trim()))
            {
                String imageBase64 = UtilBase64Image.encoder(event.getImagePath());
                event.setData(imageBase64);
            }
        }
        return eventList;
    }
}
