package ma.zs.generator.helper.pojo.ws.rest.provided;


import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.service.PojoService;
import org.apache.tomcat.util.json.ParseException;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("pojoHowa/likayn")
public class PojoProvided {
    @Autowired
    private PojoService pojoService;



}
