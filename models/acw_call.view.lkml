view: acw_call {
  sql_table_name: "RS"."ACW_CALL"
    ;;

  dimension: acw_second {
    type: number
    sql: ${TABLE}."ACW_SECOND" ;;
  }

  dimension: calls {
    type: number
    sql: ${TABLE}."CALLS" ;;
  }

  dimension: employeeid {
    type: number
    sql: ${TABLE}."EMPLOYEEID" ;;
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

  dimension: receptionistdescription {
    type: string
    sql: ${TABLE}."RECEPTIONISTDESCRIPTION" ;;
    html: {{ rendered_value | date: "%m/%d/%Y" }} ;;
  }

  dimension: seconds {
    type: number
    sql: ${TABLE}."SECONDS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
