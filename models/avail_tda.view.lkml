view: avail_tda {
  sql_table_name: "RS"."AVAIL_TDA"
    ;;

  dimension: acw_seconds {
    type: number
    sql: ${TABLE}."ACW_SECONDS" ;;
  }

  dimension: avail_minutes {
    type: number
    sql: ${TABLE}."AVAIL_MINUTES" ;;
  }

  dimension: calls {
    type: number
    sql: ${TABLE}."CALLS" ;;
  }

  dimension: empid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPID" ;;
  }

  dimension_group: max_status {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MAX_STATUS" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: perc_avail {
    type: number
    sql: ${TABLE}."PERC_AVAIL" ;;
  }

  dimension: shift_minutes {
    type: number
    sql: ${TABLE}."SHIFT_MINUTES" ;;
    suggest_persist_for: "0 minutes"
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
