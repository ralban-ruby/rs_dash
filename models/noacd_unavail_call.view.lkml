view: noacd_unavail_call {
  sql_table_name: "RS"."NOACD_UNAVAIL_CALL"
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

  dimension: noacd_second_per_call {
    type: number
    sql: ${TABLE}."NOACD_SECOND_PER_CALL" ;;
  }

  dimension: noacd_seconds {
    type: number
    sql: ${TABLE}."NOACD_SECONDS" ;;
  }

  dimension: receptionistdescription {
    type: string
    sql: ${TABLE}."RECEPTIONISTDESCRIPTION" ;;
  }

  dimension: unavail_seconds {
    type: number
    sql: ${TABLE}."UNAVAIL_SECONDS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
