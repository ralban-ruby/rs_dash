view: totalcalls {
  sql_table_name: "RS"."TOTALCALLS"
    ;;

  dimension: calls {
    type: number
    sql: ${TABLE}."CALLS" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: receptionistdescription {
    type: string
    sql: ${TABLE}."RECEPTIONISTDESCRIPTION" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
