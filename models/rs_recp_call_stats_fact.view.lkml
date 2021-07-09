view: rs_recp_call_stats_fact {
  sql_table_name: "RS"."RS_RECP_CALL_STATS_FACT"
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

  dimension_group: day_of_shift {
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
    convert_tz: no
    sql: ${TABLE}."DATE" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: error_count {
    hidden: yes
    type: number
    sql: ${TABLE}."ERROR_COUNT" ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."RECEPTIONISTDESCRIPTION" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: total_calls {
    type: number
    sql: ${TABLE}."TOTAL_CALLS" ;;
  }

  dimension: total_time {
    hidden: yes
    type: number
    sql: ${TABLE}."TOTAL_TIME" ;;
  }

  dimension: longoffer {
    hidden: yes
    type: number
    sql: ${TABLE}."LONGOFFER" ;;
  }

  dimension: ana {
    hidden: yes
    type: number
    sql: ${TABLE}."ANA" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: sum_errors {
    type: sum
    sql: ${TABLE}."ERROR_COUNT";;
    drill_fields: [name,day_of_shift_date,error_count]
  }

  measure: sum_calls {
    type: sum
    sql: ${TABLE}."TOTAL_CALLS";;
    drill_fields: [name,day_of_shift_date,total_calls]
  }

  measure: sum_billable_minutes {
    type: sum
    sql: ${TABLE}."TOTAL_TIME";;
    drill_fields: [name,day_of_shift_date,total_calls]
  }

  measure: sum_longoffer {
    type: sum
    sql: ${longoffer}+${ana};;
    drill_fields: [name,day_of_shift_date,total_calls,sum_longoffer,long_offer_rate]
  }
  measure: sum_ana {
    hidden: yes
    type: sum
    sql: ${longoffer}+${ana};;
    drill_fields: [name,day_of_shift_date,total_calls,sum_longoffer,long_offer_rate]
  }

  measure: sum_parked {
    type: sum
    sql: ${TABLE}."PARKED";;
    drill_fields: [name,day_of_shift_date,total_calls,sum_parked]
  }

  measure: long_offer_rate {
    type: number
    value_format_name: percent_1
    sql: ${sum_longoffer}/NULLIF((${sum_calls}+${sum_ana}),0);;
    drill_fields: [name,day_of_shift_date,total_calls,sum_longoffer,long_offer_rate]
  }
}
