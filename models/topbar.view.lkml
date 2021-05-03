view: topbar {
  sql_table_name: "RS"."TOPBAR"
    ;;

  dimension: avgscore {
    type: number
    sql: ${TABLE}."AVGSCORE" ;;
  }

  dimension: employee_code {
    type: number
    sql: ${TABLE}."EMPLOYEE_CODE" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension_group: hire {
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
    sql: ${TABLE}."HIRE_DATE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: receptionistempcode {
    type: number
    sql: ${TABLE}."RECEPTIONISTEMPCODE" ;;
  }

  dimension_group: scorecard {
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
    sql: ${TABLE}."SCORECARD_DATE" ;;
  }

  dimension_group: master_date {
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
    sql: ${TABLE}."Master_Date" ;;
  }

  dimension: scorecards {
    type: number
    sql: ${TABLE}."SCORECARDS" ;;
  }

  dimension: sitwiths {
    type: number
    sql: ${TABLE}."SITWITHS" ;;
  }

  dimension: totalpoints {
    type: number
    sql: ${TABLE}."TOTALPOINTS" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
