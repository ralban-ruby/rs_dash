view: employee_lookup_all {
  sql_table_name: "RS"."EMPLOYEE_LOOKUP_ALL"
    ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}."_FIVETRAN_DELETED" ;;
  }

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}."_FIVETRAN_ID" ;;
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

  dimension: conntypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."CONNTYPEID" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: employee_code {
    type: number
    sql: ${TABLE}."EMPLOYEE_CODE" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension_group: hire {
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
    sql: ${TABLE}."HIRE_DATE" ;;
  }

  dimension: icuserid {
    type: string
    sql: ${TABLE}."ICUSERID" ;;
  }

  dimension: legalname {
    type: string
    sql: ${TABLE}."LEGALNAME" ;;
  }

  dimension: location_desc {
    type: string
    sql: ${TABLE}."LOCATION_DESC" ;;
  }

  dimension: mailnickname {
    type: string
    sql: ${TABLE}."MAILNICKNAME" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: recordid {
    type: number
    value_format_name: id
    sql: ${TABLE}."RECORDID" ;;
  }

  dimension: samaccountname {
    type: string
    sql: ${TABLE}."SAMACCOUNTNAME" ;;
  }

  dimension: supervisor_primary {
    type: string
    sql: ${TABLE}."SUPERVISOR_PRIMARY" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension_group: termination {
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
    sql: ${TABLE}."TERMINATION_DATE" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  measure: count {
    type: count
    drill_fields: [name, legalname, mailnickname, samaccountname]
  }
}
