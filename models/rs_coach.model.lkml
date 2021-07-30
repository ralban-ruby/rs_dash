connection: "elt_connector"

include: "*.view"

explore: acw_call {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${acw_call.employeeid} = ${primarylink.employeeid};;
  }
}
explore: avail {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${avail.employeeid} = ${primarylink.employeeid};;
  }
}

explore: seemore_rollup {
    hidden: no
    join: primarylink {
      relationship: many_to_one
      type: full_outer
      sql_on: ${seemore_rollup.employeeid} = ${primarylink.employeeid} ;;
    }
}
explore: brb {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${brb.employeeid} = ${primarylink.employeeid};;
  }
}
explore: connections {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type:  left_outer
    sql_on: ${connections.employeeid} = ${primarylink.employeeid};;
  }
}
explore: errors {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${errors.employeeid} = ${primarylink.employeeid};;
  }
}
explore: longoffers {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: full_outer
    sql_on: ${longoffers.employeeid} = ${primarylink.employeeid};;
  }
}
explore: noacd_call {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${noacd_call.employeeid} = ${primarylink.employeeid};;
  }
}
explore: ontime {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type:  left_outer
    sql_on: ${ontime.employeeid} = ${primarylink.employeeid};;
  }
}
explore: primarylink { hidden: yes}
explore: talktime_call {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${talktime_call.employeeID} = ${primarylink.employeeid} ;;
  }
}
explore: topbar {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${topbar.employeeid} = ${primarylink.employeeid} ;;
  }
}
explore: totalcalls {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${totalcalls.employeeid} = ${primarylink.employeeid};;
  }
}

explore: scores_rollup {
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${scores_rollup.receptionistempcode} = ${primarylink.employee_code};;
  }
}

explore: scorecards {
  hidden: no
  # access_filter: {field:primarylink.employeeid
  #   user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${scorecards.receptionistempcode} = ${primarylink.employee_code};;
  }
}

explore: noacd_unavail_call {
  hidden: no
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${noacd_unavail_call.employeeid} = ${primarylink.employee_code};;
  }
}

explore: rs_ic_status_fact {
  label: "Receptionist Stats"
  view_label: "IC Statuses"
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
  join: employee_lookup_all {
    view_label: "Employee Info"
    relationship: many_to_one
    type: full_outer
    sql_on:  ${attendance_occurrences.empid} = ${employee_lookup_all.employeeid};;
  }
}

explore: recognitions_given {
  join: primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${recognitions_given.creator_emp_id} = ${primarylink.employee_code};;
  }
}

explore: recognitions_received {
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
