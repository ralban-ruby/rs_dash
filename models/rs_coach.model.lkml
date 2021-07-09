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
  hidden: no
  # access_filter: {field:primarylink.employeeid
  #   user_attribute:employee_id}
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${scores_rollup.receptionistempcode} = ${primarylink.employee_code};;
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
explore: totalseconds {hidden: no}

explore: rs_quality_scorecard_fact{
  label: "RS Service Quality Scorecards"
  view_label: "Receptionist Scorecards"
  join: employee_lookup_all {
    view_label: "Employee Info"
    relationship: many_to_one
    type: full_outer
    sql_on:  ${rs_quality_scorecard_fact.receptionistempcode} = ${employee_lookup_all.employee_code};;
  }
  join: pc_quality_scorecard_factv2 {
    view_label: "Chat Scorecards"
    relationship: one_to_many
    type: full_outer
    sql_on:  ${pc_quality_scorecard_factv2.chatspecialistempcode} = ${employee_lookup_all.employeeid};;
  }
  join: aspect_superstatehours_fact {
    view_label: "Aspect Superstate Hours"
    relationship: many_to_many
    type: full_outer
    sql_on: TO_CHAR(${rs_quality_scorecard_fact.receptionistempcode}) = TO_CHAR(${aspect_superstatehours_fact.employeecode})
      and ${rs_quality_scorecard_fact.submitdate_date} = ${aspect_superstatehours_fact.nominal_date} ;;
  }
}
datagroup: rs_coach_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rs_coach_default_datagroup
