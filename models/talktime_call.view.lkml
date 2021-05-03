view: talktime_call {
  sql_table_name: "RS"."TALKTIME_CALL"
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

  dimension: employeeID {
    type: number
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: receptionistdescription {
    type: string
    sql: ${TABLE}."RECEPTIONISTDESCRIPTION" ;;
  }

  dimension: seconds {
    type: number
    sql: ${TABLE}."SECONDS" ;;
  }

  dimension: talktimepercall_second {
    type: number
    sql: ${TABLE}."TALKTIMEPERCALL_SECOND" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
