package com.datalathe.enzy;

import com.datalathe.client.DatalatheClient;
import com.datalathe.client.command.impl.GenerateReportCommand;
import com.datalathe.client.model.StageDataSourceRequest;
import com.datalathe.Util;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.Configurator;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class DatalatheJob {
    private static final Logger logger = LogManager.getLogger(DatalatheJob.class);

    public static void main(String[] args) throws IOException, SQLException {
        // Configure logger level based on system property
        String logLevel = System.getProperty("log.level", "INFO");
        Configurator.setRootLevel(Level.valueOf(logLevel));
        logger.info("Log level set to: {}", logLevel);

        // Get URL from system property
        String url = System.getProperty("url", "http://localhost:3000");
        logger.info("URL set to: {}", url);

        // Create client
        DatalatheClient client = new DatalatheClient(url);

        logger.info("Staging data");

        List<StageDataSourceRequest> stageDataRequests = getStageDataRequests();
        List<String> chipIds = client.stageData(stageDataRequests);

        logger.info("Staged data");

        // Define analysis queries
        List<String> analysisQueries = Arrays.asList(
                "SELECT * FROM object028",
                "SELECT COUNT(*) FROM object028",
                "select count(*) from object028_text009",
                "select count(*) from object028_date000",
                "select blah from failed_query",
                getLongQuery());

        logger.info("Executing queries");

        // Execute queries and print results
        Map<Integer, GenerateReportCommand.Response.Result> results = client.query(chipIds, analysisQueries);

        logger.info("Printing results");
        Util.printReportResults(results);
    }

    private static List<StageDataSourceRequest> getStageDataRequests() {
        return Arrays.asList(
                new StageDataSourceRequest("local", "object028",
                        "SELECT * FROM object028 where companyid = 172"),
                new StageDataSourceRequest("local", "object028_date000",
                        "SELECT * FROM object028_date000 where companyid = 172"),
                new StageDataSourceRequest("local", "object028_text009",
                        "SELECT * FROM object028_text009 where companyid = 172"),
                new StageDataSourceRequest("local", "object028_text010",
                        "SELECT * FROM object028_text010 where companyid = 172"),
                new StageDataSourceRequest("local", "object028_text011",
                        "SELECT * FROM object028_text011 where companyid = 172"),
                new StageDataSourceRequest("local", "object028_text013",
                        "SELECT * FROM object028_text013 where companyid = 172"),
                new StageDataSourceRequest("local", "object028_text014",
                        "SELECT * FROM object028_text014 where companyid = 172"),
                new StageDataSourceRequest("local", "object028_text015",
                        "SELECT * FROM object028_text015 where companyid = 172"));
    }

    private static String getLongQuery() {
        return """
                                SELECT
                    CONCAT (
                        object028.id,
                        '-',
                        object028_text009.value,
                        '-closer'
                    ),
                    object028_text009.value
                FROM
                    object028
                    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
                    AND object028.id = object028_date000.objectId
                    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
                    AND object028.id = object028_text009.objectId
                    LEFT JOIN object028_text013 ON object028.companyId = object028_text013.companyId
                    AND object028.id = object028_text013.objectId
                WHERE
                    object028.companyid = 172
                    AND object028_text013.value = 'Closer'
                UNION ALL
                SELECT
                    CONCAT (
                        object028.id,
                        '-',
                        object028_text010.value,
                        '-closer'
                    ),
                    object028_text010.value
                FROM
                    object028
                    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
                    AND object028.id = object028_date000.objectId
                    LEFT JOIN object028_text010 ON object028.companyId = object028_text010.companyId
                    AND object028.id = object028_text010.objectId
                    LEFT JOIN object028_text014 ON object028.companyId = object028_text014.companyId
                    AND object028.id = object028_text014.objectId
                WHERE
                    object028.companyid = 172
                    AND object028_text014.value = 'Closer'
                UNION ALL
                SELECT
                    CONCAT (
                        object028.id,
                        '-',
                        object028_text011.value,
                        '-closer'
                    ),
                    object028_text011.value
                FROM
                    object028
                    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
                    AND object028.id = object028_date000.objectId
                    LEFT JOIN object028_text011 ON object028.companyId = object028_text011.companyId
                    AND object028.id = object028_text011.objectId
                    LEFT JOIN object028_text015 ON object028.companyId = object028_text015.companyId
                    AND object028.id = object028_text015.objectId
                WHERE
                    object028.companyid = 172
                    AND object028_text015.value = 'Closer'
                UNION ALL
                select
                    CONCAT (
                        object028.id,
                        '-',
                        object028_text009.value,
                        '-closer'
                    ),
                    object028_text009.value
                from
                    object028
                    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
                    AND object028.id = object028_date000.objectId
                    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
                    AND object028.id = object028_text009.objectId
                    LEFT JOIN object028_text013 ON object028.companyId = object028_text013.companyId
                    AND object028.id = object028_text013.objectId
                WHERE
                    object028.companyid = 172
                    AND object028_text013.value IS NULL
                    AND object028_text009.value IS NOT NULL
                    and object028.id is not null
                UNION ALL
                select
                    CONCAT (
                        object028.id,
                        '-',
                        object028_text010.value,
                        '-setter'
                    ),
                    object028_text010.value
                from
                    object028
                    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
                    AND object028.id = object028_date000.objectId
                    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
                    AND object028.id = object028_text009.objectId
                    LEFT JOIN object028_text010 ON object028.companyId = object028_text010.companyId
                    AND object028.id = object028_text010.objectId
                    LEFT JOIN object028_text014 ON object028.companyId = object028_text014.companyId
                    AND object028.id = object028_text014.objectId
                WHERE
                    object028.companyid = 172
                    AND object028_text014.value IS NULL
                    AND object028_text010.value IS NOT NULL
                    and object028.id is not null
                UNION ALL
                select
                    CONCAT (
                        object028.id,
                        '-',
                        object028_text011.value,
                        '-setter'
                    ),
                    object028_text011.value
                from
                    object028
                    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
                    AND object028.id = object028_date000.objectId
                    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
                    AND object028.id = object028_text009.objectId
                    LEFT JOIN object028_text011 ON object028.companyId = object028_text011.companyId
                    AND object028.id = object028_text011.objectId
                    LEFT JOIN object028_text015 ON object028.companyId = object028_text015.companyId
                    AND object028.id = object028_text015.objectId
                WHERE
                    object028.companyid = 172
                    AND object028_text015.value IS NULL
                    AND object028_text011.value IS NOT NULL
                    and object028.id is not null
                UNION ALL
                SELECT
                    CONCAT (
                        object028.id,
                        '-',
                        object028_text009.value,
                        '-setter'
                    ),
                    object028_text009.value
                FROM
                    object028
                    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
                    AND object028.id = object028_date000.objectId
                    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
                    AND object028.id = object028_text009.objectId
                    LEFT JOIN object028_text013 ON object028.companyId = object028_text013.companyId
                    AND object028.id = object028_text013.objectId
                WHERE
                    object028.companyid = 172
                    AND object028_text013.value = 'Setter'
                UNION ALL
                SELECT
                    CONCAT (
                        object028.id,
                        '-',
                        object028_text010.value,
                        '-setter'
                    ),
                    object028_text010.value
                FROM
                    object028
                    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
                    AND object028.id = object028_date000.objectId
                    LEFT JOIN object028_text010 ON object028.companyId = object028_text010.companyId
                    AND object028.id = object028_text010.objectId
                    LEFT JOIN object028_text014 ON object028.companyId = object028_text014.companyId
                    AND object028.id = object028_text014.objectId
                WHERE
                    object028.companyid = 172
                    AND object028_text014.value = 'Setter'
                UNION ALL
                SELECT
                    CONCAT (
                        object028.id,
                        '-',
                        object028_text011.value,
                        '-setter'
                    ),
                    object028_text011.value
                FROM
                    object028
                    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
                    AND object028.id = object028_date000.objectId
                    LEFT JOIN object028_text011 ON object028.companyId = object028_text011.companyId
                    AND object028.id = object028_text011.objectId
                    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
                    AND object028.id = object028_text009.objectId
                    LEFT JOIN object028_text015 ON object028.companyId = object028_text015.companyId
                    AND object028.id = object028_text015.objectId
                WHERE
                    object028.companyId = 172
                    AND CONCAT (
                        object028.id,
                        '-',
                        object028_text009.value,
                        '-closer'
                    ) IS NOT NULL
                    AND (object028_text015.value = 'Setter')
                                """;
    }
}
