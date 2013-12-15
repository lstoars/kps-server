package com.kps.server.utils;

import org.apache.commons.lang.time.DateFormatUtils;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

import java.io.IOException;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: fei
 * Date: 13-12-14
 * Time: 下午11:09
 * To change this template use File | Settings | File Templates.
 */
public class JsonDateSerializer extends JsonSerializer<Date> {

    @Override
    public void serialize(Date date, JsonGenerator jsonGenerator,
                          SerializerProvider serializerProvider) throws IOException, JsonProcessingException {
        if (null != date) {
            jsonGenerator.writeString(DateFormatUtils.format(date, "yyyy-MM-dd HH:mm"));
        }
    }
}
