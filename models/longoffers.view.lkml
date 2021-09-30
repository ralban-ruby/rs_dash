view: longoffers {
  sql_table_name: "RS"."LONGOFFERS"
    ;;

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

  dimension: longoffers {
    type: number
    sql: ${TABLE}."LONG_OFFERS" ;;
  }

  dimension: ANA {
    type: number
    sql: ${TABLE}."ANA" ;;
  }

  dimension: total_calls {
    type: number
    sql: ${TABLE}."TOTAL_CALLS" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}."USERID" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
