view: activity_inbound_calls {
  sql_table_name: "ACTIVITIES"."INBOUND_CALLS"
    ;;

  drill_fields: [inbound_call_id,call_start_second,receptionist_name,billable_time,is_parked,dnis,did,wrap_up,tag,type]


  dimension: inbound_call_id {
    hidden: yes
    type: string
    sql: ${TABLE}."_ID" ;;
  }

  dimension: ruby_call_id {
    label: "Call ID"
    type: string
    sql: ${TABLE}."RUBY_CALL_UUID" ;;
  }

  dimension_group: call_start {
    # skip_drill_filter: yes
    type: time
    timeframes: [
      raw,
      hour_of_day,
      minute30,
      minute15,
      minute5,
      minute,
      second,
      date,
      week,
      day_of_week,
      day_of_month,
      month,
      quarter,
      year
    ]
    datatype: timestamp
    sql: ${TABLE}."START_TIME_UTC";;
  }

  dimension: is_weekend {
    type: yesno
    sql: ${call_start_day_of_week} in ('Saturday','Sunday') ;;
  }

  dimension: visible_to_customer {
    label: "Visible to Customer"
    type: yesno
    sql: ${TABLE}."VISIBLE_TO_CLIENT_FLAG" ;;
  }

  dimension: billable {
    type: yesno
    sql: ${TABLE}."BILLABLE_FLAG" ;;
  }

  dimension: client_uuid {
    type: string
    sql: ${TABLE}."CLIENT_UUID" ;;
  }

  dimension: receptionist_name {
    type: string
    sql: ${TABLE}."RECEPTIONIST_DESCRIPTION" ;;
  }

  dimension: caller_id {
    type: string
    sql: ${TABLE}."CALLER_IDNUMBER" ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}."CALL_TAG_DESCRIPTION" ;;
  }

  dimension: wrap_up {
    type: string
    sql: ${TABLE}."CALL_RESULT_DESCRIPTION" ;;
  }

  dimension: type {
    type: string
    sql: CASE WHEN ${TABLE}."CALL_TYPE_DESCRIPTION" = 'Inbound call.' THEN 'Abandoned call.'
      ELSE ${TABLE}."CALL_TYPE_DESCRIPTION" END ;;
  }

  dimension: is_park_hangup {
    type: yesno
    sql: ${TABLE}."CALL_TYPE_DESCRIPTION" = 'Inbound call.' and ${park_time}>0 ;;
  }

  dimension: billable_time {
    type: number
    sql: ${TABLE}."BILLABLE_TIME_SECONDS" ;;
  }

  dimension: receptionist_time_raw {
    type: number
    sql: ${TABLE}."AttendantTimeSeconds" ;;
  }

  dimension: park_time {
    type: number
    sql: ${TABLE}."PARKSECONDS" ;;
  }

  dimension: dnis {
    type: string
    sql: ${TABLE}."DNIS" ;;
  }

  dimension: did {
    type: string
    sql: ${TABLE}."DID" ;;
  }

  dimension: is_offered {
    hidden: yes
    sql: ${TABLE}."CALL_TYPE_DESCRIPTION" in ('Receptionist-handled call.','Inbound call.');;
  }


  dimension: is_abandoned {
    type: yesno
    sql: ${TABLE}."CALL_TYPE_DESCRIPTION" = 'Inbound call.';;
  }

  dimension: is_parked {
    type: yesno
    sql: ${TABLE}."PARKSECONDS" > 0;;
  }

  dimension: is_handed {
    hidden: yes
    type: yesno
    sql: ${TABLE}."CALL_TYPE_DESCRIPTION" = 'Receptionist-handled call.';;
  }


  measure: calls_in_system {
    description: "Inbound calls that entered the Call_Ruby workgroup including receptionionist-handled, roboblocked, and auto-attendance transfers."
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}."_ID" ;;
  }

  dimension: call_log {
    type: string
    sql: ${TABLE}."CALL_LOG" ;;
  }

  measure: calls_offered {
    description: "Inbound calls that entered the Call_Ruby workgroup (Receptionist Handled and Abandoned)."
    type: count_distinct
    value_format_name: decimal_0
    # sql: CASE WHEN ${TABLE}."CALL_TYPE_DESCRIPTION" in ('Receptionist-handled call.','Inbound call.')
    #   THEN ${TABLE}."_ID" ELSE NULL END ;;
    sql: ${TABLE}."_ID" ;;
    filters: [is_offered: "yes"]
  }

  measure: calls_handled {
    description: "Inbound calls that were wrapped up by a receptionist."
    type: count_distinct
    value_format_name: decimal_0
    # sql: CASE WHEN ${TABLE}."CALL_TYPE_DESCRIPTION" = 'Receptionist-handled call.'
    #   THEN ${TABLE}."_ID" ELSE NULL END ;;
    sql: ${TABLE}."_ID" ;;
    filters: [type: "Receptionist-handled call."]
  }

  measure: calls_roboblocked {
    description: "Inbound calls that were roboblocked and sent to VM."
    type: count_distinct
    value_format_name: decimal_0
    filters: [type: "RoboCall."]
    sql: ${TABLE}."_ID" ;;
  }

  measure: program_xfrs {
    description: "Inbound calls that bypass Call_Ruby through a program transfer or auto-attendant."
    type: count_distinct
    value_format_name: decimal_0
    filters: [type: "Programmed Transfer."]
    sql: ${TABLE}."_ID" ;;
  }

  measure: count_callers {
    description: "Distinct callerIDs within the timeframe."
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}."CALLER_IDNUMBER" ;;
  }

  measure: calls_abandoned {
    description: "Inbound calls that entered Call_Ruby but were abandoned before being assigned."
    type: count_distinct
    value_format_name: decimal_0
    filters: [is_abandoned: "yes"]
    sql: ${TABLE}."_ID" ;;
  }

  measure: calls_parked {
    description: "Inbound calls with ParkSeconds > 0."
    type: count_distinct
    value_format_name: decimal_0
    filters: [is_parked: "yes"]
    sql: ${TABLE}."_ID" ;;
  }

  measure: abandoned_parks {
    description: "Calls that were parked and then abandoned."
    type: count_distinct
    value_format_name: decimal_0
    filters: [is_park_hangup: "yes"]
    sql: ${TABLE}."_ID" ;;
  }

  measure: abandon_rate {
    description: "Abandoned calls divided by calls offered."
    type: number
    value_format_name: percent_2
    sql: ${calls_abandoned}/NULLIF(${calls_offered},0) ;;
  }

  measure: park_rate {
    description: "Parked calls divided by calls handled."
    type: number
    value_format_name: percent_2
    sql: ${calls_parked}/NULLIF(${calls_handled},0) ;;
  }

  measure: avg_park_time {
    type: average
    sql: ${TABLE}."PARKSECONDS" ;;
    value_format_name: decimal_1
  }

}
