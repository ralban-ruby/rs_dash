view: aspect_superstatehours_fact {
  sql_table_name: "PEARL_EDW_WFM"."ASPECT_SUPERSTATEHOURS_FACT"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: _fivetran_deleted {
    hidden: no
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

  dimension: aspectemployeeid {
    hidden: yes
    type: string
    sql: ${TABLE}."ASPECTEMPLOYEEID" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CREATEDDATE" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: employeecode {
    hidden: yes
    type: string
    sql: ${TABLE}."EMPLOYEECODE" ;;
  }

  dimension: employeeid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: minutes {
    hidden: yes
    type: number
    sql: ${TABLE}."MINUTES" ;;
  }

  dimension_group: modified {
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
    sql: ${TABLE}."MODIFIEDDATE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension_group: nominal {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."NOMINALDATE" ;;
  }

  dimension: superstateid {
    hidden: yes
    type: string
    sql: ${TABLE}."SUPERSTATEID" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: sum_minutes {
    type: sum
    sql: ${TABLE}."MINUTES";;
    drill_fields: [name,nominal_date,code,minutes]
  }

  measure: sum_hours {
    type: sum
    sql: ${TABLE}."MINUTES"/60.0;;
    drill_fields: [name,nominal_date,code,minutes]
  }

  measure: tier_hours {
    type: number
    sql: CASE WHEN FLOOR(${sum_hours}) <5 THEN 5
              WHEN FLOOR(${sum_hours}) between 6 and 10 THEN 10
              WHEN FLOOR(${sum_hours}) between 11 and 20 THEN 20
              WHEN FLOOR(${sum_hours}) between 21 and 30 THEN 30
              WHEN FLOOR(${sum_hours}) between 31 and 40 THEN 40
              WHEN FLOOR(${sum_hours}) between 41 and 50 THEN 50
              WHEN FLOOR(${sum_hours}) > 50 THEN 60
          ELSE 0 END;;
  }

}
