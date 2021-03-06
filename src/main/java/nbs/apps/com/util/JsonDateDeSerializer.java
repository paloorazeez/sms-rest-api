package nbs.apps.com.util;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import java.io.IOException;
import java.util.Date;

public class JsonDateDeSerializer extends JsonDeserializer<Date> {


    @Override
    public Date deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
        return DateUtil.stringToDate(jsonParser.getText().trim(), DateUtil.YYYY_MM_DD_HH_MI_SS);
    }

}
