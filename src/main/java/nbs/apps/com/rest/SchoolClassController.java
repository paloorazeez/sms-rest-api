package nbs.apps.com.rest;

import nbs.apps.com.model.SchoolClass;
import nbs.apps.com.model.Subject;
import nbs.apps.com.model.Teacher;
import nbs.apps.com.repository.ISchoolClassRepository;
import nbs.apps.com.repository.ISubjectRepository;
import nbs.apps.com.repository.ITeacherRepository;
import nbs.apps.com.rest.model.SchoolClassUIModel;
import nbs.apps.com.rest.model.SubjectUIModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/classes")
public class SchoolClassController {

        @Autowired
        ISchoolClassRepository schoolClassRepository;

        @Autowired
        ITeacherRepository teacherRepository;

        @Autowired
        ISubjectRepository subjectRepository;

        @RequestMapping( method = RequestMethod.GET)
        public ResponseEntity<List<SchoolClass>> findAll()
        {
            List<SchoolClass> schoolClassList = (List<SchoolClass>) schoolClassRepository.findAll();
            if(schoolClassList == null || schoolClassList.size() <1)
            {
                return ResponseEntity.noContent().build();
            }
            return ResponseEntity.ok(schoolClassList);
        }

        @CrossOrigin
        @RequestMapping(value = "/{id}",method = RequestMethod.GET)
        public ResponseEntity<?> findById(@PathVariable("id") Long id)
        {
            SchoolClass schoolClass = schoolClassRepository.findOne(id);
            if(schoolClass == null)
            {
                return ResponseEntity.notFound().build();
            }
            return ResponseEntity.ok(schoolClass);
        }


        @CrossOrigin
        @RequestMapping(value = "/findBySchool/{schoolId}",method = RequestMethod.GET)
        public ResponseEntity<?> findBySchoolId(@PathVariable("schoolId") Long schoolId)
        {
            List<SchoolClass> schoolClass = schoolClassRepository.findByClassTeacherSchoolId(schoolId);
            if(schoolClass == null)
            {
                return ResponseEntity.notFound().build();
            }
            return ResponseEntity.ok(schoolClass);
        }



        @CrossOrigin
        @RequestMapping( method = RequestMethod.POST)
        public ResponseEntity<?> save(@RequestBody SchoolClassUIModel schoolClass)
        {
            SchoolClass sclass = null;
            if(schoolClass.getClassId()!=null && schoolClass.getClassId() !=0)
            {
                sclass = schoolClassRepository.findOne(schoolClass.getClassId());

            }
            if(sclass == null)
            {
                sclass = new SchoolClass();
            }
            if(schoolClass.getClassName() != null && !schoolClass.getClassName().trim().equals(""))
            {
                sclass.setName(schoolClass.getClassName());
            }
            if(schoolClass.getClassTeacherId() != null && schoolClass.getClassTeacherId()!= 0 )
            {
                Teacher classTeacher = teacherRepository.findOne(schoolClass.getClassTeacherId());
                if(classTeacher != null)
                {
                    sclass.setClassTeacher(classTeacher);
                }
            }
            populateSubjectList(schoolClass, sclass);
            return new ResponseEntity<>(schoolClassRepository.save(sclass), HttpStatus.CREATED);
        }

    private void populateSubjectList(SchoolClassUIModel schoolClass, SchoolClass sclass) {
        if(schoolClass.getSubjectList() != null && schoolClass.getSubjectList().size()>0)
        {
            List<Subject> subjects = new ArrayList<>();
            for(SubjectUIModel sbj: schoolClass.getSubjectList())
            {
                Subject subject =null;
                if(sbj != null && sbj.getId() != null && sbj.getId() !=0)
                {
                     subject = subjectRepository.findOne(sbj.getId());
                }
                if(subject == null)
                {
                    subject = new Subject();
                }
                subject.setSchoolClass(sclass);
                subject.setName(sbj.getName());
                if(sbj.getTeacherId() != null && sbj.getTeacherId() !=0)
                {
                    Teacher teacher = teacherRepository.findOne(sbj.getTeacherId());
                    if(teacher != null)
                    {
                        subject.setTeacher(teacher);
                    }
                }
                subjects.add(subject);

            }
            if(subjects != null && subjects.size() >0)
            {
                sclass.setSubjectList(subjects);
            }
        }
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
        public ResponseEntity delete(@PathVariable("id") Long id)
        {
            try
            {
                schoolClassRepository.delete(id);
            }catch (EmptyResultDataAccessException e)
            {
                return ResponseEntity.notFound().build();
            }
            return ResponseEntity.ok().build();
        }
}
