view: scorecards {
  sql_table_name: "RS"."SCORECARDS"
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

  dimension: comment {
    type: string
    sql: ${TABLE}."COMMENT" ;;
  }

  dimension: evaluatoruser {
    type: string
    sql: ${TABLE}."EVALUATORUSER" ;;
  }

  dimension: q1 {
    type: number
    sql: ${TABLE}."Q1" ;;
  }

  dimension: q10 {
    type: number
    sql: ${TABLE}."Q10" ;;
  }

  dimension: q2 {
    type: number
    sql: ${TABLE}."Q2" ;;
  }

  dimension: q3 {
    type: number
    sql: ${TABLE}."Q3" ;;
  }

  dimension: q4 {
    type: number
    sql: ${TABLE}."Q4" ;;
  }

  dimension: q5 {
    type: number
    sql: ${TABLE}."Q5" ;;
  }

  dimension: q6 {
    type: number
    sql: ${TABLE}."Q6" ;;
  }

  dimension: q7 {
    type: number
    sql: ${TABLE}."Q7" ;;
  }

  dimension: q8 {
    type: number
    sql: ${TABLE}."Q8" ;;
  }

  dimension: q9 {
    type: number
    sql: ${TABLE}."Q9" ;;
  }

  dimension: receptionistempcode {
    type: number
    sql: ${TABLE}."RECEPTIONISTEMPCODE" ;;
  }

  dimension: receptionistname {
    type: string
    sql: ${TABLE}."RECEPTIONISTNAME" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: scoresummary {
    type: string
    sql: ${TABLE}."SCORESUMMARY" ;;
  }

  dimension_group: submittime {
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
    sql: ${TABLE}."SUBMITTIME" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, receptionistname]
  }
}
