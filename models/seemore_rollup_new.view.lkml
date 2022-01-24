view: seemore_rollup_new {
  sql_table_name: "RS"."SEEMORE_ROLLUP_NEW"
    ;;

  dimension: absence_hours {
    type: number
    sql: ${TABLE}."ABSENCE_HOURS" ;;
  }

  dimension: acw_seconds {
    type: number
    sql: ${TABLE}."ACW_SECONDS" ;;
  }

  dimension: ana {
    type: number
    sql: ${TABLE}."ANA" ;;
  }

  dimension: avail {
    type: number
    sql: ${TABLE}."AVAIL" ;;
  }

  dimension: brb_minutes {
    type: number
    sql: ${TABLE}."BRB_MINUTES" ;;
  }

  dimension: ACW_minutes {
    type: number
    sql: ${TABLE}."ACW_MINUTES" ;;
  }


  dimension: calls {
    type: number
    sql: ${TABLE}."CALLS" ;;
  }

  dimension: calls_per_floor_hour {
    type: number
    sql: ${TABLE}."CALLS_PER_FLOOR_HOUR" ;;
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

  dimension: floor_time_hours {
    type: number
    sql: ${TABLE}."FLOOR_TIME_HOURS" ;;
  }

  dimension: handletime_seconds {
    type: number
    sql: ${TABLE}."HANDLETIME_SECONDS" ;;
  }

  dimension: hours_trimmed {
    type: number
    sql: ${TABLE}."HOURS_TRIMMED" ;;
  }

  dimension: hours_worked {
    type: number
    sql: ${TABLE}."HOURS_WORKED" ;;
  }

  dimension: longoffers {
    type: number
    sql: ${TABLE}."LONGOFFERS" ;;
  }

  dimension: meeting_minutes {
    type: number
    sql: ${TABLE}."MEETING_MINUTES" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: noacd_minutes {
    type: number
    sql: ${TABLE}."NOACD_MINUTES" ;;
  }

  dimension: noacd_seconds {
    type: number
    sql: ${TABLE}."NOACD_SECONDS" ;;
  }

  dimension: open_hours {
    type: number
    sql: ${TABLE}."OPEN_HOURS" ;;
  }

  dimension: planned_hours {
    type: number
    sql: ${TABLE}."PLANNED_HOURS" ;;
  }

  dimension: talktime_minutes {
    type: number
    sql: ${TABLE}."TALKTIME_MINUTES" ;;
  }

  dimension: talktime_seconds {
    type: number
    sql: ${TABLE}."TALKTIME_SECONDS" ;;
  }

  dimension: techissues_minutes {
    type: number
    sql: ${TABLE}."TECHISSUES_MINUTES" ;;
  }

  dimension: tt_minutes {
    type: number
    sql: ${TABLE}."TT_MINUTES" ;;
  }

  dimension: unavail_minutes {
    type: number
    sql: ${TABLE}."UNAVAIL_MINUTES" ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}."UNIQUE_ID" ;;
  }

  dimension: weekday {
    type: string
    sql: ${TABLE}."WEEKDAY" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
