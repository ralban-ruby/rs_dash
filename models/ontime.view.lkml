view: ontime {
  sql_table_name: "RS"."ONTIME"
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
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: ratio {
    type: number
    sql: ${TABLE}."RATIO" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
