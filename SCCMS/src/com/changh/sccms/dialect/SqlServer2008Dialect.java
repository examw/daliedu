package com.changh.sccms.dialect;

import java.sql.Types;

import org.hibernate.dialect.SQLServerDialect;

/**
 * Modified version based on the work found at http://opensource.atlassian.com/projects/hibernate/browse/HHH-2655
 * 
 * @author Yoryos Valotassios
 * @since 10.1.1
 */
public class SqlServer2008Dialect extends SQLServerDialect {
    private static final String SELECT = "select";
    private static final String SELECT_DISTINCT = "select distinct";

    public SqlServer2008Dialect() {
        super();

        this.registerColumnType(Types.VARCHAR, 8000, "VARCHAR($l)");
        this.registerColumnType(Types.VARCHAR, 1073741823, "NVARCHAR(MAX)");
        this.registerColumnType(Types.VARCHAR, 2147483647, "VARCHAR(MAX)");
        this.registerColumnType(Types.VARBINARY, 2147483647, "VARBINARY(MAX)");
    }

    /**
     * Add a LIMIT clause to the given SQL SELECT The LIMIT SQL will look like:
     * 
     * <pre>
     * WITH query AS (SELECT ROW_NUMBER() OVER (ORDER BY orderby) as __hibernate_row_nr__, original_query_without_orderby)
     * SELECT * FROM query WHERE __hibernate_row_nr__ BEETWIN offset AND offset + last
     * --ORDER BY __hibernate_row_nr__: Don't think that wee need this last order by clause
     * </pre>
     * 
     * @param querySqlString The SQL statement to base the limit query off of.
     * @param offset Offset of the first row to be returned by the query (zero-based)
     * @param limit Maximum number of rows to be returned by the query
     * @return A new SQL statement with the LIMIT clause applied.
     */
    @Override
    public String getLimitString(String querySqlString, int offset, int limit) {
        if (offset <= 0) {
            return super.getLimitString(querySqlString, offset, limit);
        }

        StringBuilder sb = new StringBuilder(querySqlString.trim());

        String querySqlLowered = querySqlString.trim().toLowerCase();
        int orderByIndex = querySqlLowered.toLowerCase().indexOf("order by");
        String orderby = orderByIndex > 0 ? querySqlString.substring(orderByIndex) : "ORDER BY CURRENT_TIMESTAMP";

        // Delete the order by clause at the end of the query
        if (orderByIndex > 0) {
            sb.delete(orderByIndex, orderByIndex + orderby.length());
        }

        // Find the end of the select statement
        int selectIndex = querySqlLowered.trim().indexOf(SqlServer2008Dialect.SELECT_DISTINCT);
        if (selectIndex != -1) {
            selectIndex += SqlServer2008Dialect.SELECT_DISTINCT.length();
        } else {
            selectIndex = querySqlLowered.trim().indexOf(SqlServer2008Dialect.SELECT);
            if (selectIndex != -1) {
                selectIndex += SqlServer2008Dialect.SELECT.length();
            }
        }

        // Isert after the select statement the row_number() function:
        sb.insert(selectIndex, " ROW_NUMBER() OVER (" + orderby + ") as __hibernate_row_nr__,");

        //Wrap the query within a with statement:
        sb.insert(0, "WITH query AS (").append(") SELECT * FROM query ");
        sb.append("WHERE __hibernate_row_nr__ BETWEEN ").append(offset + 1).append(" AND ").append(limit);

        return sb.toString();
    }

    @Override
    public boolean supportsLimit() {
        return true;
    }

    @Override
    public boolean supportsLimitOffset() {
        return true;
    }

    @Override
    public boolean bindLimitParametersFirst() {
        return false;
    }

    @Override
    public boolean useMaxForLimit() {
        return true;
    }
}
