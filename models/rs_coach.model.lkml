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

datagroup: rs_coach_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rs_coach_default_datagroup
