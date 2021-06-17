view: scores_rollup {
  sql_table_name: "RS"."SCORES_ROLLUP"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
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

  dimension: q_count {
    type: number
    sql: ${TABLE}."Q_COUNT" ;;
  }

  dimension: q_id {
    type: string
    sql: ${TABLE}."Q_ID" ;;
  }

  dimension: q_score {
    type: number
    sql: ${TABLE}."Q_SCORE" ;;
  }

  dimension: receptionistempcode {
    type: number
    sql: ${TABLE}."RECEPTIONISTEMPCODE" ;;
  }

  dimension: receptionistname {
    type: string
    sql: ${TABLE}."RECEPTIONISTNAME" ;;
  }

  dimension: scorecard_id {
    type: number
    sql: ${TABLE}."SCORECARD_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, receptionistname]
  }
}
