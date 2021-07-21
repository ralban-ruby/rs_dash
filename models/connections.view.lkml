view: connections {
  sql_table_name: "RS"."CONNECTIONS"
    ;;

  dimension_group: datecreated {
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
    sql: ${TABLE}."DATECREATED" ;;
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

  dimension: total {
    type: number
    sql: ${TABLE}."TOTAL" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
