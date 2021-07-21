view: noacd_call {
  sql_table_name: "RS"."NOACD_CALL"
    ;;

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

  measure: count {
    type: count
    drill_fields: []
  }
}
