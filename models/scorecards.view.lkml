view: scorecards {
  sql_table_name: "RS"."SCORECARDS"
    ;;
  drill_fields: [id,submittime_date,receptionistname,evaluatoruser,score,scoresummary]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    hidden: yes
    sql: ${TABLE}."_FIVETRAN_DELETED" ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}."COMMENT" ;;
  }

  dimension: evaluatoruser {
    label: "Evaluator UserID"
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
    label: "Employee Code"
    type: number
    sql: ${TABLE}."RECEPTIONISTEMPCODE" ;;
  }

  dimension: receptionistname {
    label: "Name"
    type: string
    sql: ${TABLE}."RECEPTIONISTNAME" ;;
  }

  dimension: score_actual {
    type: number
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: scoresummary {
    type: string
    sql: ${TABLE}."SCORESUMMARY" ;;
  }

  dimension_group: submittime {
    label: "Created"
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

  dimension_group: submitdate {
    label: "Created_Date"
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
    html: {{ rendered_value | date: "%b '%y" }} ;;
  }

  dimension: count_scored {
    hidden: yes
    type: number
    sql: (CASE WHEN ${TABLE}."Q1" IS NULL THEN 0 ELSE 1 END) +
        (CASE WHEN ${TABLE}."Q2" IS NULL THEN 0 ELSE 1 END) +
        (CASE WHEN ${TABLE}."Q3" IS NULL THEN 0 ELSE 1 END) +
        (CASE WHEN ${TABLE}."Q4" IS NULL THEN 0 ELSE 1 END) +
        (CASE WHEN ${TABLE}."Q5" IS NULL THEN 0 ELSE 1 END) +
        (CASE WHEN ${TABLE}."Q6" IS NULL THEN 0 ELSE 1 END) +
        (CASE WHEN ${TABLE}."Q7" IS NULL THEN 0 ELSE 1 END) +
        (CASE WHEN ${TABLE}."Q8" IS NULL THEN 0 ELSE 1 END) +
        (CASE WHEN ${TABLE}."Q9" IS NULL THEN 0 ELSE 1 END) +
        (CASE WHEN ${TABLE}."Q10" IS NULL THEN 0 ELSE 1 END) ;;
  }

  dimension: sum_scored {
    hidden: yes
    type: number
    sql: IFNULL(${TABLE}."Q1",0)+IFNULL(${TABLE}."Q2",0)+
         IFNULL(${TABLE}."Q3",0)+IFNULL(${TABLE}."Q4",0)+IFNULL(${TABLE}."Q5",0)+
         IFNULL(${TABLE}."Q6",0)+IFNULL(${TABLE}."Q7",0)+
         IFNULL(${TABLE}."Q8",0)+IFNULL(${TABLE}."Q9",0)+IFNULL(${TABLE}."Q10",0) ;;
  }

  measure: sum_count_scored {
    hidden: yes
    type: sum
    sql: ${count_scored} ;;
  }

  measure: sum_sum_scored {
    hidden: yes
    type: sum
    sql: ${sum_scored} ;;
  }

  measure: score {
    type: number
    value_format_name: percent_0
    sql: ${score_actual}/1;;
  }

  measure: count {
    type: count_distinct
    sql: ${id} ;;
  }
}
