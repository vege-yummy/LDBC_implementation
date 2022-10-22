package org.ldbcouncil.snb.impls.workloads.tigergraph.connector;

import org.ldbcouncil.snb.driver.workloads.interactive.LdbcQuery1Result;
import org.ldbcouncil.snb.driver.workloads.interactive.LdbcUpdate1AddPerson;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import java.util.stream.Collectors;

public class TigerGraphConverter {

    final static String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    final static SimpleDateFormat sdf = new SimpleDateFormat(DATETIME_FORMAT);
    static {
        sdf.setTimeZone(TimeZone.getTimeZone("Etc/GMT+0"));
    }

    public static Date parseDateTime(String representation) throws ParseException {
        return sdf.parse(representation);
    }

    public static long parseDateTimeToEpoch(String representation) throws ParseException {
        return dateToEpoch(sdf.parse(representation));
    }

    public static long parseDateTimeToEpoch(long representation) throws ParseException {
        return representation;
    }

    public static long dateToEpoch(Date date) {
        return date.toInstant().getEpochSecond();
    }
    public static String dateToEpochString(Date date) {
        return Long.toString(dateToEpoch(date));
    }

    public static Iterable<LdbcQuery1Result.Organization> toOrgList(List<List> values) {
        return values.stream()
                .map(v -> new LdbcQuery1Result.Organization((String) v.get(0), Integer.parseInt((String) v.get(1)), (String) v.get(2)))
                .collect(Collectors.toList());
    }

    public static String orgsToString(List<LdbcUpdate1AddPerson.Organization> organizations) {
        return organizations
                .stream()
                .map(v -> v.getOrganizationId() + "," + v.getYear())
                .collect(Collectors.joining(";"));
    }
}