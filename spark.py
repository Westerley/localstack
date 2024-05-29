
from pyspark.sql.functions import lpad, col, rpad, lit, when, regexp_extract_all, regexp_extract, split, expr, concat, date_format, to_date

def fill_column2(column, position, data_type):

    split_col = pyspark.sql.functions.split(column, '\.')

    return (
         when(data_type == "string", rpad(column, 4, "*"))
        .when(data_type == "int", lpad(column, 12, "0"))
        .when(data_type == "decimal", 
              when(column.isNotNull(),
                   concat(
                       lit("+"),
                       lpad(split_col.getItem(0), 4, "0"),
                       lit(","),
                       rpad(split_col.getItem(1), 3, "0")
                   )
              ).otherwise(
                  rpad(lit(""), 9, "*")
              )
        )
        .when(data_type == "date", date_format(column, format="yMMd"))
        .when(data_type == "boolean", 
              when(column == "true", "S").
              when(column == "false", "N").
              otherwise(" ")
        )
    )