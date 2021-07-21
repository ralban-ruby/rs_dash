view: longoffers {
  sql_table_name: "RS"."LONGOFFERS"
    ;;

  dimension: ana {
    type: number
    sql: ${TABLE}."ANA" ;;
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

  dimension: long_offers {
    type: number
    sql: ${TABLE}."LONG_OFFERS" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: total_calls {
    type: number
    sql: ${TABLE}."TOTAL_CALLS" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
