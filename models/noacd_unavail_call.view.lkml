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
    html: {{ rendered_value | date: "%m/%d/%Y" }} ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: noacd_second {
    type: number
    sql: ${TABLE}."NOACD_SECOND" ;;
  }

  dimension: receptionistdescription {
    type: string
    sql: ${TABLE}."RECEPTIONISTDESCRIPTION" ;;
  }

  dimension: seconds {
    type: number
    sql: ${TABLE}."SECONDS" ;;
  }

  dimension: unavail_second {
    type: number
    sql: ${TABLE}."UNAVAIL_SECOND" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
