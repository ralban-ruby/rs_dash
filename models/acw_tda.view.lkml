view: acw_tda {
  sql_table_name: "RS"."ACW_TDA"
    ;;

  dimension: employeeid {
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: legalname {
    type: string
    sql: ${TABLE}."LEGALNAME" ;;
  }

  dimension: minutes {
    type: number
    sql: ${TABLE}."MINUTES" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: seconds {
    type: number
    sql: ${TABLE}."SECONDS" ;;
  }

  dimension: statuskey {
    type: string
    sql: ${TABLE}."STATUSKEY" ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}."USERID" ;;
  }

  measure: count {
    type: count
    drill_fields: [legalname, name]
  }
}
