package ma.zs.generator.helper.pojo.service;


import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.service.reader.impl.JsonPojoReader;
import ma.zs.generator.helper.pojo.service.reader.impl.YamlPojoReader;
import org.apache.tomcat.util.json.ParseException;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class PojoService {
    @Autowired
    private YamlPojoReader yamlPojoReader;
    @Autowired
    private JsonPojoReader jsonPojoReader;


}
