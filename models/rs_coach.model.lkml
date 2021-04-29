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
explore: topbar {}
explore: totalcalls {}
explore: totalseconds {}

datagroup: rs_coach_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rs_coach_default_datagroup
