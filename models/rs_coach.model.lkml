connection: "elt_connector"

include: "*.view"

explore: acw_call {}
explore: avail {
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${avail.employeeid} = ${primarylink.employeeid};;
  }
}
explore: brb {
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${brb.employeeid} = ${primarylink.employeeid};;
  }
}
explore: connections {
  join:  primarylink {
    relationship: one_to_one
    type:  left_outer
    sql_on: ${connections.employeeid} = ${primarylink.employeeid};;
  }
}
explore: errors {
  join:  primarylink {
    relationship: one_to_one
    type: full_outer
    sql_on: ${errors.employeeid} = ${primarylink.employeeid};;
  }
}
explore: longoffers {
  join:  primarylink {
    relationship: one_to_one
    type: full_outer
    sql_on: ${longoffers.employeeid} = ${primarylink.employeeid};;
  }
}
explore: noacd_call {
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${noacd_call.employeeid} = ${primarylink.employeeid};;
  }
}
explore: ontime {
  join:  primarylink {
    relationship: one_to_one
    type:  left_outer
    sql_on: ${ontime.employeeid} = ${primarylink.employeeid};;
  }
}
explore: primarylink {}
explore: talktime_call {}
explore: topbar {
  join:  primarylink {
    relationship: one_to_one
    type: left_outer
    sql_on: ${topbar.employeeid} = ${primarylink.employeeid} ;;
  }
  join:  totalcalls {
    relationship: one_to_one
    type: left_outer
    sql_on: ${primarylink.employeeid} = ${totalcalls.employeeid} ;;
  }
  join:  talktime_call {
    relationship: one_to_one
    type: left_outer
    sql_on: ${topbar.employeeid} = ${talktime_call.employeeID} ;;
  }
  join:  acw_call {
    relationship: one_to_one
    type: left_outer
    sql_on: ${topbar.employeeid} = ${acw_call.employeeid} ;;
  }
}
explore: totalcalls {}
explore: totalseconds {}

datagroup: rs_coach_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rs_coach_default_datagroup
