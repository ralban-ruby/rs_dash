view: scores {
  sql_table_name: "RS"."SCORES"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
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

  dimension: receptionistempcode {
    type: string
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

  dimension: count_calls {
    type: number
    sql: ${TABLE}."COUNT" ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}."TOTAL" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, receptionistname]
  }
}
