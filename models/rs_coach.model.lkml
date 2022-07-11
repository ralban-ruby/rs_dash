connection: "elt_connector"

include: "*.view"

explore: acw_call {
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${acw_call.employeeid} = ${primarylink.employeeid};;
  }
}

explore: acw_call_view_all {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${acw_call_view_all.employeeid} = ${primarylink.employeeid};;
  }
}

explore: avail_tda {
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${avail_tda.empid} = ${primarylink.employeeid};;
  }
}
explore: brb_tda {
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${brb_tda.employeeid} = ${primarylink.employeeid};;
  }
}

explore: activity_inbound_calls {
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join: activity_inbound_call_detail {
    relationship: one_to_many
    type: left_outer
    sql_on:  UPPER(${activity_inbound_calls.ruby_call_id}) = ${activity_inbound_call_detail.ruby_call_id};;
  }
  join: primarylink {
    relationship: many_to_one
    type: left_outer
    sql_on: upper(${activity_inbound_calls.receptionist_name}) = upper(${primarylink.name});;
  }
  join:acw_tda {
    relationship: many_to_one
    type: left_outer
    sql_on:  ${acw_tda.employeeid} = ${primarylink.employeeid};;
  }
}


explore: avail {
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${avail.employeeid} = ${primarylink.employeeid};;
  }
}

explore: avail_all_view {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${avail_all_view.employeeid} = ${primarylink.employeeid};;
  }
}

explore: seemore_rollup {
    hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
    join: primarylink {
      relationship: many_to_one
      type: full_outer
      sql_on: ${seemore_rollup.employeeid} = ${primarylink.employeeid} ;;
    }
}
explore: seemore_rollup_new {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join: primarylink {
    relationship: many_to_one
    type: full_outer
    sql_on: ${seemore_rollup_new.employeeid} = ${primarylink.employeeid} ;;
  }
}
explore: seemore_rollup_new_all {
  hidden: no
  join: employee_lookup_all {
    relationship: many_to_one
    type: full_outer
    sql_on: ${seemore_rollup_new_all.employeeid} = ${employee_lookup_all.employeeid} ;;
  }
}

explore: brb {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${brb.employeeid} = ${primarylink.employeeid};;
  }
}

explore: brb_view_all {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${brb_view_all.employeeid} = ${primarylink.employeeid};;
  }
}

explore: connections {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type:  left_outer
    sql_on: ${connections.employeeid} = ${primarylink.employeeid};;
  }
}
explore: errors {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${errors.employeeid} = ${primarylink.employeeid};;
  }
}
explore: longoffers {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: full_outer
    sql_on: ${longoffers.employeeid} = ${primarylink.employeeid};;
  }
}
explore: rs_recap_longoffer_ana_data {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: full_outer
    sql_on: ${rs_recap_longoffer_ana_data.employeeid} = ${primarylink.employeeid};;
  }
}
explore: rs_recap_longoffer_ana_all {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: full_outer
    sql_on: ${rs_recap_longoffer_ana_all.employeeid} = ${primarylink.employeeid};;
  }
}
explore: longoffers_all_view {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: full_outer
    sql_on: ${longoffers_all_view.employeeid} = ${primarylink.employeeid};;
  }
}

explore: noacd_call {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${noacd_call.employeeid} = ${primarylink.employeeid};;
  }
}
explore: ontime {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type:  left_outer
    sql_on: ${ontime.employeeid} = ${primarylink.employeeid};;
  }
}
explore: primarylink { hidden: yes   access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}}
explore: talktime_call {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${talktime_call.employeeID} = ${primarylink.employeeid} ;;
  }
}
explore: topbar {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${topbar.employeeid} = ${primarylink.employeeid} ;;
  }
}
explore: totalcalls {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${totalcalls.employeeid} = ${primarylink.employeeid};;
  }
}

explore: scores_rollup {
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${scores_rollup.receptionistempcode} = ${primarylink.employee_code};;
  }
}

explore: scorecards {
  hidden: no
   access_filter: {field:primarylink.employeeid
     user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${scorecards.receptionistempcode} = ${primarylink.employee_code};;
  }
}

explore: noacd_unavail_call {
  hidden: no
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${noacd_unavail_call.employeeid} = ${primarylink.employeeid};;
  }
}

explore: rs_ic_status_fact {
  label: "Receptionist Stats"
  view_label: "IC Statuses"
  access_filter: {field:employee_lookup_all.employeeid
    user_attribute:employee_id}
  join: rs_recp_call_stats_fact {
    view_label: "Calls"
    relationship: many_to_one
    type: full_outer
    sql_on: ${rs_ic_status_fact.name} = ${rs_recp_call_stats_fact.name}
      and ${rs_ic_status_fact.day_of_shift_date} = ${rs_recp_call_stats_fact.day_of_shift_date} ;;
  }
  join: employee_lookup_all {
    view_label: "Current Employee Info"
    relationship: many_to_one
    type: full_outer
    sql_on:  ${rs_ic_status_fact.name} = ${employee_lookup_all.name};;
  }
  join: aspect_superstate_hours {
    view_label: "Aspect Superstate Hours"
    relationship: many_to_many
    type: full_outer
    sql_on: ${rs_ic_status_fact.name} = ${aspect_superstate_hours.name}
      and ${rs_ic_status_fact.day_of_shift_date} = ${aspect_superstate_hours.nominal_date} ;;
  }
}

explore: attendance_occurrences {
  label: "Attendance Occurrences"
  access_filter: {field:employee_lookup_all.employeeid
    user_attribute:employee_id}
  join: employee_lookup_all {
    view_label: "Employee Info"
    relationship: many_to_one
    type: full_outer
    sql_on:  ${attendance_occurrences.empid} = ${employee_lookup_all.employeeid};;
  }
}

    explore: fact_adherence_occurrences {
      label: "Attendance Occurrences Calabrio"
      access_filter: {field:employee_lookup_all.employeeid
        user_attribute:employee_id}
      join: employee_lookup_all {
        view_label: "Employee Info"
        relationship: many_to_one
        type: full_outer
        sql_on:  ${fact_adherence_occurrences.employee_code} = ${employee_lookup_all.employee_code};;
      }
    }

explore: recognitions_given {
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join: primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${recognitions_given.creator_emp_id} = ${primarylink.employee_code};;
  }
}

explore: recognitions_received {
  access_filter: {field:primarylink.employeeid
    user_attribute:employee_id}
  join: primarylink {
    relationship: many_to_one
    type: left_outer
    sql_on: ${recognitions_received.recipient_emp_id} = ${primarylink.employee_code};;
  }
}
explore: totalseconds {hidden: no}

datagroup: rs_coach_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rs_coach_default_datagroup
