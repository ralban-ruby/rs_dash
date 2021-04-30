connection: "elt_connector"

include: "*.view"

explore: acw_call {}
explore: avail {}
explore: brb {}
explore: connections {}
explore: errors {}
explore: longoffers {}
explore: noacd_call {}
explore: ontime {}
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
    sql_on: ${topbar.employeeid} = ${totalcalls.employeeid} ;;
  }
}
explore: totalcalls {}
explore: totalseconds {}

datagroup: rs_coach_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rs_coach_default_datagroup
