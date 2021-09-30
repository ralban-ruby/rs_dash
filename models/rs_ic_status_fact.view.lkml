view: rs_ic_status_fact {
  sql_table_name: "RS"."RS_IC_STATUS_FACT"
    ;;
  drill_fields: [id,day_of_shift_date,name,statuskey,statustimeinminutes]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  # dimension: _fivetran_deleted {
  #   type: yesno
  #   sql: ${TABLE}."_FIVETRAN_DELETED" ;;
  # }

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
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
    html: {{ rendered_value | date: "%m/%d/%Y" }} ;;
  }

  dimension: tenure_day {
    type: number
    label: "In Days"
    group_label: "Tenure"
    sql: DateDiff("day",${employee_lookup_all.hire_date},${TABLE}."DATE") ;;
  }

  dimension: tenure_month {
    type: number
    label: "In Months"
    group_label: "Tenure"
    sql: DateDiff("day",${employee_lookup_all.hire_date},${TABLE}."DATE") / 30.5 ;;
  }

  dimension: tenure_year {
    type: number
    label: "In Years"
    group_label: "Tenure"
    sql: DateDiff("day",${employee_lookup_all.hire_date},${TABLE}."DATE") / 365;;
  }

  dimension: tenure_tier {
    group_label: "Tenure"
    label: "By Tier"
    style: integer
    type: tier
    tiers: [0,30,60,90,120,180,365]
    sql: DateDiff("day",${employee_lookup_all.hire_date},${TABLE}."DATE");;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."RECEPTIONISTDESCRIPTION" ;;
  }

  dimension: statuskey {
    type: string
    sql: INITCAP(${TABLE}."STATUSKEY") ;;
  }

  dimension: statustimeinseconds {
    hidden: yes
    type: number
    sql: ${TABLE}."STATUSTIMEINSECONDS" ;;
  }

  dimension: statustimeinminutes {
    hidden: yes
    type: number
    sql: ${TABLE}."STATUSTIMEINSECONDS"/60.0 ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}."USERID" ;;
  }

  measure: sum_seconds {
    type: sum
    sql: ${TABLE}."STATUSTIMEINSECONDS";;
    drill_fields: [name,day_of_shift_date,statustimeinseconds]
  }

  measure: sum_minutes {
    type: sum
    sql: ${TABLE}."STATUSTIMEINSECONDS"/60.0;;
    drill_fields: [name,day_of_shift_date,statustimeinminutes]
  }

  measure: sum_hours {
    type: sum
    sql: ${TABLE}."STATUSTIMEINSECONDS"/3600.0;;
    drill_fields: [name,day_of_shift_date,statustimeinminutes]
  }
}
