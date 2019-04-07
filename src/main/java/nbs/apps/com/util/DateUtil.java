package nbs.apps.com.util;

import org.apache.commons.lang3.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static final String YYYY_MM_DD_HH_MI_SS ="yyyy-MM-dd HH:mm:ss";
    public static final String YYYY_MM_DD ="yyyy-MM-dd";

    public static final String HH_MM_SS = "HH:mm:ss";

    public static String dateToString(Date date, String format)
    {
        if(date == null || format == null)
        {
            return null;
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(date);

    }

    public static Date stringToDate(String dateString, String format){
        if(StringUtils.isEmpty(dateString ) || StringUtils.isEmpty(format))
        {
            return null;
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        Date date = null;
        try
        {
            date = dateFormat.parse(dateString);
        }catch (ParseException e)
        {
            e.printStackTrace();
        }

        return date;
    }

    public static Double getHours(Date timeFrom, Date timeTo) {
        if(timeTo == null || timeFrom == null)
            return 0D;
        return Double.valueOf((timeTo.getTime() - timeFrom.getTime())/(1000 * 60 * 60));
    }
}
