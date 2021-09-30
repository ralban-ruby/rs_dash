view: attendance_occurrences {
  sql_table_name: "RS"."ATTENDANCE_OCCURRENCES"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
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
    html: {{ rendered_value | date: "%m/%d/%Y" }} ;;
  }

  dimension: empid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPID" ;;
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
    hidden: yes
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
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }


  measure: count_occurrences {
    type: sum_distinct
    sql: ${TABLE}."NEWOCCURRENCE" ;;
    # html:
    # {% if value >= 5 %}
    # <p style="color: red; font-size: 100%">{{ rendered_value }}</p>
    # {% else %}
    # <p style="color: black; font-size:100%">{{ rendered_value }}</p>
    # {% endif %};;
  }

  measure: sum_hours {
    type: sum_distinct
    value_format_name: decimal_2
    sql: ${TABLE}."HOURS" ;;
  }

}
