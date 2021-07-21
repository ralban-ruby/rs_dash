view: attendance_occurrences {
  sql_table_name: "RS"."ATTENDANCE_OCCURRENCES"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}."_FIVETRAN_DELETED" ;;
  }

  dimension_group: _fivetran_synced {
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
    sql: CAST(${TABLE}."_FIVETRAN_SYNCED" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: absencestart {
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
    sql: ${TABLE}."ABSENCESTART" ;;
  }

  dimension_group: absencestop {
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
    sql: ${TABLE}."ABSENCESTOP" ;;
  }

  dimension: coach {
    type: string
    sql: ${TABLE}."COACH" ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension_group: effectivethrough {
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
    sql: ${TABLE}."EFFECTIVETHROUGH" ;;
  }

  dimension: empid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPID" ;;
  }

  dimension: hours {
    type: number
    sql: ${TABLE}."HOURS" ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}."MEMO" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: newoccurrence {
    type: number
    sql: ${TABLE}."NEWOCCURRENCE" ;;
  }

  dimension_group: occurrenceend {
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
    sql: ${TABLE}."OCCURRENCEEND" ;;
  }

  dimension_group: occurrencestart {
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
    sql: ${TABLE}."OCCURRENCESTART" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
