view: totalseconds {
  sql_table_name: "RS"."TOTALSECONDS"
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
