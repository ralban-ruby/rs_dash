view: activity_inbound_call_detail {
  sql_table_name: "ACTIVITIES"."CALL_DETAIL"
    ;;
  dimension: inbound_call_detail_id {
    label: "Call Detail ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }
  dimension: ruby_call_id {
    label: "Call ID"
    type: string
    sql: ${TABLE}."RUBYCALLID" ;;
  }
  dimension: user_id {
    label: "Agent ID"
    type: string
    sql: ${TABLE}."USERID" ;;
  }

  dimension: offered_status {
    type: string
    sql: ${TABLE}."OFFEREDSTATUS" ;;
  }

  dimension: assigned_workgroup {
    label: "Queue"
    type: string
    sql: ${TABLE}."ASSIGNEDWORKGROUP" ;;
  }

  dimension_group: call_initiated {
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
      month,
      quarter,
      year
    ]
    datatype: timestamp
    sql: ${TABLE}."CALLINITIATEDTIME";;
  }

  dimension_group: call_queued {
    # skip_drill_filter: yes
    type: time
    timeframes: [
      raw,
      minute,
      second,
      date
    ]
    datatype: timestamp
    sql: ${TABLE}."CALLQUEUETIME";;
  }


  dimension_group: call_offered {
    # skip_drill_filter: yes
    type: time
    timeframes: [
      raw,
      minute,
      second,
      date
    ]
    datatype: timestamp
    sql: ${TABLE}."CALLOFFEREDTIME";;
  }


  dimension_group: call_connected {
    # skip_drill_filter: yes
    type: time
    timeframes: [
      raw,
      minute,
      second,
      date
    ]
    datatype: timestamp
    sql: ${TABLE}."CALLCONNECTEDTIME";;
  }


  dimension: pop_result {
    type: string
    sql: ${TABLE}."POPRESULT" ;;
  }

  dimension: next_queue {
    type: string
    sql: ${TABLE}."NEXT_WORKGROUP" ;;
  }

  dimension: segment_id {
    type: number
    sql: ${TABLE}."SEGMENT_ID" ;;
  }

  dimension: pop_queue_wait {
    type: number
    sql: ${TABLE}."QUEUEWAIT" ;;
  }

  dimension: pop_offer_wait {
    type: number
    sql: ${TABLE}."OFFERWAIT" ;;
  }

  dimension: pop_total_wait {
    type: number
    sql: ${TABLE}."TOTALWAIT" ;;
  }

  dimension: call_queue_wait {
    type: number
    sql: ${TABLE}."T_QUEUEWAIT" ;;
  }

  dimension: call_offer_wait {
    type: number
    sql: ${TABLE}."T_OFFERWAIT" ;;
  }

  dimension: call_total_wait {
    type: number
    sql: ${TABLE}."T_TOTALWAIT" ;;
  }

  dimension_group: segment_start {
    # skip_drill_filter: yes
    type: time
    timeframes: [
      raw,
      minute,
      second,
      date
    ]
    datatype: timestamp
    sql: ${TABLE}."SEGMENT_START";;
  }


  dimension_group: segment_end {
    # skip_drill_filter: yes
    type: time
    timeframes: [
      raw,
      minute,
      second,
      date
    ]
    datatype: timestamp
    sql: ${TABLE}."SEGMENT_END";;
  }

  dimension: segment_total {
    type: number
    sql: ${TABLE}."SEGMENT_TOTAL" ;;
  }


  dimension: picked_up {
    hidden: yes
    description: "This is a pop that was picked up by a receptionist, as opposed to NoACD Push, ANA, or abandoned."
    type: number
    sql: ${TABLE}."PICKED_UP" ;;
  }


  dimension: initial_wait {
    hidden: yes
    type: number
    sql: CASE WHEN ${segment_id} = 0 AND ${picked_up} = 1 THEN ${segment_total} END ;;
  }


  dimension: answered_by_4th_ring {
    type: number
    sql: CASE WHEN ${segment_id} = 0 AND ${picked_up} = 1 AND ${initial_wait} <= 20 THEN 1
      WHEN ${segment_id} = 0 AND ${picked_up} = 1 AND ${initial_wait} > 20 THEN 0 END ;;
  }

  measure: count_pops {
    description: "Number of pops assigned to receptionists."
    type: count_distinct
    sql: ${inbound_call_detail_id} ;;
  }

  measure: count_answered_calls {
    description: "Number of calls wrapped up by a receptionist."
    type: count_distinct
    filters: [answered_by_4th_ring: "1,0"]
    sql: ${ruby_call_id} ;;
  }

  measure: count_ab4r_calls {
    hidden: yes
    type: count_distinct
    filters: [answered_by_4th_ring: "1"]
    sql: ${ruby_call_id} ;;
  }


  measure: avg_answer_speed {
    description: "Average time for the call to be picked up."
    type: average
    value_format_name: decimal_1
    sql: ${initial_wait} ;;
  }


  measure: answer_by_4th_ring_rate {
    description: "Calls answered w/in 20s out of calls answered."
    type: number
    value_format_name: percent_2
    sql: ${count_ab4r_calls}/NULLIF(${count_answered_calls},0) ;;
  }


}
